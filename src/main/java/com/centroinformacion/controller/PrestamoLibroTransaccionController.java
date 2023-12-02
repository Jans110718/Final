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
import com.centroinformacion.entity.Prestamo;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.service.LibroService;

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

	/*@Autowired
	private PrestamoService prestamoService;
	*/
	//Los productos seleccionados
		private List<Prestamo> prestamos = new ArrayList<Prestamo>();
		
		
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
		return prestamos; 
	}
	
	@RequestMapping("/agregarSeleccion")
	@ResponseBody()
	public List<Prestamo> agregar(Prestamo obj){
		prestamos.add(obj);
		return prestamos; 
	}
	
	
	
}
