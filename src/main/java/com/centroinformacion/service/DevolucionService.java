package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Devolucion;
import com.centroinformacion.entity.Libro;

public interface DevolucionService {

    List<Devolucion> listaDevoluciones();

    Devolucion obtenerDevolucionPorId(int id);
    List<Libro> findLibrosByAlumnoId(int idAlumno);
    Devolucion guardarDevolucion(Devolucion devolucion);
}
