package com.centroinformacion.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.service.LibroService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.apachecommons.CommonsLog;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
@CommonsLog
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
			String serie,
			int desde,
			int hasta
			)
	
	{
		List<Libro> lstSalida = libroService.listaConsultaLibro(estado, idCategoriaLibro, idTipoLibro, "%"+titulo+"%", "%"+serie+"%", desde, hasta);
				return lstSalida;
	}
	
	
	@GetMapping("/reporteLibroPdf")
	public void reportes(HttpServletRequest request,HttpServletResponse response ,
		
			String titulo,
			boolean paramEstado,
			int paramDesde,
			int paramHasta,
			String serie, 
			int idCategoriaLibro,
			int idTipoLibro
			)
		{
		
		try {
		/*PASO 1 : Obtener el dataSource que se va generar el reporte */
		List<Libro> lstSalida = libroService.listaConsultaLibro(
				paramEstado?1:0, idCategoriaLibro, idTipoLibro, "%"+titulo+"%", 
				"%"+serie+"%", paramDesde, paramHasta);
		
		JRBeanCollectionDataSource dataSource= new JRBeanCollectionDataSource(lstSalida);
		
		
		//PASO 2: Obtener el archivo que contiene el diseño del reporte
				String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/reporteLibro.jasper"); 
				log.info(">>> File >> " + fileDirectory);
				
				FileInputStream stream   = new FileInputStream(new File(fileDirectory));
				
				//PASO 3: Parametros adicionales
				String fileLogo = request.getServletContext().getRealPath("/WEB-INF/img/cherry.jpg");
				log.info(">>> File Logo >> " + fileLogo);
				
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("logo", fileLogo);
				
				
				//PASO 4: Enviamos dataSource, diseño y parámetros para generar el PDF
				JasperReport jasperReport = (JasperReport) JRLoader.loadObject(stream);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
				
				
				//PASO 5: Enviar el PDF generado
				response.setContentType("application/x-pdf");
			    response.addHeader("Content-disposition", "attachment; filename= ReporteLibro.pdf");

				OutputStream outStream = response.getOutputStream();
				JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

				
				
				
		}catch(Exception e) {
			
			e.printStackTrace();
		}
}
	

	
}