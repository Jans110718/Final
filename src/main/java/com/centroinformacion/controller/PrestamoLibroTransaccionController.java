package com.centroinformacion.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Mensaje;
import com.centroinformacion.entity.Prestamo;
import com.centroinformacion.entity.PrestamoHasLibro;
import com.centroinformacion.entity.PrestamoHasLibroPK;
import com.centroinformacion.entity.SeleccionPrestamo;
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
public class PrestamoLibroTransaccionController {

	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private LibroService libroService;

	@Autowired
	private PrestamoService prestamoService;

	// Los productos seleccionados
	private List<SeleccionPrestamo> prestamos = new ArrayList<SeleccionPrestamo>();

	@RequestMapping("/listaAlumnoPrestamo")
	@ResponseBody()
	public List<Alumno> listaAlumno(String filtro) {
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Alumno> lstSalida = alumnoService.listaAlumno("%" + filtro + "%", pageable);
		return lstSalida;
	}

	@RequestMapping("/listaLibroPrestamo")
	@ResponseBody()
	public List<Libro> listaLibro(String filtro) {
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Libro> lstSalida = libroService.listaLibroDisponible("%" + filtro + "%", pageable);
		return lstSalida;
	}

	@RequestMapping("/listaSeleccion")
	@ResponseBody()
	public List<SeleccionPrestamo> lista() {
		return prestamos;
	}

	@RequestMapping("/agregarSeleccion")
	@ResponseBody()
	public List<SeleccionPrestamo> agregar(SeleccionPrestamo obj) {
		prestamos.add(obj);
		return prestamos;
	}

	@RequestMapping("/eliminaSeleccion")
	@ResponseBody()
	public List<SeleccionPrestamo> eliminar(int idLibro) {
		prestamos.removeIf(x -> x.getIdLibro() == idLibro);
		return prestamos;
	}

	@RequestMapping("/registraPrestamo")
	@ResponseBody()
	public Mensaje Prestamo(Alumno alumno, 
							HttpSession session ,
							@DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaDevolucion) {
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		Mensaje objMensaje = new Mensaje();

		List<PrestamoHasLibro> detalles = new ArrayList<PrestamoHasLibro>();
		for (SeleccionPrestamo seleccionPrestamo : prestamos) {

			PrestamoHasLibroPK pk = new PrestamoHasLibroPK();
			pk.setIdLibro(seleccionPrestamo.getIdLibro());
			
			PrestamoHasLibro phl = new PrestamoHasLibro();
			phl.setPrestamoHasLibroPK(pk);

			detalles.add(phl);
		}

		Prestamo obj = new Prestamo();
		obj.setFechaRegistro(new Date());
		obj.setFechaPrestamo(new Date());
		obj.setFechaDevolucion(fechaDevolucion);
		obj.setAlumno(alumno);
		obj.setUsuario(objUsuario);
		obj.setDetallesPrestamo(detalles);
		
		Prestamo objPrestamo = prestamoService.insertaPrestamo(obj);
		
		String salida = "-1";
		
		if (objPrestamo != null) {
				salida = "Se generó el prestamo con el código N° : " + objPrestamo.getIdPrestamo() + "<br><br>";
				salida += "Alumno: " + objPrestamo.getAlumno().getNombres()+"<br><br>";
				salida += "<table class=\"table\"><tr><td>Codigo</td><td>Titulo</td></tr>";
				for (SeleccionPrestamo x : prestamos) {
					salida += "<tr><td>"  + x.getIdLibro() 
							+ "</td><td>" + x.getTitulo();
							
				}

				prestamos.clear();
				objMensaje.setTexto(salida);	
		}
		
		return objMensaje;
	}

}