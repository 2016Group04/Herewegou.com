package com.service.impl;

import java.util.List;

import com.dao.impl.ClientUserDaoImpl;
import com.dao.inter.ClientUserDao;
import com.page.PageInfo;
import com.service.inter.ClientUserService;
import com.vo.ClientUser;

public class ClientUserServiceImpl implements ClientUserService {

	private ClientUserDao dao = new ClientUserDaoImpl();

	@Override
	public void addClientUser(ClientUser clientUser) {
		dao.addClientUser(clientUser);
	}

	@Override
	public List<ClientUser> getAll() {

		String sql = "select * from clientUser order by userId";

		List<ClientUser> list = dao.getClientUserByQuery(sql);

		return list;
	}

	@Override
	public List<ClientUser> getAllByPage(PageInfo pageInfo) {

		String sql = "select * from (select c.*,rownum r from clientUser c) where r between "
				+ pageInfo.getBeginRownum() + " and " + pageInfo.getEndRownum();

		List<ClientUser> list = dao.getClientUserByQuery(sql);

		return list;
	}

	@Override
	public void deleteClientUserById(Integer userId) {

		ClientUser clientUser = new ClientUser();
		clientUser.setUserId(userId);

		dao.deleteClientUser(clientUser);
	}

	@Override
	public ClientUser getClientUserById(Integer userId) {
		ClientUser clientUser = dao.getClientUserById(userId);
		return clientUser;
	}
	
  
	public ClientUser getClientUserByUser(String user) {
		ClientUser clientUser = dao.getClientUserByUser(user);
		return clientUser;
	}
	
	public void updateClientUserByUseAccount(String userAccount,String userAccount1,String nickname,Integer sex,int birthdayYear,String realName) {
		String sql = "";
		System.out.println(userAccount);
		if(birthdayYear==0){
			sql = "update clientuser set useraccount='"+userAccount1+"',nickname='"+nickname+"',sex="+sex+",realname='"+realName+"' where useraccount='"+userAccount+"'";
		}else{
			sql = "update clientuser set useraccount='"+userAccount1+"',nickname='"+nickname+"',sex="+sex+",age="+birthdayYear+",realname='"+realName+"' where useraccount='"+userAccount+"'";
		}
		System.out.println(sql);
		new ClientUserDaoImpl().updateClientUserBySql(sql);
		
	}
	
  
	public void dong(String pid){

		String sql = "update clientuser set frozen=0 where userid="+pid;
		
		dao.updateClientUserBySql(sql);
	}
	
	public void jie(String pid){

		String sql = "update clientuser set frozen=1 where userid="+pid;
		
		dao.updateClientUserBySql(sql);
	}
	

	@Override
	public void updateClientUser(ClientUser clientUser) {
		dao.updateClientUser(clientUser);
	}

	@Override
	public int getAllUserCount() {
		int allRecordCount = dao.getAllUserCount("clientUser");
		return allRecordCount;
	}
	
	public int getFrozenUserCount() {
		
		String sql = "select count(*) from clientUser where frozen=0";
		int allRecordCount = dao.getFrozenUserCount(sql);
		return allRecordCount;
	}

	@Override
	public List<ClientUser> getPageByQuery(ClientUser clientUser, PageInfo pageInfo) {

		List<ClientUser> list = null;
		
		String sql = sbAppend(clientUser,pageInfo);
		
		list = dao.getClientUserByQuery(sql);

		return list;
	}
	
	public List<ClientUser> getDongUserBySql(PageInfo pageInfo){
		
		List<ClientUser> list = null;
		
		String sql = "select * from (select c.*,rownum r from clientuser c where frozen=0) where r>="+pageInfo.getBeginRownum()+" and r<="+pageInfo.getEndRownum();
		list = dao.getClientUserByQuery(sql);
		
		return list;
	}
	
	public List<ClientUser> getNotDongUserBySql(PageInfo pageInfo){
		
		List<ClientUser> list = null;
		String sql = "select * from (select c.*,rownum r from clientuser c where frozen=1) where r>="+pageInfo.getBeginRownum()+" and r<="+pageInfo.getEndRownum();
		
		list = dao.getClientUserByQuery(sql);
		
		return list;
	}

	@Override
	public int getQueryRecordCount(ClientUser clientUser, PageInfo pageInfo) {
		int queryRecordCount = 0;
		
		StringBuilder sb = new StringBuilder(
				"(select * from (select c.*,rownum r from clientUser c where 1=1");

		String userAccount = clientUser.getUserAccount();
		String password = clientUser.getPassword();

		if (userAccount != null && !userAccount.trim().equals("")) {
			sb.append(" and userAccount = '");
			sb.append(userAccount);
			sb.append("'");
		}

		if (password != null && !password.trim().equals("")) {
			sb.append(" or password like '%");
			sb.append(password);
			sb.append("%'))");
		}	

		String table = sb.toString();
		
		queryRecordCount = dao.getAllUserCount(table);

		return queryRecordCount;
	}

	public String sbAppend(ClientUser clientUser, PageInfo pageInfo) {

		// select* from
		// (select c.*,rownum r from clientUser c
		// where 1=1 and userAccount = '商品种类名称' and password = '商品种类描述')
		// where r between 1 and 5

		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from clientUser c where 1=1");

		String userAccount = clientUser.getUserAccount();
		String password = clientUser.getPassword();

		if (userAccount != null && !userAccount.trim().equals("")) {
			sb.append(" and userAccount = '");
			sb.append(userAccount);
			sb.append("'");
		}

		if (password != null && !password.trim().equals("")) {
			sb.append(" or password like '%");
			sb.append(password);
			sb.append("%')");
		}

		sb.append(" where r between ");
		sb.append(pageInfo.getBeginRownum());
		sb.append(" and ");
		sb.append(pageInfo.getEndRownum());

		String sql = sb.toString();

		return sql;
	};
	
	
	

	public static void main(String[] args) {
		ClientUser clientUser = new ClientUser();
		clientUser.setUserAccount("商品种类名称");
		clientUser.setPassword("商品种类描述");

		PageInfo page = new PageInfo(9,5);

		ClientUserServiceImpl service = new ClientUserServiceImpl();

		List<ClientUser> list = service.getPageByQuery(clientUser, page);

		for (ClientUser c : list) {
			System.out.println(c);
		}
	}

	public List<ClientUser> getNotDongUserBySqlCondition(PageInfo pageInfo,String condition){
		
		List<ClientUser> list = null;
		String sql = "select * from (select c.*,rownum r from clientuser c where frozen=1 and useraccount='"+condition+"') where r>="+pageInfo.getBeginRownum()+" and r<="+pageInfo.getEndRownum();
		
		list = dao.getClientUserByQuery(sql);
		
		return list;
	}
	
	public int getNotFrozenUserCountCondition(String condition) {
		
		String sql = "select count(*) from clientUser where frozen=1 and useraccount='"+condition+"'";
		int allRecordCount = dao.getFrozenUserCount(sql);
		return allRecordCount;
	}
	
	public int getFrozenUserCountCondition(String condition) {
		
		String sql = "select count(*) from clientUser where frozen=0 and useraccount='"+condition+"'";
		int allRecordCount = dao.getFrozenUserCount(sql);
		return allRecordCount;
	}
	
	public List<ClientUser> getDongUserBySqlCondition(PageInfo pageInfo,String condition){
		
		List<ClientUser> list = null;
		
		String sql = "select * from (select c.*,rownum r from clientuser c where frozen=0 and useraccount='"+condition+"') where r>="+pageInfo.getBeginRownum()+" and r<="+pageInfo.getEndRownum();
		list = dao.getClientUserByQuery(sql);
		
		return list;
	}

	

}
