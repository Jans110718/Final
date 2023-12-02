package com.centroinformacion.controller;

import com.centroinformacion.entity.Devolucion;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.service.DevolucionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/devoluciones")
public class DevolucionController {

    @Autowired
    private DevolucionService devolucionService;

    @GetMapping("/lista")
    public List<Devolucion> listaDevoluciones() {
        return devolucionService.listaDevoluciones();
    }

    @GetMapping("/{id}")
    public Devolucion obtenerDevolucionPorId(@PathVariable int id) {
        return devolucionService.obtenerDevolucionPorId(id);
    }

    @PostMapping("/guardar")
    public Devolucion guardarDevolucion(@RequestBody Devolucion devolucion) {
        return devolucionService.guardarDevolucion(devolucion);
    }

    @GetMapping("/libros/{idAlumno}")
    public List<Libro> listarLibrosPorAlumno(@PathVariable int idAlumno) {
        return devolucionService.findLibrosByAlumnoId(idAlumno);
    }
    @GetMapping("/listaSeleccion/{idAlumno}")
    public ResponseEntity<List<Libro>> listaSeleccion(@PathVariable int idAlumno) {
        List<Libro> libros = devolucionService.findLibrosByAlumnoId(idAlumno);
        return new ResponseEntity<>(libros, HttpStatus.OK);
    }
}
