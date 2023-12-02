package com.centroinformacion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Devolucion;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.repository.DevolucionRepository;
import com.centroinformacion.repository.LibroRepository;

@Service
public class DevolucionServiceImp implements DevolucionService {

    @Autowired
    private DevolucionRepository devolucionRepository;
    @Autowired
    private LibroRepository libroRepository;
    @Override
    public List<Devolucion> listaDevoluciones() {
        return devolucionRepository.findAll();
    }

    @Override
    public Devolucion obtenerDevolucionPorId(int id) {
        return devolucionRepository.findById(id).orElse(null);
    }

    @Override
    public Devolucion guardarDevolucion(Devolucion devolucion) {
        return devolucionRepository.save(devolucion);
    }

    @Override
    public List<Libro> findLibrosByAlumnoId(int idAlumno) {
        // Llamar al método en LibroRepository
        return libroRepository.ListaLibrosDeAlumnoId(idAlumno);
    }
}
