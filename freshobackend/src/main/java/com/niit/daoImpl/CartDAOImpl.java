package com.niit.daoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CartDAO;
import com.niit.model.Cart;

@Repository("CartDAO")
@Transactional
public class CartDAOImpl implements CartDAO{

	@Autowired
	private SessionFactory sessionFactory;
	private Object cart;
	
	public CartDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Cart> list() {
		@SuppressWarnings({ "unchecked" })
		List<Cart> listCart = (List<Cart>) sessionFactory.getCurrentSession().createCriteria(Cart.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCart;
	}
	public Cart getByItemId(int itemId) {
		Cart cart = (Cart) sessionFactory.getCurrentSession().get(Cart.class, itemId);
		return cart;
	}	
	
	public List<Cart> getCartItems(String username) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Cart where username=:username and status='New'");
		query.setParameter("username", username);
		@SuppressWarnings("unchecked")
		List<Cart> list = query.list();
		return list;
	}

	public Cart getByCartId(int cartid) {
		String hql = "from Cart where cartId ='" + cartid + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Cart> listCart = (List<Cart>) (query).list();

		if (listCart != null && !listCart.isEmpty()) {
			return listCart.get(0);
		}
		return null;
	}

	public Cart getByProductId(int productid) {
		String hql = "from Cart where ProductId ='" + productid + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Cart> listCart = (List<Cart>) (query).list();

		if (listCart != null && !listCart.isEmpty()) {
			return listCart.get(0);
		}
		return null;
	}

	public List<Cart> getByEmailId(String email) {
		String hql = "from Cart where EmailId ='" + email +"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Cart> list = (List<Cart>) query.list();
		
		return list;
	}

	public Cart getByProductName(String productname) {
		String hql = "from Cart where ProductName ='" + productname + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Cart> listCart = (List<Cart>) (query).list();

		if (listCart != null && !listCart.isEmpty()) {
			return listCart.get(0);
		}
		return null;
	}

	public void saveOrUpdate(Cart cart) {
		sessionFactory.getCurrentSession().saveOrUpdate(cart);
		
	}

	public void delete(int cartId) {
		Cart cartToDelete = new Cart();
		cartToDelete.setCartId(cartId);
		sessionFactory.getCurrentSession().delete(cartToDelete);
		
	}

	public Long getTotalAmount(int id) {
		String hql = "select sum(total) from Cart where userId = " + "'" + id + "'" + "and status = '" + "N" +"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
			return sum;
		}

/*	public boolean itemAlreadyExist(String emailId, int productId) {
		String hql = "from Cart where emailId= '" + emailId + "' and " + " productId ='" + productId+"'";
		org.hibernate.Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Cart> list = (List<Cart>) query.list();
		if (list != null && !list.isEmpty()) {
			return true;
		}
		return false;
	}*/

	public boolean itemAlreadyExist(String username, int productId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Cart where username=:username and productid=:productId and status='New'");
		query.setParameter("username", username);
		query.setParameter("productId", productId);

		@SuppressWarnings("unchecked")
		List<Cart> list = (List<Cart>) query.list();
		if (list != null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	public Cart getByUserandProduct(String emailId, int productId) {
		String hql = "from Cart where emailId= '" + emailId + "' and " + " productId ='" + productId+"'";
		org.hibernate.Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Cart> listCart = (List<Cart>) query.list();
		
		if (listCart != null && !listCart.isEmpty()){
			return listCart.get(0);
		}
		return null;
	}

	public void updateshipping(String emailId, int shippingId) {
		String hql = " update Cart set shippingId = '" + shippingId + "' where emailId = '" + emailId + "'";
		sessionFactory.getCurrentSession().createQuery(hql);
		
	}

	public void save(Cart cart) {

		sessionFactory.getCurrentSession().save(cart);

	}

	public void deleteCartItem(Cart cart) {
		sessionFactory.getCurrentSession().delete(cart);
		
	}

	public List<Cart> getDispatchItems(String username) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Cart where username=:username and status='Dispatched'");
		query.setParameter("username", username);
		@SuppressWarnings("unchecked")
		List<Cart> list = query.list();
		return list;
	}
	
	public boolean getByUserName(String username) {
		String hql = "from Cart where username ='" + username +"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<Cart> list = (List<Cart>) query.list();
		if (list != null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	
	public List<Cart> getAllItems() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Cart where status='Dispatched'and days > -2 order by itemId");
		@SuppressWarnings("unchecked")
		List<Cart> list = query.list();
		return list;
	}
}
