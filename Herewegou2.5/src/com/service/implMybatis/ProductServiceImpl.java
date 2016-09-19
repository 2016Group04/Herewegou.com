package com.service.implMybatis;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.impl.Category2DaoImpl;
import com.dao.impl.ProductDaoImpl;
import com.dao.inter.ProductDao;
import com.page.PageInfo;
import com.service.inter.ProductService;
import com.vo.Product;

public class ProductServiceImpl implements ProductService {

	private ProductDao dao = new ProductDaoImpl();

	@Override
	public void addProduct(Product product) {
		dao.addProduct(product);
	}

	@Override
	public List<Product> getAll() {

		String sql = "select * from product";

		List<Product> list = dao.getProductByQuery(sql);

		return list;
	}
	
	
	@Override
	public List<Product> getProductsPageByCid(PageInfo pageInfo, Integer cid) {
		
		List<Product> list = dao.getProductsByPageByCid(pageInfo,cid);

		return list;
	}

	@Override
	public List<Product> getAllByPage(PageInfo pageInfo) {

		String sql = "select * from "
				+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid)) "
				+ "where r between " + pageInfo.getBeginRownum() + " and "
				+ pageInfo.getEndRownum();

		List<Product> list = dao.getProductByQuery(sql);

		return list;
	}

	@Override
	public List<Product> getAllOffSaleByPage(PageInfo pageInfo) {
		return getOnorOffSaleByPge(pageInfo, 0);
	}

	@Override
	public List<Product> getAllOnSaleByPage(PageInfo pageInfo) {
		return getOnorOffSaleByPge(pageInfo, 1);
	}

	public List<Product> getOnorOffSaleByPge(PageInfo pageInfo, int flag) {
		String sql = "select * from "
				+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid) "
				+ "where p.onsale=" + flag + ") " + "where r between "
				+ pageInfo.getBeginRownum() + " and " + pageInfo.getEndRownum();

		List<Product> list = dao.getProductByQuery(sql);

		return list;
	}

	@Override
	public void deleteProductById(Integer pid) {

		Product product = new Product();
		product.setPid(pid);

		dao.deleteProduct(product);
	}
	
	@Override
	public List<Product> getProductsByCid(Integer cid) {
		List<Product> productList = dao.getProductsByCid(cid);
		return productList;
	}
	
	public List<Product> getProductByCid(Integer cid) {
		String sql = "select * from product where cid="+cid;
		List<Product> productList = dao.getProduct(sql);
		return productList;
	}
	
	

	@Override
	public Product getProductByPid(Integer pid) {
		Product product = dao.getProductByPid(pid);
		return product;
	}

	@Override
	public void updateProduct(Product product) {
		dao.updateProduct(product);
	}

	@Override
	public void putOnShelves(List<String> pidList) {
		dao.putOnShelves(pidList);
	}
	
	@Override
	public void pullOffShelves(List<String> pidList) {
		dao.pullOffShelves(pidList);
	}

	@Override
	public int getAllRecordCount() {
		int allRecordCount = dao.getAllRecordCount("product");
		return allRecordCount;
	}
	
	@Override
	public int getAllRecordCountByCid(Integer cid) {
		String table = "(select * from product where cid = "+ cid +")";
		int allRecordCount = dao.getAllRecordCount(table);
		return allRecordCount;
	}

	@Override
	public int getAllOffSaleProductCount() {
		int allRecordCount = dao.getAllOffSaleProductCount();
		return allRecordCount;
	}

	@Override
	public int getAllOnSaleProductCount() {
		int allRecordCount = dao.getAllOnSaleProductCount();
		return allRecordCount;
	}

	@Override
	public List<Product> getPageWithCondition(Product product, PageInfo pageInfo) {

		List<Product> list = null;

		String sql = sbAppend(product, pageInfo);

		list = dao.getProductByQuery(sql);

		return list;
	}
	
	@Override
	public List<Product> getOnSalePageWithCondition(Product product,
			PageInfo pageInfo) {
		return getOnOrOffSalePageWithCondition(product,pageInfo,1);
	}

	@Override
	public List<Product> getOffSalePageWithCondition(Product product,
			PageInfo pageInfo) {
		return getOnOrOffSalePageWithCondition(product,pageInfo,0);
	}

	public List<Product> getOnOrOffSalePageWithCondition(Product product,
			PageInfo pageInfo, int flag) {
		List<Product> list = null;

		StringBuilder sb = new StringBuilder(
				"select * from "
						+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid) "

						+ "where p.onsale="+flag);
		String pname = product.getPname();
		String dianpuName = product.getDianpuName();

		String cname = product.getCname();

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and (pname like '%");
			sb.append(pname);
			sb.append("%'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuname like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or cname like '%");
			sb.append(cname);
			sb.append("%'))");
		}

		sb.append(" where r between ");
		sb.append(pageInfo.getBeginRownum());
		sb.append(" and ");
		sb.append(pageInfo.getEndRownum());

		String sql = sb.toString();

		list = dao.getProductByQuery(sql);

		return list;
	}
	
	public int getOnorOffSaleCountWithCondition(Product product, PageInfo pageInfo, int flag) {
		int queryRecordCount = 0;

		StringBuilder sb = new StringBuilder(
				"(select * from "
						+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid) "

						+ "where p.onsale="+flag);

		String pname = product.getPname();
		String dianpuname = product.getDianpuName();

		String cname = product.getCname();

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and (pname like '%");
			sb.append(pname);
			sb.append("%'");
		}

		if (dianpuname != null && !dianpuname.trim().equals("")) {
			sb.append(" or dianpuname like '%");
			sb.append(dianpuname);
			sb.append("%'");
		}

		if (cname != null && !cname.trim().equals("")) {
			sb.append(" or cname like '%");
			sb.append(cname);
			sb.append("%')))");
		}

		String table = sb.toString();

		queryRecordCount = dao.getAllRecordCount(table);

		System.out.println("getQueryRecordCount." + queryRecordCount);

		return queryRecordCount;
	}
	
	@Override
	public int getOnSaleCountWithCondition(Product product, PageInfo pageInfo) {
		return getOnorOffSaleCountWithCondition(product, pageInfo, 1);
	}

	@Override
	public int getOffSaleCountWithCondition(Product product, PageInfo pageInfo) {
		return getOnorOffSaleCountWithCondition(product, pageInfo, 0);
	}

	@Override
	public int getRecordCountWithCondition(Product product, PageInfo pageInfo) {
		int queryRecordCount = 0;

		StringBuilder sb = new StringBuilder(
				"(select * from "
						+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid)) "
						+ "where 1=1 ");

		String pname = product.getPname();
		String dianpuname = product.getDianpuName();

		String cname = product.getCname();

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and (pname like '%");
			sb.append(pname);
			sb.append("%'");
		}

		if (dianpuname != null && !dianpuname.trim().equals("")) {
			sb.append(" or dianpuname like '%");
			sb.append(dianpuname);
			sb.append("%'");
		}

		if (cname != null && !cname.trim().equals("")) {
			sb.append(" or cname like '%");
			sb.append(cname);
			sb.append("%'))");
		}

		String table = sb.toString();

		queryRecordCount = dao.getAllRecordCount(table);

		System.out.println("getQueryRecordCount." + queryRecordCount);

		return queryRecordCount;
	}

	public String sbAppend(Product product, PageInfo pageInfo) {

		// select * from (select p2.pid, p2.pname, p2.pdesc, c1.cname fname,
		// rownum r from product c2 left outer join category c1 on
		// (c2.fid=c1.cid))
		// where 1=1 and cname = '生活用品' or cdesc like '%生活用品%' or fname = '生活用品'
		// and r between 1 and 5

		StringBuilder sb = new StringBuilder(
				"select * from "
						+ "(select p.pid, p.pname,p.price, p.productsum, p.dianpuname, c.cname cname, rownum r  from product p left outer join category2 c on (c.cid=p.cid) "
						+ "where 1=1 ");
		// select * from (select p.pid, p.pname,p.price, p.productsum,
		// p.dianpuname, c.cname, rownum r from product p left outer join
		// category2 c on (c.cid=p.cid))
		// where 1=1 and pname like '%AJ%' or dianpuname like '%旗舰店%' or cname
		// like '%小说%' and r between 1 and 5
		String pname = product.getPname();
		String dianpuName = product.getDianpuName();

		String cname = product.getCname();

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and (pname like '%");
			sb.append(pname);
			sb.append("%'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuname like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or cname like '%");
			sb.append(cname);
			sb.append("%'))");
		}

		sb.append(" where r between ");
		sb.append(pageInfo.getBeginRownum());
		sb.append(" and ");
		sb.append(pageInfo.getEndRownum());

		String sql = sb.toString();

		return sql;
	};

	@Override
	public void upload(HttpServletRequest request,
			String productImagesUploadPath) {
		String pid = "";
		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		// 设置内存缓冲区阈值为512k
		itemFactory.setSizeThreshold(0x80000);

		File tempDir = new File("H:\\temp");
		if (!tempDir.exists()) {
			tempDir.mkdir();
		}// 设置临时文件目录
		itemFactory.setRepository(tempDir);

		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		// 设置上传文件的最大数据量 10M
		fileUpload.setFileSizeMax(0xA00000);

		// 解析上传文件流，得到FileItem对象的列表
		List<String> fileNameList = new ArrayList<String>();
		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);

			System.out.println("size=" + fileItems.size());

			Iterator<FileItem> it = fileItems.iterator();
			
			String[] imgFileDir = {
					"productListLargeImage",
				    "productListSmallImage1",
				    "productListSmallImage2",
				    "productListSmallImage3",
				    "detailLargeImg",
				    "detailSmallImg1",
				    "detailSmallImg2",
				    "detailSmallImg3",
				    "detailSmallImg4",
				    "detailSmallImg5",
				    "shoppingCartImg"
			};
			int imgDirIndex = 0;
			
			while (it.hasNext()) {				
				
				FileItem item = it.next();			
				
				// 如果是文件域
				if (!item.isFormField()) {
					System.out.println("是文件域");
					String name = item.getName();
					long size = item.getSize();
					if ((name == null || name.equals("")) && size == 0) {
						fileNameList.add("");
						continue;
					}

					System.out.println("name=" + item.getName());
					System.out.println("size=" + item.getSize());

					File uploadFileDir = new File(productImagesUploadPath+"/"+imgFileDir[imgDirIndex]);
					imgDirIndex+=1;
					
					System.out.println("uploadFileDir:" + uploadFileDir);

					if (!uploadFileDir.exists()) {
						uploadFileDir.mkdir();
					}

					int index = name.lastIndexOf(File.separator);
					if (index > 0) {// 是全路径
						name = name.substring(index + 1, name.length());
					}

					// 生成唯一的名字避免同名覆盖
					System.out.println("生成唯一的名字避免同名覆盖");
					long currentTime = System.currentTimeMillis();
					Random random = new Random();
					int num1 = random.nextInt(10000);
					int num2 = random.nextInt(10000);
					int dotPosition = name.lastIndexOf(".");
					String fileBeginName = name.substring(0, dotPosition);
					String fileEndName = name.substring(dotPosition);
					name = fileBeginName + "_" + currentTime + "_" + num1 + "_"
							+ num2 + fileEndName;

					System.out.println("文件名：" + name);

					fileNameList.add(name);
					File file = new File(uploadFileDir, name);
					// 上传文件
					item.write(file);

				} else {
					// 是普通的表单域
					System.out.println("普通的表单域");
					String fieldName = item.getFieldName();
					String value = item.getString();
					System.out.println("fieldName=" + fieldName);
					System.out.println("value=" + value);
					if (fieldName.equals("pid")) {
						pid = value;
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("pid:" + pid);
		for (String str : fileNameList) {
			System.out.println(str);
		}
		// 把上传的文件名保存到数据库相应的字段中
		ProductServiceImpl service = new ProductServiceImpl();
		service.saveProductImgNamesForOneProduct(pid, fileNameList);
	}

	@Override
	public void saveProductImgNamesForOneProduct(String pid,
			List<String> fileNameList) {
		// 把以前的查出来
		Product product = dao.getProductByPid(new Integer(pid));

		String productListLargeImage = fileNameList.get(0);
		if (productListLargeImage != null
				&& !productListLargeImage.trim().equals("")) {
			product.setProductListLargeImage(productListLargeImage);
		}
		String productSmallImage1 = fileNameList.get(1);
		if (productSmallImage1 != null && !productSmallImage1.trim().equals("")) {
			product.setProductListSmallImage1(productSmallImage1);
		}
		String productSmallImage2 = fileNameList.get(2);
		if (productSmallImage2 != null && !productSmallImage2.trim().equals("")) {
			product.setProductListSmallImage2(productSmallImage2);
		}
		String productSmallImage3 = fileNameList.get(3);
		if (productSmallImage3 != null && !productSmallImage3.trim().equals("")) {
			product.setProductListSmallImage3(productSmallImage3);
		}
		String detailLargeImg = fileNameList.get(4);
		if (detailLargeImg != null && !detailLargeImg.trim().equals("")) {
			product.setDetailLargeImg(detailLargeImg);
		}
		String detailSmallImg1 = fileNameList.get(5);
		if (detailSmallImg1 != null && !detailSmallImg1.trim().equals("")) {
			product.setDetailSmallImg1(detailSmallImg1);
		}
		String detailSmallImg2 = fileNameList.get(6);
		if (detailSmallImg2 != null && !detailSmallImg2.trim().equals("")) {
			product.setDetailSmallImg2(detailSmallImg2);
		}
		String detailSmallImg3 = fileNameList.get(7);
		if (detailSmallImg3 != null && !detailSmallImg3.trim().equals("")) {
			product.setDetailSmallImg3(detailSmallImg3);
		}
		String detailSmallImg4 = fileNameList.get(8);
		if (detailSmallImg4 != null && !detailSmallImg4.trim().equals("")) {
			product.setDetailSmallImg4(detailSmallImg4);
		}
		String detailSmallImg5 = fileNameList.get(9);
		if (detailSmallImg5 != null && !detailSmallImg5.trim().equals("")) {
			product.setDetailSmallImg5(detailSmallImg5);
		}
		
		String shoppingCartImg = fileNameList.get(10);
		if (shoppingCartImg != null && !shoppingCartImg.trim().equals("")) {
			product.setShoppingCartImg(shoppingCartImg);
		}	

		ProductDao dao2 = new ProductDaoImpl();
		dao2.updateProductImageNames(product);
		
		System.out.println(product.getPname()+":"+product.getProductListLargeImage());
	}

	public static void main(String[] args) {
		Product product = new Product();
		product.setPname("商品名称");
		product.setPdesc("商品描述");

		PageInfo page = new PageInfo(9,5);

		ProductServiceImpl service = new ProductServiceImpl();

		List<Product> list = service.getPageWithCondition(product, page);

		for (Product c : list) {
			System.out.println(c);
		}
	}

}
