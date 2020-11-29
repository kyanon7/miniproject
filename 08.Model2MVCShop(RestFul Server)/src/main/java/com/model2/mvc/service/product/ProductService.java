package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


public interface ProductService {
	
	// ��ǰ ���
	public void addProduct(Product product) throws Exception;

	// ��ǰ���� Ȯ��
	public Product getProduct(int prodNo) throws Exception;
	
	// ���������� ����� ��ǰ ��ȣ
	public int getLastProdNo() throws Exception;

	// ��ǰ���� ����Ʈ
	public Map<String, Object> getProductList(Search search) throws Exception;

	// ��ǰ���� ����
	public void updateProduct(Product product) throws Exception;
	
	// ��ǰ���� �̹��� ���� ���� 
	public List<String> uploadFileView(Product product, String path) throws Exception;
	
	// ��ǰ���� �̹��� ���� �߰� �� ����
	public List<String> uploadFile(Product product, String path, List<MultipartFile> files) throws Exception;
	
}