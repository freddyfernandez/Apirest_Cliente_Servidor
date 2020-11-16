package net.spring.concurso.controller;
import org.springframework.http.HttpEntity;


import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.gson.Gson;
import net.spring.concurso.entity.Producto;
@Controller
@RequestMapping(value = "/cliente")

public class ProductoController {
	private String URL="http://localhost:8080/CL2_WS_Servidor/producto";
	
	
	@RequestMapping(value = "/")
	public String principal(Model model) {
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Producto[]> response=
				rt.getForEntity(URL+"/listAllProductos",Producto[].class );
		Producto[] lista=response.getBody();
		model.addAttribute("dataProductos",lista);
		return "producto";
	}
	@RequestMapping(value = "/save")
	
	//request param lleva las variable de la base de datos
	public String save(@RequestParam("nombre") String nom,
						@RequestParam("marca") String ape,
						@RequestParam("stock") int stock,
						@RequestParam("precio") double precio,
						RedirectAttributes redirect) {
				
		Producto bean=new Producto();
		bean.setNombre(nom);
		bean.setMarca(ape);
		bean.setStock(stock);
		bean.setPrecio(precio);
		//serializar
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		RestTemplate rt=new RestTemplate();
		HttpHeaders headers=new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request=new HttpEntity<String>(json,headers);
		rt.postForObject(URL+"/saveProducto", request, String.class);
		redirect.addFlashAttribute("MENSAJE","Registro ok.....");
		return "redirect:/cliente/";
	}
	
	
}
