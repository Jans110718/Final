package com.centroinformacion.util;

import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class AppSettings {

	
	private static DecimalFormatSymbols simbolos = new DecimalFormatSymbols();

	public static boolean isMayorEdad(String strFechaIngresada) {
		//Convierte de String a Date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dateFechaIngresada = null;
		try {
			dateFechaIngresada =  sdf.parse(strFechaIngresada);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//Se obtiene la fecha limite del mayor de edad
		Calendar cal = Calendar.getInstance(); //5/10/2023
		int anioActual = cal.get(Calendar.YEAR);
		cal.set(Calendar.YEAR, anioActual - 18);
		Date fechaMayorEdadLimite = cal.getTime(); //5/10/2005
		
		//Convierte de String a Date
		if(dateFechaIngresada.before(fechaMayorEdadLimite)) {
			return true;
		}else {
			return false;
		}
	}
	
	
	
	
	
	public static final int CATALOGO_01_CATEGORIA_DE_LIBRO = 1;
	public static final int CATALOGO_02_TIPO_DE_PROVEEDOR = 2;
	public static final int CATALOGO_03_MODALIDAD_DE_ALUMNO = 3;
	public static final int CATALOGO_04_GRADO_DE_AUTOR = 4;
	public static final int CATALOGO_05_TIPO_DE_LIBRO_Y_REVISTA = 5;
	public static final int CATALOGO_06_TIPO_DE_SALA = 6;
	public static final int CATALOGO_07_SEDE = 7;
	public static final int CATALOGO_08_ESTADO_DE_LIBRO = 8;
	
	public static final int ACTIVO = 1;
	public static final int INACTIVO = 0;
}


