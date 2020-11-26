package com.model2.mvc.service.prurchase.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	public int tranNo = 10065;

	//@Test
	public void testAddPurchase() throws Exception {
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		purchase.setTranNo(tranNo);
		product.setProdNo(10013);
		purchase.setPurchaseProd(product);
		user.setUserId("user13");
		purchase.setBuyer(user);
		purchase.setPaymentOption("000");
		purchase.setReceiverName("��ı");
		purchase.setReceiverPhone("010-2034-1034");
		purchase.setDivyAddr("�ּҴپƾƾ�");
		purchase.setDivyRequest("���� ���ٴ޶���̾�");
		purchase.setTranCode("000");
		purchase.setDivyDate("20201122");
		
		purchaseService.addPurchase(purchase);
		
		System.out.println(purchase);
		
		purchase = purchaseService.getPurchase(tranNo);

		//==> console Ȯ��
		System.out.println(purchase);
		
		//==> API Ȯ��
		Assert.assertEquals(tranNo, purchase.getTranNo());
		Assert.assertEquals(10013, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user13", purchase.getBuyer().getUserId());
		Assert.assertEquals("000", purchase.getPaymentOption());
		Assert.assertEquals("��ı", purchase.getReceiverName());
		Assert.assertEquals("010-2034-1034", purchase.getReceiverPhone());
		Assert.assertEquals("�ּҴپƾƾ�", purchase.getDivyAddr());
		Assert.assertEquals("���� ���ٴ޶���̾�", purchase.getDivyRequest());
		Assert.assertEquals("000", purchase.getTranCode());
		Assert.assertEquals("20201122", purchase.getDivyDate().substring(0, 10).replace("-", ""));
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		
		Purchase purchase = new Purchase();
		
		purchase = purchaseService.getPurchase(tranNo);

		//==> console Ȯ��
		System.out.println(purchase);
		
		//==> API Ȯ��
		Assert.assertEquals(tranNo, purchase.getTranNo());
		Assert.assertEquals(10013, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user13", purchase.getBuyer().getUserId());
		Assert.assertEquals("000", purchase.getPaymentOption());
		Assert.assertEquals("��ı", purchase.getReceiverName());
		Assert.assertEquals("010-2034-1034", purchase.getReceiverPhone());
		Assert.assertEquals("�ּҴپƾƾ�", purchase.getDivyAddr());
		Assert.assertEquals("���� ���ٴ޶���̾�", purchase.getDivyRequest());
		Assert.assertEquals("000", purchase.getTranCode());
		Assert.assertEquals("20201122", purchase.getDivyDate().substring(0, 10).replace("-", ""));

//		Assert.assertNotNull(purchaseService.getPurchase(10100));
		Assert.assertNotNull(purchaseService.getPurchase(tranNo));
	}
	
	//@Test
	public void testUpdatePurchase() throws Exception{
		 
		Purchase purchase = purchaseService.getPurchase(tranNo);
		Assert.assertNotNull(purchase);
		
		Assert.assertEquals(tranNo, purchase.getTranNo());
		Assert.assertEquals(10013, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user13", purchase.getBuyer().getUserId());
		Assert.assertEquals("000", purchase.getPaymentOption());
		Assert.assertEquals("��ı", purchase.getReceiverName());
		Assert.assertEquals("010-2034-1034", purchase.getReceiverPhone());
		Assert.assertEquals("�ּҴپƾƾ�", purchase.getDivyAddr());
		Assert.assertEquals("���� ���ٴ޶���̾�", purchase.getDivyRequest());
		Assert.assertEquals("000", purchase.getTranCode());
		Assert.assertEquals("20201122", purchase.getDivyDate().substring(0, 10).replace("-", ""));

		purchase.setPaymentOption("001");
		purchase.setReceiverName("����13");
		purchase.setReceiverPhone("010-3156-3634");
		purchase.setDivyAddr("����ּ�");
		purchase.setDivyRequest("������ �ȵȴٸ��̾�");
		
		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(tranNo);
		Assert.assertNotNull(purchase);
		
		//==> console Ȯ��
		System.out.println(purchase);
			
		//==> API Ȯ��
		Assert.assertEquals("001", purchase.getPaymentOption());
		Assert.assertEquals("����13", purchase.getReceiverName());
		Assert.assertEquals("010-3156-3634", purchase.getReceiverPhone());
		Assert.assertEquals("����ּ�", purchase.getDivyAddr());
		Assert.assertEquals("������ �ȵȴٸ��̾�", purchase.getDivyRequest());
	 }
	 
	
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	 //@Test
	 public void testGetPurchaseListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	String buyerId = "user13";
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetSaleListAll() throws Exception{
		
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = purchaseService.getSaleList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = purchaseService.getSaleList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 @Test
	 public void testGetPurchaseListByTranNo() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(Integer.toString(tranNo));
	 	
	 	String buyerId = "user13";
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetSaleListByTranNo() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("�Ｚ");
	 	
	 	Map<String,Object> map = purchaseService.getSaleList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = purchaseService.getSaleList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
}