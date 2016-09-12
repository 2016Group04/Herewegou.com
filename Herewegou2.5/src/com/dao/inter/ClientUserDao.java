package com.dao.inter;

import java.util.List;

import com.vo.ClientUser;

public interface ClientUserDao {

	public boolean addClientUser(ClientUser clientUser);

	public void deleteClientUser(ClientUser clientUser);

	public void updateClientUser(ClientUser clientUser);

	public ClientUser getClientUserById(Integer userId);

	public List<ClientUser> getClientUserByQuery(String sql);

	public int getAllUserCount(String table);
	
	public int getFrozenUserCount(String sql);
	
	public void updateClientUserBySql(String sql);
  
  public ClientUser getClientUserByUser(String user);
  
    //根据用户名得到用户
	public ClientUser getClientUserByUserAccount(String userAccount);
	
	//根据用户id 激活用户
	public void activationById(String userid); 

}
