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
<div class="container" style="margin-top: 4%"><h4>Devolucion de Libro</h4></div>

<div class="container" style="margin-top: 1%">
	<form id="id_form" accept-charset="UTF-8" action="devolucion" class="form-horizontal" method="post">
			<div class="panel-group" id="steps">
				<div class="panel panel-default">
					<div class="panel-heading">Selección del Alumno</div>
						<div class="panel-body">
							<div class="form-group col-md-4">
								<div class="col-lg-4">
									<button type="button" id="id_btnAlumno" data-toggle='modal' class='btn btn-primary' style="width: 170px">BUSCA ALUMNO</button>
									<input type="hidden" name="idAlumno" id="id_Alumno_id" class="form-control" value="-1"/>
								</div>
							</div> 
							<div class="form-group  col-md-4" >
								<label class="col-lg-2 control-label">Apellido</label>
								<div class="col-lg-8" >
									<input type="text"  id="id_Alumno_apellido" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="col-lg-2 control-label">Nombre</label>
								<div class="col-lg-8">
									<input type="text"id="id_Alumno_nombre"  class="form-control"	readonly="readonly"/>
								</div>
							</div>
							
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Selección del Libro</div>
						<div class="panel-body">
							<div class="form-group  col-md-4" >
								<div class="col-lg-2">
									<button type="button" id="id_btnLibro" data-toggle='modal' class='btn btn-primary' style="width: 170px">BUSCA LIBRO</button>
									<input type="hidden" name="idLibro" id="id_Libro_id" class="form-control" value="-1"/>									
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">titulo</label>
								<div class="col-lg-8">
									<input type="text" name="Librotitulo" id="id_Libro_Titulo" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Año</label>
								<div class="col-lg-8">
									<input type="number" name="Libroanio" id="id_Libro_Anio" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Autor</label>
								<div class="col-lg-8">
									<input type="text" name="LibroAutor" id="id_Libro_Autor" class="form-control" readonly="readonly"/>
								</div>
							</div>							
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Serie</label>
								<div class="col-lg-8">
									<input type="text" name="Libroserie" id="id_Libro_Serie" class="form-control" readonly="readonly"/>
								</div>
							</div>	
						</div>
				</div>
			</div>
			
			
			<div class="panel panel-default">
					<div class="panel-heading">Detalle de devolucion</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<button type="button" id="id_btnAgregar" class="btn btn-primary" style="width: 170px">AGREGA LIBRO</button>
									<button type="button" id="id_btnRegistrar"  class="btn btn-primary" style="width: 170px">REGISTRA DEVOLUCION LIBRO</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<table id="id_table_devolucion" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 5%">Código</th>
												<th style="width: 30%">Alumno</th>
												<th style="width: 20%">Usuario</th>
												<th style="width: 10%">Fecha de registro</th>
												<th style="width: 15%">Fecha de devolucion</th>
											</tr>
										</thead>
										<tbody id="id_table_devolucion_body">
												
										</tbody>
										
									</table>
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
												<table id="id_table_Alumno" class="table table-striped table-bordered">
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
														Libro 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtLibro" class="form-control" name="Libro" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_Libro" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 40%">Titulo</th>
																<th style="width: 15%">Año</th>
																<th style="width: 15%">Autor</th>
																<th style="width: 15%"></th>
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

    $(document).ready(function () {

        // Se añade los Alumnos a la tabla
        $.getJSON("listaSeleccion", {}, function (data) {
            $.each(data, function (index, item) {
                $('#id_table_devolucion_body').append("<tr><td>" + item.idLibro + "</td><td>" + item.titulo + "</td><td>" + item.anio + "</td><td>" + item.serie +"</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro + ");' class='btn btn-default' aria-label='Left Align'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
            });
        });

    });

    // Al pulsar el botón Alumno
    $("#id_btnAlumno").click(function () {
        muestraAlumno();
        $("#idBuscaAlumno").modal("show");
    });

    // Al pulsar el botón Libro
    $("#id_btnLibro").click(function () {
        muestraLibro();
        $("#idBuscaLibro").modal("show");
    });

    // Al escribir en la caja de texto del Alumno
    $("#id_txtAlumno").keyup(function (e) {
        muestraAlumno();
    });

    // Al escribir en la caja de texto del Alumno
    $("#id_txtLibro").keyup(function (e) {
        muestraLibro();
    });

    // Se anula el enter
    $(document).on("keypress", "form", function (event) {
        return event.keyCode != 13;
    });

    // Al pulsar el botón agregar
    $("#id_btnAgregar").click(function () {
        var var_pro = $("#id_Libro_id").val();
        var var_can = $("#id_Libro_cantidad").val();
        var var_stk = $("#id_Libro_stock").val();

        // Validar duplicados
        var yaExiste = false;
        $("#id_table_devolucion_body tr").each(function () {
            if ($(this).find('td:eq(0)').html() == var_pro) {
                yaExiste = true;
            }
        });

        if (var_pro == '-1') {
            $("#idMensajeTexto").text("Seleccione un Libro");
            $("#idMensaje").modal("show");
        } else if (var_can == '') {
            $("#idMensajeTexto").text("Agrege una cantidad");
            $("#idMensaje").modal("show");
        } else if (!$.isNumeric(var_can) || parseInt(var_can) <= 0) {
            $("#idMensajeTexto").text("La cantidad debe ser un número positivo");
            $("#idMensaje").modal("show");
        } else if (parseInt(var_can) > parseInt(var_stk)) {
            $("#idMensajeTexto").text("La cantidad no puede ser superior al Stock");
            $("#idMensaje").modal("show");
        } else if (yaExiste) {
            $("#idMensajeTexto").text("Existe el Libro elegido");
            $("#idMensaje").modal("show");
        } else {
            var var_nom = $("#id_Libro_nombre").val();
            var var_pre = $("#id_Libro_precio").val();

            // Limpiar la tabla
            $("#id_table_devolucion_body").empty();

            var jsonParam = { "idLibro": var_pro, "nombre": var_nom, "precio": var_pre, "cantidad": var_can };

            $.ajax({
                url: 'agregarSeleccion',
                type: 'POST',
                dataType: 'json',
                data: jsonParam,
                success: function (data) {
                    console.log(data);
                    if (data != null) {
                        $.each(data, function (index, item) {
                            $('#id_table_devolucion_body').append("<tr><td>" + item.idLibro + "</td><td>" + item.nombre + "</td><td>" + item.precio + "</td><td>" + item.cantidad + "</td><td>" + item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro + ");' class='btn btn-default' aria-label='Left Align'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
                        });

                    } else
                        swal("Error al agregar la selección del Libro", "", "error");
                    return false;
                },
                error: function (jqXhr) {
                    swal("Error en la conexión", "", "error");
                }
            });

            // Limpia las cajas de texto
            $("#id_Libro_id").val("-1");
            $("#id_Libro_nombre").val("");
            $("#id_Libro_precio").val("");
            $("#id_Libro_stock").val("");
            $("#id_Libro_cantidad").val("");
        }
    });

    // Al pulsar el botón agregar
    $("#id_btnRegistrar").click(function () {
        var var_cli = $("#id_Alumno_id").val();
        var var_ape = $("#id_Alumno_apellido").val();
        var var_nom = $("#id_Alumno_nombre").val();
        var var_nom_com = var_nom + ' ' + var_ape;

        var var_count = 0;
        $("#id_table_devolucion_body tr").each(function () {
            var_count = var_count + 1;
        });

        if (var_cli == "-1") {
            $("#idMensajeTexto").text("Seleccione un Alumno");
            $("#idMensaje").modal("show");
        } else if (var_count < 1) {
            $("#idMensajeTexto").text("Seleccione un Libro");
            $("#idMensaje").modal("show");
        } else {
            var jsonParam = { "idAlumno": var_cli, "nombre": var_nom_com };

            $.ajax({
                url: 'registradevolucion',
                type: 'POST',
                dataType: 'json',
                data: jsonParam,
                success: function (data) {
                    if (data.texto != "-1") {
                        console.log(data.texto);
                        $("#idMensajeTexto").html(data.texto);
                        $("#idMensaje").modal("show");
                        $("#id_table_devolucion_body").empty();
                        $("#id_Alumno_id").val("-1");
                        $("#id_Alumno_nombre").val("");
                        $("#id_Alumno_apellido").val("");
                    } else
                        swal("Error al agregar la devolucion", "", "error");
                    return false;
                },
                error: function (jqXhr) {
                    swal("Error en la conexión", "", "error");
                }
            });

        }
    });

    function muestraAlumno() {
        var var_Alumno = $("#id_txtAlumno").val();

        // Limpiar la tabla
        $("#id_table_Alumno tbody").empty();

        // Se añade los Alumnos a la tabla
        $.getJSON("cargaAlumno", { "filtro": var_Alumno }, function (data) {
            $.each(data, function (index, item) {
                $('#id_table_Alumno').append("<tr><td>" + item.idAlumno + "</td><td>" + item.nombres + "</td><td>" + item.apellidos + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_Alumno('" + item.idAlumno + "','" + item.nombres + "','" + item.apellidos + "');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
            });
        });
    }

    function muestraLibro() {
        var var_Libro = $("#id_txtLibro").val();

        // Limpiar la tabla
        $("#id_table_Libro tbody").empty();
        // Se añade los Alumnos a la tabla
        $.getJSON("cargaLibro", { "filtro": var_Libro }, function (data) {
            $.each(data, function (index, item) {
                $('#id_table_Libro').append("<tr><td>" + item.idLibro + "</td><td>" + item.titulo + "</td><td>" + item.anio + "</td><td>" + item.serie + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_Libro('" + item.idLibro + "','" + item.titulo + "','" + item.anio + "','" + item.serie + "');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
            });
        });
    }

    // Al pulsar selecciona Alumno
    function f_seleccione_Alumno(id, nombre, apellido) {
        $("#id_Alumno_id").val(id);
        $("#id_Alumno_nombre").val(nombre);
        $("#id_Alumno_apellido").val(apellido);
        $("#idBuscaAlumno").modal("hide");
    }

    // Al pulsar selecciona Libro
    function f_seleccione_Libro(id, nombre, precio, stock) {
        $("#id_Libro_id").val(id);
        $("#id_Libro_nombre").val(nombre);
        $("#id_Libro_precio").val(precio);
        $("#id_Libro_stock").val(stock);
        $("#idBuscaLibro").modal("hide");
    }

    // Al pulsar el botón eliminar
    function f_elimina_seleccion(id) {
        // Limpiar la tabla
        $("#id_table_devolucion_body").empty();

        // Se añade los Alumnos a la tabla
        $.getJSON("eliminaSeleccion", { "idLibro": id }, function (data) {
            $.each(data, function (index, item) {
                $('#id_table_devolucion_body').append("<tr><td>" + item.idLibro + "</td><td>" + item.nombre + "</td><td>" + item.precio + "</td><td>" + item.cantidad + "</td><td>" + item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro + ");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
            });
        });

        // Limpia las cajas de texto
        $("#id_Libro_id").val("-1");
        $("#id_Libro_nombre").val("");
        $("#id_Libro_precio").val("");
        $("#id_Libro_stock").val("");
        $("#id_Libro_cantidad").val("");
    }

    // Solo números en caja de texto
    function validarSoloNumerosEnteros(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8) return true;
        patron = /[0-9]/;
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }

</script>



</body>
</html>




</html>