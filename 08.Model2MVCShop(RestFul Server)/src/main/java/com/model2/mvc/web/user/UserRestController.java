package com.model2.mvc.web.user;


import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public User addUser( @RequestBody User user ) throws Exception{
		
		System.out.println("/user/json/addUser : POST");
		
		userService.addUser(user);
		
		return userService.getUser(user.getUserId());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/updateUser/{userId}", method=RequestMethod.GET )
	public User updateUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/UpdateUser : GET");
		
		User user = userService.getUser(userId);
		
		return user;
	}
	
	@RequestMapping( value="json/updateUser", method=RequestMethod.POST)
	public User updateUser(@RequestBody User user, HttpServletRequest request) throws Exception{
		
		System.out.println("/user/json/UpdateUser : POST");
		
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			throw new Exception();
			
		}else if(session.getAttribute("user") != null && session.getAttribute("user") instanceof User){
			
			userService.updateUser(user);
			
			if(((User)session.getAttribute("user")).getUserId().equals(user.getUserId())){
				session.setAttribute("user", user);
			}
		}
		
		User user01 = userService.getUser(user.getUserId());
		
		return user01;
	}
	
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	@RequestMapping( value="json/logout" )
	public User logout(HttpServletRequest request) throws Exception{
		
		System.out.println("/user/json/logout : GET / POST");
		
		HttpSession session = request.getSession();
		User user = new User();
		
		if(session.getAttribute("user") == null) {
			System.out.println("���� �α����� ���� �ʾҽ��ϴ�. ������ �ʱ�ȭ�մϴ�.");
			user.setUserId("logoff");
		}else {
			System.out.println("�α��ε� �����Դϴ�. �α׾ƿ��� �����մϴ�.");
			user.setUserId("logout");
		}
		
		session.invalidate();
		System.out.println("\n�α׾ƿ� �� ���� �ʱ�ȭ �Ϸ�");
			
		return user;
	}
	
	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST)
	public Map<String, Object> checkDuplication( @RequestBody User user ) throws Exception {
		
		System.out.println("/user/json/checkDuplication : POST");

		boolean result = userService.checkDuplication(user.getUserId());

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userName", new Boolean(result));
		map.put("userId", user.getUserId());
		
		return map;
	}
	
	@RequestMapping( value="json/listUser", method=RequestMethod.GET)
	public Map<String, Object> listUser( @ModelAttribute("search") Search search, HttpServletRequest request) throws Exception{
		
		System.out.println("/user/json/listUser : GET / POST");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> listMap = userService.getUserList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", listMap.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}

}