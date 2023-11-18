package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.service.LibroService;

@Controller

public class LibroConsultaController{
	@Autowired
	private LibroService libroService;
	
	@GetMapping("/verConsultaLibros")
	public String verInicio() {
		return "consultaLibro";
	}
	
	@GetMapping("/consultaLibro")
	@ResponseBody
	public List<Libro> consulta(
			int estado,
			int idCategoriaLibro,
			int idTipoLibro,
			String titulo,
			int desde,
			int hasta
			)
	
	{
		List<Libro> lstSalida = libroService.listaConsultaLibro(estado, idCategoriaLibro, idTipoLibro, "%"+titulo+"%", desde, hasta);
				return lstSalida;
	}
}