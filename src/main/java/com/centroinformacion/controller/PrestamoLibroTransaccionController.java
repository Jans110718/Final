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
import com.centroinformacion.entity.Seleccion;
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

	/*
	 * @Autowired private PrestamoService prestamoService;
	 */
	// Los productos seleccionados
	private List<Seleccion> prestamos = new ArrayList<Seleccion>();

	@RequestMapping("/cargaAlumno")
	@ResponseBody()
	public List<Alumno> listaAlumno(String filtro) {
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Alumno> lstSalida = alumnoService.listaAlumno("%" + filtro + "%", pageable);
		return lstSalida;
	}

	@RequestMapping("/listaLibro")
	@ResponseBody()
	public List<Libro> listaLibro(String filtro) {
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Libro> lstSalida = libroService.listaLibro("%" + filtro + "%", pageable);
		return lstSalida;
	}

	@RequestMapping("/listaSeleccion")
	@ResponseBody()
	public List<Seleccion> lista() {
		return prestamos;
	}

	@RequestMapping("/agregarSeleccion")
	@ResponseBody()
	public List<Seleccion> agregar(Seleccion obj) {
		prestamos.add(obj);
		return prestamos;
	}

	@RequestMapping("/eliminaSeleccion")
	@ResponseBody()
	public List<Seleccion> eliminar(int idLibro) {
		prestamos.removeIf(x -> x.getIdLibro() == idLibro);
		return prestamos;
	}

	@RequestMapping("/registraPrestamo")
	@ResponseBody()
	public Mensaje Prestamo(Alumno alumno, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		Mensaje objMensaje = new Mensaje();

		List<PrestamoHasLibro> detalles = new ArrayList<PrestamoHasLibro>();
		for (Seleccion seleccion : prestamos) {

			PrestamoHasLibroPK pk = new PrestamoHasLibroPK();
			PrestamoHasLibro phl = new PrestamoHasLibro();
			phl.setPrestamoHasLibroPK(pk);

			detalles.add(phl);
		}

		Prestamo obj = new Prestamo();
		obj.setAlumno(alumno);
		obj.setUsuario(objUsuario);

		return objMensaje;
	}

}