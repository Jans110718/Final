package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Prestamo;
import com.centroinformacion.entity.PrestamoHasLibro;
import com.centroinformacion.repository.PrestamoHasLibroRepository;
import com.centroinformacion.repository.PrestamoRepository;

import jakarta.transaction.Transactional;

@Service

public class PrestamoServiceImpl {

	
/*	@Autowired
	private PrestamoRepository prestamoRepository;
	
	@Autowired
	private PrestamoHasLibroRepository boletaHasProductoRepository;
	
	@Autowired
	private PrestamoRepository ProductoRepository;
	*/
	/*@Override
	@Transactional
	public Prestamo insertaPrestamo(Prestamo obj) {
		Prestamo objCabecera = PrestamoRepository.save(obj);
		for (PrestamoHasLibro detalle: obj.getDetallesBoleta()) {
			detalle.getPrestamoHasLibroPK().setIdBoleta(objCabecera.getIdBoleta());
			PrestamoHasLibroRepository.save(detalle);
			ProductoRepository.actualizaStock(detalle.getPrestamoHasLibroPK().getIdLibro());
		}
		return objCabecera;
*/
}
