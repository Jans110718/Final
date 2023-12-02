package com.centroinformacion.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Mensaje;
import com.centroinformacion.entity.Prestamo;
import com.centroinformacion.entity.PrestamoHasLibro;
import com.centroinformacion.entity.PrestamoHasLibroPK;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.service.LibroService;
import com.centroinformacion.service.PrestamoService;

import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class PrestamoLibroTransaccionController{

	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private LibroService libroService;

	@Autowired
	private PrestamoService prestamoService;
	
	//Los productos seleccionados
		private List<Prestamo> seleccionados = new ArrayList<Prestamo>();
		
		
	@RequestMapping("/cargaAlumno")
	@ResponseBody()
	public List<Alumno> listaAlumno(String filtro){
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Alumno> lstSalida = alumnoService.listaAlumno("%"+filtro+"%", pageable);
		return lstSalida;		
	}
		
	@RequestMapping("/listaLibro")
	@ResponseBody()
	public List<Libro> listaLibro(String filtro){
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Libro> lstSalida = libroService.listaLibro("%"+filtro+"%", pageable);
		return lstSalida;		
	}
	

	@RequestMapping("/listaSeleccion")
	@ResponseBody()
	public List<Prestamo> lista(){
		return seleccionados; 
	}
	
	@RequestMapping("/agregarSeleccion")
	@ResponseBody()
	public List<Prestamo> agregar(Prestamo obj){
		seleccionados.add(obj);
		return seleccionados; 
	}
	
	
	@RequestMapping("/eliminaSeleccion")
	@ResponseBody()
	public List<Prestamo> eliminar(int idPrestamo){
		seleccionados.removeIf( x -> x.getIdPrestamo() == idPrestamo);
		return seleccionados; 
	}
	
	/*@RequestMapping("/registraBoleta")
	@ResponseBody()
	public Mensaje boleta(Alumno cliente, HttpSession session) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		Mensaje objMensaje = new Mensaje();
		
		List<PrestamoHasLibro> detalles = new ArrayList<PrestamoHasLibro>();
		for (Prestamo seleccion : seleccionados) {
			
			PrestamoHasLibroPK pk = new PrestamoHasLibroPK();
			pk.setIdPrestamo(seleccion.getIdPrestamo());
			
			PrestamoHasLibro psb = new PrestamoHasLibro();
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
				for (Prestamo x : seleccionados) {
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
	}*/
}
