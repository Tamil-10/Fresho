package com.niit.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.ShipmentDAO;
import com.niit.model.Shipment;

@Transactional
@Repository("ShipmentDao")
public class ShipmentDAOImpl implements ShipmentDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public ShipmentDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	public Shipment getByShipmentId(int shipmentId){
		Shipment ship =(Shipment) sessionFactory.getCurrentSession().get(Shipment.class, shipmentId);
		return ship;
	}
	
	public void saveOrUpdate(Shipment ship){
		
		sessionFactory.getCurrentSession().saveOrUpdate(ship);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Shipment> list(){
		
		return sessionFactory.getCurrentSession().createQuery("from Shipment").list();
	}
	
	public void delete(int id){
		Shipment shipToDelete = new Shipment();
		shipToDelete.setShipmentId(id);
		sessionFactory.getCurrentSession().delete(shipToDelete);
	}
	
	@SuppressWarnings("unchecked")
	public Shipment getByUserName(String userName){
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Shipment where username=:username");
		List<Shipment> listShip=(List<Shipment>) query.list();
		if(listShip!=null&&!listShip.isEmpty()){
			return listShip.get(0);
		}
		return null;
		
	}
	public List<Shipment> getByUserId(int id) {
		String hql = "from Shipment where userId =" + "'" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Shipment> list = (List<Shipment>) query.list();
		return list;	
	}
}
