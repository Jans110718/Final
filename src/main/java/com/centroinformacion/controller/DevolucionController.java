package com.centroinformacion.controller;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Devolucion;
import com.centroinformacion.entity.DevolucionHasLibro;
import com.centroinformacion.entity.DevolucionHasLibroPK;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Mensaje;
import com.centroinformacion.entity.SeleccionDevolucion;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.service.DevolucionService;
import com.centroinformacion.service.LibroService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/devoluciones")
public class DevolucionController {

    @Autowired
    private DevolucionService devolucionService;
    @Autowired
	private AlumnoService alumnoService;

	@Autowired
	private LibroService libroService;
	// Los productos seleccionados
		private List<SeleccionDevolucion> devoluciones = new ArrayList<SeleccionDevolucion>();
		@RequestMapping("/listaAlumnoDevolucion")
		@ResponseBody()
		public List<Alumno> listaAlumno(String filtro) {
		    int page = 0;
		    int size = 5;
		    Pageable pageable = PageRequest.of(page, size);
		    List<Alumno> lstSalida = alumnoService.listaAlumno("%" + filtro + "%", pageable);
		    return lstSalida;
		}


		@RequestMapping("/listaLibroDevolucion")
		@ResponseBody()
		public List<Libro> listaLibro(String filtro) {
			int page = 0;
			int size = 5;
			Pageable pageable = PageRequest.of(page, size);
			List<Libro> lstSalida = libroService.listaLibroDisponible("%"+filtro+"%", pageable);
			return lstSalida;
		}

		@RequestMapping("/listaSeleccion")
		@ResponseBody()
		public List<SeleccionDevolucion> lista() {
			return devoluciones;
		}

		@RequestMapping("/agregarSeleccion")
		@ResponseBody()
		public List<SeleccionDevolucion> agregar(SeleccionDevolucion obj) {
			devoluciones.add(obj);
			return devoluciones;
		}

		@RequestMapping("/eliminaSeleccion")
		@ResponseBody()
		public List<SeleccionDevolucion> eliminar(int idLibro) {
			devoluciones.removeIf(x -> x.getIdLibro() == idLibro);
			return devoluciones;
		}
		
		
		@RequestMapping("/registraDevolucion")
		@ResponseBody()
		public Mensaje Devolucion(Alumno alumno, 
								HttpSession session ,
								@DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaDevolucion) {
			
			Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
			Mensaje objMensaje = new Mensaje();

			List<DevolucionHasLibro> detalles = new ArrayList<DevolucionHasLibro>();
			for (SeleccionDevolucion seleccionDevolucion : devoluciones) {

				DevolucionHasLibroPK pk = new DevolucionHasLibroPK();
				pk.setIdLibro(seleccionDevolucion.getIdLibro());
				
				DevolucionHasLibro phl = new DevolucionHasLibro();
				phl.setDevolucionHasLibroPK(pk);

				detalles.add(phl);
			}

			Devolucion obj = new Devolucion();
			obj.setFechaRegistro(new Date());
			obj.setFechaPrestamo(new Date());
			obj.setFechaDevolucion(fechaDevolucion);
			obj.setAlumno(alumno);
			obj.setUsuario(objUsuario);
			obj.setDetallesDevolucion(detalles);
			
			Devolucion objDevolucion = devolucionService.insertaDevolucion(obj);
			
			String salida = "-1";
			
			if (objDevolucion != null) {
					salida = "Se generó la devolucion con el código N° : " + objDevolucion.getIdDevolucion() + "<br><br>";
					salida += "Alumno: " + objDevolucion.getAlumno().getNombres()+"<br><br>";
					salida += "<table class=\"table\"><tr><td>Codigo</td><td>Titulo</td></tr>";
					for (SeleccionDevolucion x : devoluciones) {
						salida += "<tr><td>"  + x.getIdLibro() 
								+ "</td><td>" + x.getTitulo();
								
					}

					devoluciones.clear();
					objMensaje.setTexto(salida);	
			}
			
			return objMensaje;
		}
}
