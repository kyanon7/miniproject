package com.model2.mvc.web.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
	
}
