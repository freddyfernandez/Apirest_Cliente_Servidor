package net.spring.concurso.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import net.spring.concurso.entity.Producto;
import net.spring.concurso.service.ProductoService;

@RestController
@RequestMapping(value = "/producto")
public class ProductoController {
	@Autowired
	private ProductoService productoService;

	@GetMapping(path = "/listAllProductos")
	@ResponseBody
	public List<Producto>listAllProductos(){
		return productoService.listAll();
	}
	@PostMapping(path = "/saveProducto")
	public void saveProducto(@RequestBody Producto bean) {
		productoService.save(bean);
	}
}
