package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Libro;

public interface LibroService {
	
	
	public abstract Libro insertaActualizaLibro(Libro obj);
	public abstract List<Libro> listaPorNumeroSerie(String serie);
	
	
	
}
