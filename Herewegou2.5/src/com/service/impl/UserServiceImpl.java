package com.service.impl;

import java.util.List;

import com.dao.impl.ClientUserDaoImpl;
import com.dao.inter.ClientUserDao;
import com.service.inter.UserService;
import com.vo.ClientUser;

public class UserServiceImpl implements UserService{

	private ClientUserDao dao = new ClientUserDaoImpl();
	
	//用户登录
	@Override
	public ClientUser login(String userAccount, String password) {
		ClientUser user = null;
		String sql = "SELECT * FROM clientuser WHERE userAccount='" + userAccount + "' AND PASSWORD = '" + password + "'";
		List<ClientUser> list = dao.getClientUserByQuery(sql);
		System.out.println(list);
		if(list.size()>0){ //用户存在
			user = list.get(0);
		}
		System.out.println(userAccount);
		System.out.println(user);
		return user;
		
	}

	//检查用户是否存在
	@Override
	public boolean checkUsername(String userAccount) {
		boolean flag = true;
		String sql = "SELECT * FROM clientUser WHERE userAccount='" + userAccount + "'";
		List<ClientUser> list = dao.getClientUserByQuery(sql);
		if(list.size()>0){
			//用户存在
			flag = false;
		}
		return flag;
	}

	//用户注册
	@Override
	public boolean register(ClientUser user) {
		boolean registerSuccess = dao.addClientUser(user);
		return registerSuccess;
	}

	@Override
	public ClientUser getClientUserByUserAccount(String userAccount) {
		ClientUser clientUser = dao.getClientUserByUserAccount(userAccount);
		return clientUser;
	}
	
	@Override
	public void activation(String userid) {
		dao.activationById(userid);
	}


	
}
