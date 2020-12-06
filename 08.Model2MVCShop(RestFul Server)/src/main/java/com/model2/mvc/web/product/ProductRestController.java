package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public ProductRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping( value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct( @RequestBody Product product/*, MultipartHttpServletRequest request*/ ) throws Exception {
		
		System.out.println("/product/json/addProduct : POST");
		
		product.setManuDate(product.getManuDate().replace("-",""));
		productService.addProduct(product);
		product.setProdNo(productService.getLastProdNo());
		
//		productService.uploadFile(product, request);
		productService.updateProduct(product);
		
		return productService.getProduct(product.getProdNo());
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct( @PathVariable int prodNo ) throws Exception {
		
		System.out.println("/product/json/getProduct : GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping( value="json/updateProduct/{prodNo}", method=RequestMethod.GET)
	public Product updateProduct( @PathVariable int prodNo ) throws Exception {
		
		System.out.println("/product/json/getProduct : GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct( @RequestBody Product product/*, MultipartHttpServletRequest request*/ ) throws Exception {
		
		System.out.println("/product/json/addProduct : POST");
		
//		productService.uploadFile(product, request);
		productService.updateProduct(product);
		
		return productService.getProduct(product.getProdNo());
	}
	
	@RequestMapping(value="json/listProduct", method=RequestMethod.GET)
	public Map<String, Object> getListProduct( @ModelAttribute("search") Search search ) throws Exception{
		
		System.out.println("/product/json/listProduct : GET / POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		if(search.getPageSize() == 0) {
			search.setPageSize(pageSize);
		};
		
		// Business logic 수행
		Map<String , Object> listMap = productService.getProductList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.get("totalCount")).intValue(), pageUnit, pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		
		// Model 과 View 연결
		map.put("list", listMap.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
	
	@RequestMapping(value="json/listProduct", method=RequestMethod.POST)
	public Map<String, Object> listProduct( @RequestBody Search search) throws Exception{
		
		System.out.println("/product/json/listProduct : GET / POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		if(search.getPageSize() == 0) {
			search.setPageSize(pageSize);
		};
		
		// Business logic 수행
		Map<String , Object> listMap = productService.getProductList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.get("totalCount")).intValue(), pageUnit, pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		
		// Model 과 View 연결
		map.put("list", listMap.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
	
}
