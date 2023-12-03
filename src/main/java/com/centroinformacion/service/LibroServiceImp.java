package com.centroinformacion.service;
/**
 * @author Yheremi Ramos
 */

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.repository.LibroRepository;


@Service
public class LibroServiceImp implements LibroService {
	@Autowired
	private LibroRepository repository;
	
	@Override
	public Libro insertaActualizaLibro(Libro obj) {
		return repository.save(obj);
	}

	@Override
	public List<Libro> listaPorTituloLike(String filtro) {
		return repository.listPorTituloLike(filtro);
	}

	@Override
	public List<Libro> listaPorTituloOrSerie(String titulo, String serie) {
		return repository.findByTituloOrSerieIgnoreCase(titulo,serie);
	}

	@Override
	public Optional<Libro> buscaTitulo(int idLibro) {
		return repository.findById(idLibro);
	}

	@Override
	public List<Libro> listaPorTitulo(String titulo) {
		return repository.findByTitulo(titulo);
	}
	
	@Override
	public List<Libro> listaPorSerie(String serie) {
		return repository.findBySerie(serie);
	}

	@Override
	public List<Libro> listaPorTituloActualizar(String titulo, int idLibro) {
		return repository.listaPorTituloActualizar(titulo,idLibro);
	}

	@Override
	public List<Libro> listaPorSerieActualizar(String serie, int idLibro) {
		return repository.listaPorSerieActualizar(serie, idLibro);
	}

	@Override
	public Libro actualizarLibro(Libro obj) {
		return repository.save(obj);
	}

	@Override
	public List<Libro> listaConsultaLibro(int estado, int idCategoriaLibro, int idTipoLibro, String titulo,String serie,int anio) {
		return repository.listaConsultaLibro(estado, idCategoriaLibro, idTipoLibro, titulo,serie,anio);
	}

/*Transacción PrestamoLibro*/
	

	//consultas
	

	@Override
	public List<Libro> listaLibroDisponible(String filtro, Pageable pageable) {
		return repository.listaLibroDisponible(filtro, pageable);
	}
	
	
}
