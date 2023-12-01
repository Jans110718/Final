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
<div class="container" style="margin-top: 4%"><h4>Préstamo de Libro</h4></div>

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
                    <label class="control-label" for="id_fechaDevolucion">Fecha de devolucion:</label>
                    <input class="form-control" type="date" id="id_fechaDevolucion" name="fechaDevolucion" placeholder="Ingrese la fecha de devolucion" maxlength="100">
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
									<th style="width: 35%">Alumno</th>
									<th style="width: 30%">Libro</th>
									<th style="width: 25%">F. Devolucion</th>
                               
                               
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
																<th style="width: 15%">Id</th>
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
														Producto 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtLibro" class="form-control" name="producto" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_libro" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 5%">Id Libro</th>
																<th style="width: 20%">Titulo</th>
															   <th style="width: 20%">Año</th>
																<th style="width: 20%">Serie</th>
																<th style="width: 20%">Estado</th>
																	<th style="width: 5%"></th>
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
		$.getJSON("",{}, function (data){
			$.each(data, function(index, item){
				$('#id_table_boleta_body').append("<tr><td>" +item.idAlumno + "</td><td>" +item.nombres + "</td><td>" +item.apellidos + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idAlumno +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
			});
		});
		
	});
	//Al pulsar el botón alumno
	$("#id_btnAlumno").click(function (){
		muestraAlumno();
		$("#idBuscaAlumno").modal("show");
	});
	//Al pulsar el botón producto
	$("#id_btnLibro").click(function (){
		muestraProducto();
		$("#idBuscaLibro").modal("show");
	});
	
	//Al escribir en la caja de texto del alumno
	$("#id_txtAlumno").keyup( function (e){
		muestraAlumno();
	});
	
	//Al escribir en la caja de texto del cliente
	$("#id_txtLibro").keyup( function (e){
		muestraProducto();
	});
	
	//Se anula el enter
	$(document).on("keypress", "form", function(event) { 
	    return event.keyCode != 13;
	});
	
	//Al pulsar el botón agregar
	$("#id_btnAgregar").click(function (){
		var var_pro = $("#id_libro_id").val();
		
		//Validar duplicados
		var yaExiste = false;
		$("#id_table_boleta_body tr").each(function() {
			if($(this).find('td:eq(0)').html() == var_pro){
				yaExiste = true;
			}
		});
		
		if ( var_pro == '-1' ){
			$("#idMensajeTexto").text("Seleccione un Libro");
			$("#idMensaje").modal("show");
		}else if (yaExiste){
			$("#idMensajeTexto").text("Existe el producto elegido");
			$("#idMensaje").modal("show");
		}else{
			
			var var_nom = $("#id_producto_nombre").val();
			var var_pre = $("#id_producto_precio").val();
					
			//limpiar la tabla
			$("#id_table_boleta_body").empty();
				
			var jsonParam = {"idProducto":var_pro,"nombre":var_nom,"precio":var_pre,"cantidad":var_can};
			
			$.ajax({
				url:  'agregarSeleccion',
				type: 'POST',
				dataType:'json',
				data: jsonParam,
				success:function(data){
					console.log(data);
					if(data != null){
						$.each(data, function(index, item){
							$('#id_table_boleta_body').append("<tr><td>" +item.idProducto + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.cantidad + "</td><td>" +item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idProducto +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
						});
						
					}else
						swal("Error al agregar la selección del producto","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });	
			   
				
			//limpia las cajas de texto
			$("#id_producto_id").val("-1");
			$("#id_producto_nombre").val("");
			$("#id_producto_precio").val("");
			$("#id_producto_stock").val("");
			$("#id_producto_cantidad").val("");
		}
	});
	
	
	//Al pulsar el botón agregar
	$("#id_btnRegistrar").click(function (){
		var var_cli = $("#id_cliente_id").val();
		var var_ape = $("#id_cliente_apellido").val();
		var var_nom = $("#id_cliente_nombre").val();
		var var_nom_com =  var_nom + ' ' + var_ape;
		
		var var_count = 0;
		$("#id_table_boleta_body tr").each(function() {
			var_count = var_count + 1;
		});
		
		if (var_cli == "-1"){
			$("#idMensajeTexto").text("Seleccione un cliente");
			$("#idMensaje").modal("show");
		}else if (var_count < 1){
			$("#idMensajeTexto").text("Seleccione un producto");
			$("#idMensaje").modal("show");
		}else{
			var jsonParam = {"idCliente":var_cli,"nombre":var_nom_com};
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
						$("#id_cliente_id").val("-1");
						$("#id_cliente_nombre").val("");
						$("#id_cliente_apellido").val("");
					}else
						swal("Error al agregar la Boleta","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });	
			   
		}
	});
	
	
	function muestraAlumno(){
		var var_cliente = $("#id_txtAlumno").val();
		//limpiar la tabla
		$("#id_table_alumno tbody").empty();
		
		//Se añade los clientes a la tabla
		$.getJSON("cargaAlumno",{"filtro":var_cliente}, function (data){
			$.each(data, function(index, item){
				$('#id_table_alumno').append("<tr><td>" +item.idAlumno
						+ "</td><td>" +item.nombres + "</td><td>" +item.apellidos + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_cliente('"+ item.idCliente+"','"+ item.nombre+"','"+ item.apellido+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}
	function muestraProducto(){
		var var_producto = $("#id_txtLibro").val();
		//limpiar la tabla
		$("#id_table_libro tbody").empty();
		
		//Se añade los clientes a la tabla
		$.getJSON("cargaLibro",{"filtro":var_producto}, function (data){
			$.each(data, function(index, item){
				$('#id_table_libro').append("<tr><td>" +item.idLibro + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.stock + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_producto('"+ item.idProducto+"','"+ item.nombre+"','"+ item.precio+"','"+ item.stock+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}
	//Al pulsar selecciona cliente
	function f_seleccione_cliente(idAlumno,nombres,apellidos){
		$("#id_alumno_id").val(id);
		$("#id_alumno_nombre").val(nombres);
		$("#id_alumno_apellido").val(apellidos);
		$("#idBuscaAlumno").modal("hide");
	}
	
	//Al pulsar selecciona producto
	function f_seleccione_producto(id,nombre,precio,stock){
		$("#id_producto_id").val(id);
		$("#id_producto_nombre").val(nombre);
		$("#id_producto_precio").val(precio);
		$("#id_producto_stock").val(stock);
		$("#idBuscaLibro").modal("hide");
	}
	
	//Al pulsar el botón eliminar
	function f_elimina_seleccion(id){	
		//limpiar la tabla
		$("#id_table_boleta_body").empty();
			
		//Se añade los clientes a la tabla
		$.getJSON("eliminaSeleccion",{"idProducto":id}, function (data){
			$.each(data, function(index, item){
				$('#id_table_boleta_body').append("<tr><td>" +item.idProducto + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.cantidad + "</td><td>" +item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idProducto +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
			});
		});
		//limpia las cajas de texto
		$("#id_producto_id").val("-1");
		$("#id_producto_nombre").val("");
		$("#id_producto_precio").val("");
		$("#id_producto_stock").val("");
		$("#id_producto_cantidad").val("");
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