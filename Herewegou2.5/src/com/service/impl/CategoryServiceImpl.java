package com.service.impl;

import java.util.List;

import com.dao.impl.CategoryDaoImpl;
import com.dao.inter.CategoryDao;
import com.page.PageInfo;
import com.service.inter.CategoryService;
import com.vo.Category;

public class CategoryServiceImpl implements CategoryService {

	private CategoryDao dao = new CategoryDaoImpl();

	@Override
	public void addCategory(Category category) {
		dao.addCategory(category);
	}

	@Override
	public List<Category> getAll() {

		String sql = "select * from category order by cid";

		List<Category> list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public List<Category> getAllByPage(PageInfo pageInfo) {

		String sql = "select * from (select c.*,rownum r from category c) where r between "
				+ pageInfo.getBeginRownum() + " and " + pageInfo.getEndRownum();

		List<Category> list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public void deleteCategoryById(Integer cid) {

		Category category = new Category();
		category.setCid(cid);

		dao.deleteCategory(category);
	}

	@Override
	public Category getCategoryById(Integer cid) {
		Category category = dao.getCategoryById(cid);
		return category;
	}
	
	

	@Override
	public void updateCategory(Category category) {
		dao.updateCategory(category);
	}

	@Override
	public int getAllRecordCount() {
		int allRecordCount = dao.getAllRecordCount("category");
		return allRecordCount;
	}

	@Override
	public List<Category> getPageByQuery(Category category, PageInfo pageInfo) {

		List<Category> list = null;
		
		String sql = sbAppend(category,pageInfo);
		
		list = dao.getCategoryByQuery(sql);

		return list;
	}

	@Override
	public int getQueryRecordCount(Category category, PageInfo pageInfo) {
		int queryRecordCount = 0;
		
		StringBuilder sb = new StringBuilder(
				"(select * from (select c.*,rownum r from category c where 1=1");

		String cname = category.getCname();
		String cdesc = category.getCdesc();

		if (cname != null && !cname.trim().equals("")) {
			sb.append(" and cname = '");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'))");
		}	

		String table = sb.toString();
		
		queryRecordCount = dao.getAllRecordCount(table);

		return queryRecordCount;
	}

	public String sbAppend(Category category, PageInfo pageInfo) {

		// select* from
		// (select c.*,rownum r from category c
		// where 1=1 and cname = '商品种类名称' and cdesc = '商品种类描述')
		// where r between 1 and 5

		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from category c where 1=1");

		String cname = category.getCname();
		String cdesc = category.getCdesc();

		if (cname != null && !cname.trim().equals("")) {
			sb.append(" and cname = '");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
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
		Category category = new Category();
		category.setCname("商品种类名称");
		category.setCdesc("商品种类描述");

		PageInfo page = new PageInfo(9,5);

		CategoryServiceImpl service = new CategoryServiceImpl();

		List<Category> list = service.getPageByQuery(category, page);

		for (Category c : list) {
			System.out.println(c);
		}
	}
	
	

	

}
