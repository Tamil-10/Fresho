package com.niit.daoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.ProductDAO;
import com.niit.model.Product;


@Repository("ProductDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO{
	
	public ProductDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public List<Product> list() {
		@SuppressWarnings({ "unchecked" })
		List<Product> listProduct = (List<Product>) sessionFactory.getCurrentSession().createCriteria(Product.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProduct;
	}

	
	public Product getByProductId(int productid) {
		String hql = "from Product where productId ='" + productid + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) (query).list();

		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		return null;
	}

	
	public Product getByProductName(String productname) {
		String hql = "from Product where ProductName ='" + productname + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) (query).list();

		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		return null;
	}
	
	public List<Product> getBySupplierName(String suppliername) {
		String hql = "from Product where SupplierName ='" + suppliername + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) (query).list();

		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct;
		}
		return null;
	}
	
	public void saveOrUpdate(Product product) {

		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}

	
	public void delete(int productId) {
		Product productToDelete = new Product();
		productToDelete.setProductId(productId);
		sessionFactory.getCurrentSession().delete(productToDelete);
	}

	public List<Product> getByFeatured() {
		String hql = "from Product where featured ='on'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) (query).list();

		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct;
		}
		return null;
	}
	
}
