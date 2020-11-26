package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;


public interface PurchaseService {

	// ��ǰ ����
	public void addPurchase(Purchase purchase) throws Exception;
	
	// ���� ��ǰ Ȯ��
	public Purchase getPurchase(int tranNo) throws Exception;
	
	public Purchase getPurchase2(int prodNo) throws Exception;
	
	// ���� ��ǰ ����Ʈ
	public Map<String,Object> getPurchaseList(Search search, String buyerId) throws Exception;
	
	// �ȸ� ��ǰ ����Ʈ
	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	// ���� ���� ����
	public void updatePurchase(Purchase purchase) throws Exception;
	
	// ��� ���� ����
	public String updateTranCode(int tranNo, String tranCode) throws Exception;
	
}