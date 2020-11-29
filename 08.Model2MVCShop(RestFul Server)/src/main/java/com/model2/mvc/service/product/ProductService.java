package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


public interface ProductService {
	
	// 상품 등록
	public void addProduct(Product product) throws Exception;

	// 상품정보 확인
	public Product getProduct(int prodNo) throws Exception;
	
	// 마지막으로 등록한 상품 번호
	public int getLastProdNo() throws Exception;

	// 상품정보 리스트
	public Map<String, Object> getProductList(Search search) throws Exception;

	// 상품정보 수정
	public void updateProduct(Product product) throws Exception;
	
	// 상품정보 이미지 파일 보기 
	public List<String> uploadFileView(Product product, String path) throws Exception;
	
	// 상품정보 이미지 파일 추가 및 수정
	public List<String> uploadFile(Product product, String path, List<MultipartFile> files) throws Exception;
	
}