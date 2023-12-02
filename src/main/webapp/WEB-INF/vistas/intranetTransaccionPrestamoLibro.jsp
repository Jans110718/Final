<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Intranet</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%"><h4>Prestamo de Libro</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->

<form id="id_form" accept-charset="UTF-8" action="boleta" class="form-horizontal" method="post">

    <div class="panel-group" id="steps">

        <!-- Panel 1: Prestamo -->
        <div class="panel panel-default">
            <div class="panel-heading">PRESTAMO</div>
            <div class="panel-body">

                <div class="form-group col-md-5">
                    <label class="col-lg-2 control-label">Alumno</label>
                    <div class="col-lg-8">
                        <input type="text" id="id_alumno_nombre" class="form-control" readonly="readonly"/>
                    </div>
                </div>

                <div class="form-group col-md-4">
                    <div class="col-lg-6">
                        <button type="button" id="id_btnAlumno" data-toggle='modal' class='btn btn-primary' style="width: 170px">BUSCA ALUMNO</button>
                        <input type="hidden" name="idAlumno" id="id_Alumno_id" class="form-control" value="-1"/>
                    </div>
                </div>

                <div class="form-group  col-sm-3">
                    <label class="control-label" for="id_fechaDevolucion">Fecha de Prestamo:</label>
                    <input class="form-control" type="date" id="id_fechaPrestamo" name="fechaPrestamo" placeholder="Ingrese la fecha de prestamo" maxlength="100">
                </div>

                <div class="form-group  col-md-5">
                    <label class="col-lg-2 control-label">Libros</label>
                    <div class="col-lg-8">
                        <input type="text" name="titulo" id="id_libro_nombre" class="form-control" readonly="readonly"/>
                    </div>
                </div>

                <div class="form-group  col-md-4" >
                    <div class="col-lg-6">
                        <button type="button" id="id_btnLibro" data-toggle='modal' class='btn btn-primary' style="width: 170px">BUSCA LIBROS</button>
                        <input type="hidden" name="idLibro" id="id_Libro_id" class="form-control" value="-1"/>									
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-9 col-lg-offset-5">
                        <div class="col-lg-9 col-lg-offset-3">
                            <button type="button" id="id_btnAgregar" class="btn btn-primary" style="width: 170px">AGREGA PRODUCTO</button>
                            <button type="button" id="id_btnRegistrar"  class="btn btn-primary" style="width: 170px">REGISTRA BOLETA</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Panel 2: Detalle del Prestamo -->
        <div class="panel panel-default">
            <div class="panel-heading">Detalle del Prestamo</div>
            <div class="panel-body">
               
                
                <div class="form-group">
                    <div class="col-lg-12">
                        <table id="id_table_boleta" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                  				<th style="width: 10%">Código</th>
												<th style="width: 25%">Titulo</th>
												<th style="width: 35%">Alumno</th>
												
												<th style="width: 20%">Fecha Prestamo</th>																			
												<th style="width: 10%"></th>
                               
                               
                                </tr>
                            </thead>
                            <tbody id="id_table_boleta_body"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>


<!-- El formulario de busqueda de Alumno (Modal) -->

  	 <div class="modal fade" id="idBuscaAlumno" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Alumno</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Alumno 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtAlumno" class="form-control" name="Alumno" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_alumno" class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="width: 15%">Código</th>
																<th style="width: 40%">Nombre</th>
																<th style="width: 35%">Apellido</th>
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
			                        </div>
		                    </div>
					</div>
			</div>
			</div>
		</div>

<!-- El formulario de busqueda de Libro (Modal) -->

  	 <div class="modal fade" id="idBuscaLibro" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Libro 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtLibro" class="form-control" name="libro" type="text" />
													</div>
											</div>
							<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_libro" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 40%">Id</th>
																<th style="width: 50%">Título</th>
																<th style="width: 35%">Estado</th>
																
																<th style="width: 10%"></th>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
		                        </div>
		                    </div>
				</div>
			</div>
			</div>
		</div>


	<!-- Modal Mensaje -->	
		  <div class="modal fade" id="idMensaje" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 20px 20px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Mensaje</h4>
				</div>
				<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">

			    </div>
			</div>
			</div>
		</div>

</form>

</div>




<script type="text/javascript">
<!-- Agregar aquí -->
	$(document).ready(function() {
		//Se añade los alumnos a la tabla
		$.getJSON("listaSeleccion",{}, function (data){
			$.each(data, function(index, item){
				$('#id_table_boleta_body').append("<tr><td>" +item.idLibro + "</td><td>" +item.titulo +"</td><td>"+
						var_fech + item.nombre + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idAlumno +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
			});
		});
		
	});
	
	
	

	
	
	
	
	//Al pulsar el boton alumno
	$("#id_btnAlumno").click(function (){
		muestraAlumno();
		$("#idBuscaAlumno").modal("show");
	});

	//Al pulsar el bot�n libro
	$("#id_btnLibro").click(function (){
		muestraLibro();
		$("#idBuscaLibro").modal("show");
	});

	//Al escribir en la caja de texto del alumno
	$("#id_txtAlumno").keyup( function (e){
		muestraAlumno();
	});

	//Al escribir en la caja de texto del libro
	$("#id_txtLibro").keyup( function (e){
		muestraLibro();
	});

	//Se anula el enter
	$(document).on("keypress", "form", function(event) { 
	    return event.keyCode != 13;
	});

	
	//Al pulsar el botón agregar
$("#id_btnAgregar").click(function (){
	var var_Alum = $("#id_alumno_nombre").val();
	var var_lib = $("#id_libro_nombre").val();
		var var_fech = $("#id_fechaPrestamo").val();

	
	

	//Validar duplicados
	var yaExiste = false;
	$("#id_table_boleta_body tr").each(function() {
		if($(this).find('td:eq(0)').html() == var_lib){
			yaExiste = true;
		}
	});
	
	if ( var_lib == '-1' ){
		$("#idMensajeTexto").text("Seleccione un Libro");
		$("#idMensaje").modal("show");
}else if (yaExiste){
		$("#idMensajeTexto").text("Existe el producto elegido");
		$("#idMensaje").modal("show");
	}else{
		
		var var_tit = $("#id_titulo").val();


					
			//limpiar la tabla
			$("#id_table_boleta_body").empty();
				
			var jsonParam = {"idLibro":,idLibro,"titulo":var_lib,"idAlumno":var_Alum, "fechaPrestamo":var_fech };
			
			$.ajax({
				url:  'agregarSeleccion',
				type: 'POST',
				dataType:'json',
				data: jsonParam,
				success:function(data){
					console.log(data);
					if(data != null){
						$.each(data, function(index, item){
							$('#id_table_boleta_body').append("<tr><td>" +item.idLibro + "</td><td>" + vra_lib + "</td><td>" + var_Alum + "</td><td>" + var_fech + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
						});
						
					}else
						swal("Error al agregar la selección del Libro","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });	
			   
				
			//limpia las cajas de texto
			$("#id_alumno_nombre").val("");
			$("#id_libro_nombre").val("");
			$("#id_fechaPrestamo").val("");

		}
	});

	


	
	//Al pulsar el botón agregar
	$("#id_btnRegistrar").click(function (){
	var var_alu= $("#id_alumno_nombre").val();
	var var_ape = $("#id_libro_nombre").val();
	var var_nom = $("#id_fechaPrestamo").val();
	var var_idLibro=  item.idLibro;
	var var_idAlumno=  item.idAlumno;

	var var_count = 0;
	$("#id_table_boleta_body tr").each(function() {
		var_count = var_count + 1;
	});
	
	if (var_cli == "-1"){
		$("#idMensajeTexto").text("Seleccione un alumno");
		$("#idMensaje").modal("show");
	}else if (var_count < 1){
		$("#idMensajeTexto").text("Seleccione un libro");
		$("#idMensaje").modal("show");
	}else{

		var jsonParam = {"idAlumno":var_alu};

		$.ajax({
			url:  'registraBoleta',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				if(data.texto != "-1"){
					console.log(data.texto);
					$("#idMensajeTexto").html(data.texto);
					$("#idMensaje").modal("show");
					$("#id_table_boleta_body").empty();
					$("#id_alumno_id").val("-1");
					$("#id_nombres").val("");
					$("#id_apellidos").val("");
				}else
					swal("Error al agregar la Boleta","","error");
					return false;
				},
			error: function (jqXhr) { 
				swal("Error en la conexion","","error");
			}
	   });	
		   
	}
});



/////////// muestra alumno

	function muestraAlumno(){
	
	var var_alumno = $("#id_txtAlumno").val();
		//limpiar la tabla
		$("#id_table_alumno tbody").empty();
		console.log("Función muestraAlumno() llamada");
		//Se añade los alumnos a la tabla
		$.getJSON("cargaAlumno",{"filtro":var_alumno}, function (data){
			$.each(data, function(index, item){
				$('#id_table_alumno').append("<tr><td>" +item.idAlumno + "</td><td>" +item.nombres + "</td><td>" +item.apellidos + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_alumno('"+ item.idAlumno+"','"+ item.nombres+"','"+ item.apellidos+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}


//                 muestra Libro


	function muestraLibro(){
		var var_libro = $("#id_txtLibro").val();

		//limpiar la tabla
		$("#id_table_libro tbody").empty();
	    console.log("Función muestraLibro() llamada ");
		//Se a�ade los clientes a la tabla
		$.getJSON("listaLibro",{"filtro":var_libro}, function (data){
			$.each(data, function(index, item){
			    $('#id_table_libro').append("<tr><td>" +item.idLibro + "</td><td>" +item.titulo + "</td><td>"    + item.estadoPrestamo.descripcion + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_libro('"+ item.idLibro+"','"+ item.titulo +"','"+  item.estadoPrestamo.descripcion +"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}



	//Al pulsar selecciona alumno
	function f_seleccione_alumno(idAlumno,nombres,apellidos){
		$("#id_alumno_nombre").val(nombres + ' ' + apellidos);

		$("#idBuscaAlumno").modal("hide");
	}
	
	//Al pulsar selecciona producto
	function f_seleccione_libro(idLibro,titulo,estadoPrestamo){
		$("#id_libro_nombre").val(titulo);
		$("#idBuscaLibro").modal("hide");
	}

	
	
	//Al pulsar el botón eliminar
	function f_elimina_seleccion(id){	
		//limpiar la tabla
		$("#id_table_boleta_body").empty();
			
		//Se añade los clientes a la tabla
		$.getJSON("eliminaSeleccion",{"idPrestamo":id}, function (data){
			$.each(data, function(index, item){
				$('#id_table_boleta_body').append("<tr><td>" +item.idLibro + "</td><td>" +item.titulo + "</td><td>" +item.idAlumno + "</td><td>" +item.fechaPrestamo+ "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idPrestamo +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
			});
		});
		//limpia las cajas de texto
		  $("#id_alumno_nombre").val("");
	      $("#id_libro_nombre").val("");
	      $("#id_fechaPrestamo").val("");
		
	}
		
	//Solo numeros en caja de texto
	function validarSoloNumerosEnteros(e) { // 1
		tecla = (document.all) ? e.keyCode : e.which; // 2
		if (tecla == 8)	return true; // 3
		patron = /[0-9]/;// Solo acepta números
		te = String.fromCharCode(tecla); // 5
		return patron.test(te); // 6
	}
	
	

</script>   		
</body>
</html>