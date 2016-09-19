package com.service.implMybatis;

import java.util.List;

import com.dao.impl.Category3DaoImpl;
import com.dao.inter.Category3Dao;
import com.page.PageInfo;
import com.service.inter.Category3Service;
import com.vo.Category3;

public class Category3ServiceImpl implements Category3Service {

	private Category3Dao dao = new Category3DaoImpl();

	@Override
	public void addCategory(Category3 category3) {
		dao.addCategory(category3);
	}

	@Override
	public List<Category3> getAll() {

		String sql = "select * from category3";

		List<Category3> list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public List<Category3> getAllByPage(PageInfo pageInfo) {

		String sql = "select * from "
				+ "(select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category3 c2 left outer join category c1 on (c2.fid=c1.cid)) "
				+ "where r between "
				+ pageInfo.getBeginRownum() + " and " + pageInfo.getEndRownum();

		List<Category3> list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public void deleteCategoryById(Integer cid) {

		Category3 category3 = new Category3();
		category3.setCid(cid);

		dao.deleteCategory(category3);
	}

	@Override
	public Category3 getCategoryById(Integer cid) {
		Category3 category3 = dao.getCategoryById(cid);
		return category3;
	}

	@Override
	public void updateCategory(Category3 category3) {
		dao.updateCategory(category3);
	}

	@Override
	public int getAllRecordCount() {
		int allRecordCount = dao.getAllRecordCount("category3");
		return allRecordCount;
	}

	@Override
	public List<Category3> getPageByQuery(Category3 category3, PageInfo pageInfo) {

		List<Category3> list = null;
		
		String sql = sbAppend(category3,pageInfo);
		
		list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public int getQueryRecordCount(Category3 category3, PageInfo pageInfo) {
		int queryRecordCount = 0;
		
		StringBuilder sb = new StringBuilder(
				"(select * from "
				+ "(select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category3 c2 left outer join category c1 on (c2.fid=c1.cid)) "
				+ "where 1=1 ");

		String cname = category3.getCname();
		String cdesc = category3.getCdesc();
		String fname = category3.getFname();

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

	public String sbAppend(Category3 category3, PageInfo pageInfo) {

		
		//select * from (select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category3 c2 left outer join category c1 on (c2.fid=c1.cid))
		//where 1=1 and cname = '生活用品' or cdesc like '%生活用品%' or fname = '生活用品' and r between 1 and 5

		StringBuilder sb = new StringBuilder(
				"select * from "
				+ "(select c2.cid, c2.cname, c2.cdesc, c1.cname fname, rownum r  from category3 c2 left outer join category c1 on (c2.fid=c1.cid)) "
				+ "where 1=1 ");

		String cname = category3.getCname();
		String cdesc = category3.getCdesc();
		String fname = category3.getFname();

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
	
	
	

	public static void main(String[] args) {
		Category3 category3 = new Category3();
		category3.setCname("商品种类名称");
		category3.setCdesc("商品种类描述");

		PageInfo page = new PageInfo(9,5);

		Category3ServiceImpl service = new Category3ServiceImpl();

		List<Category3> list = service.getPageByQuery(category3, page);

		for (Category3 c : list) {
			System.out.println(c);
		}
	}

	

}
