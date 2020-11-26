package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
	
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {

		System.out.println("/product/addProduct : POST");
		//Business Logic
		product.setManuDate(product.getManuDate().replace("-",""));
		productService.addProduct(product);
		
		return "forward:/product/productView.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo, Model model ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
//	@RequestParam("fileName") MultipartFile file
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, MultipartHttpServletRequest request) throws Exception{

		System.out.println("/product/updateProduct : POST");
		//Business Logic
		
		String path = "C:\\workspace\\git\\minipro\\minipro\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles";
		
		System.out.println(path);
		
		MultipartFile file = request.getFile("imageFile");
		System.out.println(!file.getOriginalFilename().isEmpty());
		
		
		if(!file.getOriginalFilename().isEmpty()) {
			
			String pathName = file.getOriginalFilename();
			int idx = pathName.lastIndexOf("\\");
			if(idx == -1) {
				idx = pathName.lastIndexOf("/");
			}
			String fileName = pathName.substring(idx + 1);
			product.setFileName(fileName);
			file.transferTo(new File(path, fileName));
		}
		
		
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=manage";
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct : GET / POST");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	
//	@RequestMapping("/addProductView.do")
//	public ModelAndView addProductView() throws Exception {
//
//		System.out.println("/addProductView.do");
//		
//		return new ModelAndView("redirect:/product/addProductView.jsp");
//	}
//	
//	@RequestMapping("/addProduct.do")
//	public ModelAndView addProduct( @ModelAttribute("product") Product product ) throws Exception {
//
//		System.out.println("/addProduct.do");
//		//Business Logic
//		product.setManuDate(product.getManuDate().replace("-",""));
//		productService.addProduct(product);
//		
//		return new ModelAndView("forward:/product/productView.jsp");
//	}
//	
//	@RequestMapping("/getProduct.do")
//	public ModelAndView getProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
//		
//		System.out.println("/getProduct.do");
//		//Business Logic
//		Product product = productService.getProduct(prodNo);
//		// Model �� View ����
//		ModelAndView modelAndView = new ModelAndView("forward:/product/getProduct.jsp");
//		modelAndView.addObject("product", product);
//		
//		return modelAndView;
//	}
//	
//	@RequestMapping("/updateProductView.do")
//	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
//
//		System.out.println("/updateProductView.do");
//		//Business Logic
//		Product product = productService.getProduct(prodNo);
//		// Model �� View ����
//		model.addAttribute("product", product);
//		
//		return "forward:/product/updateProduct.jsp";
//	}
//	
//	@RequestMapping("/updateProduct.do")
//	public ModelAndView updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{
//
//		System.out.println("/updateProduct.do");
//		//Business Logic
//		productService.updateProduct(product);
//		ModelAndView modelAndView = new ModelAndView("redirect:/getProduct.do?prodNo="+product.getProdNo()+"&menu=manage");
//		
//		return modelAndView;
//	}
//	
//	@RequestMapping("/listProduct.do")
//	public ModelAndView listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
//		
//		System.out.println("/listProduct.do");
//		
//		if(search.getCurrentPage() == 0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		// Business logic ����
//		Map<String , Object> map = productService.getProductList(search);
//		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		// Model �� View ����
//		ModelAndView modelAndView = new ModelAndView("forward:/product/listProduct.jsp");
//		modelAndView.addObject("list", map.get("list"));
//		modelAndView.addObject("resultPage", resultPage);
//		modelAndView.addObject("search", search);
//		
//		return modelAndView;
//	}
}