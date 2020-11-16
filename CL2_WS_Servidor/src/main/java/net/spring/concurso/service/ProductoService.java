package net.spring.concurso.service;
import java.util.List;


import net.spring.concurso.entity.Producto;

public interface ProductoService {
	public void save(Producto bean);
	public List<Producto> listAll();
}
