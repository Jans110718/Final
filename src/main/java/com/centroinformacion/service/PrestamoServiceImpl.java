package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Prestamo;
import com.centroinformacion.entity.PrestamoHasLibro;
import com.centroinformacion.repository.PrestamoHasLibroRepository;
import com.centroinformacion.repository.PrestamoRepository;

import jakarta.transaction.Transactional;

@Service

public class PrestamoServiceImpl implements PrestamoService {

	
	@Autowired
	private PrestamoRepository prestamoRepository;
	
	@Override
	@Transactional
	public Prestamo insertaPrestamo(Prestamo obj) {
		Prestamo objCabecera = prestamoRepository.save(obj);
	    return objCabecera;
	}

}
