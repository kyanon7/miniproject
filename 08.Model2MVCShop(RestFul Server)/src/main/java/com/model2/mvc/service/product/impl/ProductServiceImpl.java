package com.model2.mvc.service.product.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);
	}
	
	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}
	
	public int getLastProdNo() throws Exception{
		return productDao.lastProductNo();
	}
	
	public Map<String, Object> getProductList(Search search) throws Exception {
		
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", Integer.valueOf(totalCount));
		
		return map;
	}
	
	public void updateProduct(Product product) throws Exception {
		productDao.updateProduct(product);
	}
	
	public List<String> uploadFileView(Product product, HttpServletRequest request) throws Exception{
		
		String path = request.getSession().getServletContext().getRealPath("/images/uploadFiles/"+(product.getProdNo() - 10000)/250);
		File files[] = new File(path).listFiles();
		List<String> fileList = new ArrayList<String>();
		if(files.length > 0 && product.getFileName() != null && !product.getFileName().equals("")) {
			for(int i = 0; i < files.length; i++) {
				File file = files[i];
				if(file.getName().startsWith(product.getFileName()) && !(product.getFileName()).isEmpty()) {
					fileList.add((product.getProdNo() - 10000)/250+"\\"+file.getName());
				}
			}
		}
		return fileList;
	}
	
	public List<String> uploadFile(Product product, MultipartHttpServletRequest request) throws Exception{
		
		List<MultipartFile> files = request.getFiles("imageFile");
		String path = request.getSession().getServletContext().getRealPath("/images/uploadFiles/"+(product.getProdNo() - 10000)/250);
		
		String identify = UUID.randomUUID().toString();
		StringBuffer fileNames = new StringBuffer(identify);
		List<String> fileList = new ArrayList<String>();
		
		
		if(!files.isEmpty() && !files.get(0).getOriginalFilename().equals("")) {
			File file = new File(path);
			if(file.exists() == false) {
				file.mkdirs();
			}
			
			for(int i = 0; i < files.size(); i++) {
				String pathName = files.get(i).getOriginalFilename();
				int idx = pathName.lastIndexOf("\\");
				if(idx == -1) {
					idx = pathName.lastIndexOf("/");
				}
				String fileName = identify+"_"+pathName.substring(idx + 1);
				files.get(i).transferTo(new File(path, fileName));
				fileList.add((product.getProdNo() - 10000)/250+"\\"+fileName);
				
			}
			product.setFileName(fileNames.toString());
		}
		
		return fileList;
	}
}
