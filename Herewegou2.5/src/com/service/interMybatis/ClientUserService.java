package com.service.interMybatis;

import java.util.List;

import com.page.PageInfo;
import com.vo.ClientUser;

public interface ClientUserService {
	
	public void addClientUser(ClientUser clientUser);
	
	public List<ClientUser> getAll(); 
	
	public void deleteClientUserById(Integer userId);
	
	public ClientUser getClientUserById(Integer userId);
	
	
	public void updateClientUser(ClientUser clientUser);
	
	//总共的记录数
	public int getAllUserCount();
	
	//按分页显示商品
	public List<ClientUser> getAllByPage(PageInfo pageInfo);
	
	//根据过滤条件查询
	public List<ClientUser> getPageByQuery(ClientUser clientUser,PageInfo pageInfo);
	
	//得到过滤后的记录数
	public int getQueryRecordCount(ClientUser clientUser,PageInfo pageInfo);
	
}