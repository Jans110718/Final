package com.centroinformacion.repository;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Libro;

/**
 * @author Yheremi Ramos
 */
public interface LibroRepository extends JpaRepository<Libro, Integer>  {

	public List<Libro> findBySerieIgnoreCase(String serie);
	
	public List<Libro> findByTituloOrSerieIgnoreCase(String titulo,String serie);
	
	public List<Libro> findByTitulo(String titulo);
	public List<Libro> findBySerie(String serie);
	
	@Query("select p from Libro p where p.titulo like ?1")
	public List<Libro> listPorTituloLike(String filtro);
	
	@Query("select a from Libro a where a.titulo = ?1 and a.idLibro != ?2")
	public List<Libro> listaPorTituloActualizar(String titulo,  int idLibro);

	
	
	@Query("select a from Libro a where a.serie = ?1 and a.idLibro != ?2")
	public List<Libro> listaPorSerieActualizar(String serie, int idLibro);

	
	@Query("select e from Libro e where "
			+ "( e.estado = ?1)  and "
			+ "( ?2 = -1  or e.categoriaLibro.idDataCatalogo = ?2  or e.tipoLibro.idDataCatalogo = ?3) and "
			+ "( e.titulo like ?4 ) and "
			+ "( e.serie like ?5 ) and "
			+ "(  ?6 = -1 or e.anio = ?6 ) ") 
	public abstract List<Libro> listaConsultaLibro(
			int estado, int idCategoriaLibro, int idTipoLibro, String titulo,String serie,int anio);
	
	/*Permnite hacer un filtro de busqueda mediante el buscador en el modal buscar libbro*/
	@Query("select p from Libro p where "
		    + "( p.titulo like ?1)  and "
		    + "( p.anio = ?2 ) and"
		    + "( p.serie like ?3 )and"
		    + "( p.estado = ?4) "
		    )
	public abstract List<Libro> listaLibro(String filtro, Pageable pageable);

}



