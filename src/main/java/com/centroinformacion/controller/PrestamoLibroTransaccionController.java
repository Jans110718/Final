package com.centroinformacion.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.service.LibroService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrestamoLibroTransaccionController {
	
	
	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private LibroService libroService;


	
	
	//Los productos seleccionados
	
	//Los productos seleccionados
	private List<Libro> seleccionados = new ArrayList<Libro>();
	
	
	/*Cargar clientes en el modal*/
	@RequestMapping("/cargaAlumno")
	@ResponseBody()
	public List<Alumno> listaAlumno(String filtro){
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Alumno> lstSalida = alumnoService.listaAlumno("%"+filtro+"%", pageable);
		return lstSalida;		
	}
		
	@RequestMapping("/cargaLibro")
	@ResponseBody()
	public List<Libro> listaLibro(String filtro){
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Libro> lstSalida = libroService.listaLibro("%"+filtro+"%", pageable);
		return lstSalida;		
	}

	/**/
/*	@RequestMapping("/listaSeleccion")
	@ResponseBody()
	public List<Libro> lista(){
		return libros; 
	}
	
	@RequestMapping("/agregarSeleccion")
	@ResponseBody()
	public List<Seleccion> agregar(Seleccion obj){
		seleccionados.add(obj);
		return seleccionados; 
	}
	
	@RequestMapping("/eliminaSeleccion")
	@ResponseBody()
	public List<Seleccion> eliminar(int idProducto){
		seleccionados.removeIf( x -> x.getIdProducto() == idProducto);
		return seleccionados; 
	}
	
	@RequestMapping("/registraBoleta")
	@ResponseBody()
	public Mensaje boleta(Cliente cliente, HttpSession session) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		Mensaje objMensaje = new Mensaje();
		
		List<BoletaHasProducto> detalles = new ArrayList<BoletaHasProducto>();
		for (Seleccion seleccion : seleccionados) {
			
			BoletaHasProductoPK pk = new BoletaHasProductoPK();
			pk.setIdProducto(seleccion.getIdProducto());
			
			BoletaHasProducto psb = new BoletaHasProducto();
			psb.setPrecio(seleccion.getPrecio());
			psb.setCantidad(seleccion.getCantidad());
			psb.setProductoHasBoletaPK(pk);
			
			detalles.add(psb);
		}
		
		Boleta obj = new Boleta();
		obj.setCliente(cliente);
		obj.setDetallesBoleta(detalles);
		obj.setUsuario(objUsuario);
		
		Boleta objBoleta =  boletaService.insertaBoleta(obj);
		
		String salida = "-1";
		
		if (objBoleta != null) {
				salida = "Se generó la boleta con código N° : " + objBoleta.getIdBoleta() + "<br><br>";
				salida += "Cliente: " + objBoleta.getCliente().getNombre() + "<br><br>";
				salida += "<table class=\"table\"><tr><td>Producto</td><td>Precio</td><td>Cantidad</td><td>Subtotal</td></tr>";
				double monto = 0;
				for (Seleccion x : seleccionados) {
					salida += "<tr><td>"  + x.getNombre() 
							+ "</td><td>" + x.getPrecio() 
							+ "</td><td>" + x.getCantidad()
							+ "</td><td>" + x.getTotalParcial() + "</td></tr>";
					monto += x.getCantidad() * x.getPrecio();
				}
				salida += "</table><br>";
				salida += "Monto a pagar : " + monto;

				seleccionados.clear();
				objMensaje.setTexto(salida);	
		}
		
		return objMensaje;
	}
	
}*/
}
	

