package com.service.implMybatis;

import java.util.List;

import com.dao.implMybatis.Category2DaoImpl;
import com.dao.interMybatis.Category2Dao;
import com.page.PageInfo;
import com.po.Category2;
import com.service.interMybatis.Category2Service;

public class Category2ServiceImpl implements Category2Service {

	private Category2Dao dao = new Category2DaoImpl();

	@Override
	public int addCategory(Category2 category2) {
		return dao.addCategory(category2);
	}

	@Override
	public List<Category2> getAll() {

		String sql = "select * from category2";

		List<Category2> list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public List<Category2> getAllByPage(PageInfo pageInfo) {

		String sql = "select * from "
				+ "(select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category2 c2 left outer join category c1 on (c2.fid=c1.cid)) "
				+ "where r between "
				+ pageInfo.getBeginRownum() + " and " + pageInfo.getEndRownum();

		List<Category2> list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public int deleteCategoryById(Integer cid) {

		Category2 category2 = new Category2();
		category2.setCid(cid);

		return dao.deleteCategory(category2);
	}

	@Override
	public Category2 getCategoryById(Integer cid) {
		Category2 category2 = dao.getCategoryById(cid);
		return category2;
	}

	@Override
	public int updateCategory(Category2 category2) {
		return dao.updateCategory(category2);
	}

	@Override
	public int getAllRecordCount() {
		int allRecordCount = dao.getAllRecordCount("category2");
		return allRecordCount;
	}

	@Override
	public List<Category2> getPageByQuery(Category2 category2, PageInfo pageInfo) {

		List<Category2> list = null;
		
		String sql = sbAppend(category2,pageInfo);
		
		list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public int getQueryRecordCount(Category2 category2, PageInfo pageInfo) {
		int queryRecordCount = 0;
		
		StringBuilder sb = new StringBuilder(
				"(select * from "
				+ "(select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category2 c2 left outer join category c1 on (c2.fid=c1.cid)) "
				+ "where 1=1 ");

		String cname = category2.getCname();
		String cdesc = category2.getCdesc();
		String fname = category2.getFname();

		if (cname != null && !cname.trim().equals("")) {
			sb.append(" and cname like '%");
			sb.append(cname);
			sb.append("%'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		if (fname != null && !fname.trim().equals("")) {
			sb.append(" or fname like '%");
			sb.append(fname);
			sb.append("%')");
		}

		String table = sb.toString();
		
		queryRecordCount = dao.getAllRecordCount(table);
		
		System.out.println("getQueryRecordCount."+queryRecordCount);

		return queryRecordCount;
	}

	public String sbAppend(Category2 category2, PageInfo pageInfo) {

		
		//select * from (select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category2 c2 left outer join category c1 on (c2.fid=c1.cid))
		//where 1=1 and cname = '生活用品' or cdesc like '%生活用品%' or fname = '生活用品' and r between 1 and 5

		StringBuilder sb = new StringBuilder(
				"select * from "
				+ "(select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category2 c2 left outer join category c1 on (c2.fid=c1.cid)) "
				+ "where 1=1 ");

		String cname = category2.getCname();
		String cdesc = category2.getCdesc();
		String fname = category2.getFname();

		if (cname != null && !cname.trim().equals("")) {
			sb.append(" and cname like '%");
			sb.append(cname);
			sb.append("%'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		if (fname != null && !fname.trim().equals("")) {
			sb.append(" or fname like '%");
			sb.append(fname);
			sb.append("%'");
		}
		
		sb.append(" and r between ");
		sb.append(pageInfo.getBeginRownum());
		sb.append(" and ");
		sb.append(pageInfo.getEndRownum());

		String sql = sb.toString();

		return sql;
	};
	
	
	
	@Override
	public List<Category2> getCategoriesByFid(Integer fid) {
		String sql = "select * from category2 where fid= "+fid +" order by cid";
		List<Category2> list = dao.getCategoryByQuery(sql);
		return list;
	}

	

	public static void main(String[] args) {
		Category2 category2 = new Category2();
		category2.setCname("商品种类名称");
		category2.setCdesc("商品种类描述");

		PageInfo page = new PageInfo(9,5);

		Category2ServiceImpl service = new Category2ServiceImpl();

		List<Category2> list = service.getPageByQuery(category2, page);

		for (Category2 c : list) {
			System.out.println(c);
		}
	}

	
	

}
