package com.service.inter;

import com.vo.ClientUser;

public interface UserService {
	
	//public User login(String username,String password);
	
	//用户登录
	public ClientUser login(String username,String password);
	
	//检查用户是否存在
	public boolean checkUsername(String username);
	
	//用户注册
	public boolean register(ClientUser user);
	
	//根据用户名得到用户
	public ClientUser getClientUserByUserAccount(String userAccount);
	
	//激活用户
		public void activation(String userid);
}
