package net.spring.concurso.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import net.spring.concurso.dao.ProductoDAO;
import net.spring.concurso.entity.Producto;

@Service
public class ProductoServiceImpl implements ProductoService{
	
	@Autowired
	private ProductoDAO computadoraDAO;
	
	@Override
	public void save(Producto bean) {
		computadoraDAO.save(bean);
	}
	
	@Override
	public List<Producto> listAll() {
		return computadoraDAO.listAll();
	}


}
