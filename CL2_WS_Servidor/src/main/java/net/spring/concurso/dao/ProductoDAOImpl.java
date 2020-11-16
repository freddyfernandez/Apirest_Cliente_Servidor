package net.spring.concurso.dao;
import java.util.List;

import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import net.spring.concurso.entity.Producto;

@Repository
public class ProductoDAOImpl implements ProductoDAO{
	
	@Autowired
	private SessionFactory factory;
	
	@Transactional
	@Override
	public void save(Producto bean) {
		Session session=factory.getCurrentSession();
		try {
			session.save(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	@Transactional(readOnly = true)
	@Override
	public List<Producto> listAll() {
		List<Producto> lista=null;
		Query query=null;
		Session session=factory.getCurrentSession();
		try {
			String hql="select p from Producto p";
			query=session.createQuery(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return query.getResultList();
	}
	
	

}
