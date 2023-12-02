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
<div class="container" style="margin-top: 4%"><h4>Asignación de Rol a Usuario</h4></div>

<div class="container" style="margin-top: 1%">
<form id="id_form">
	<div class="form-group col-sm-6">
		<div class="col-sm-2">
			<label class="control-label" for="id_usuario">Usuario</label>
		</div>
		<div class="col-sm-10">
			<select class='form-control' id="id_usuario" name="idUsuario">
				<option  value="">[Seleccione]</option>    
			</select>
	    </div>
	</div>
	<div class="form-group col-sm-6">
		<div class="col-sm-2">
			<label class="control-label" for="id_rol">Rol</label>
		</div>
		<div class="col-sm-10">
			<select class="form-control" id="id_rol" name="idRol" >
				<option  value="">[Seleccione]</option>
			</select>
		</div>
	</div>
	<div class="row" style="margin-top: 2%" align="center"	>
		<button class="btn btn-primary" id="id_btn_agregar" type="button">Agregar</button>
	</div>
	<div class="row" style="margin-top: 2%"> 
		<div class="col-md-12">
				<div class="content" >
					<table id="id_table" class="table table-striped table-bordered" >
						<thead>
							<tr>
								<th style="width: 5%" >Código</th>
								<th style="width: 80%">Rol</th>
								<th style="width: 15%">Eliminar rol</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>	
		</div>
	</div>
</form>	
</div>

<script type="text/javascript">
$.getJSON("listaUser", {}, function(data){
	$.each(data, function(i,item){
		$("#id_usuario").append("<option value="+item.idUsuario +">"+ item.nombreCompleto +"</option>");
	});
});

$.getJSON("listaRol", {}, function(data){
	$.each(data, function(i, item){
		$("#id_rol").append("<option value="+item.idRol+">"+item.nombre+"</option>")
	});
});

$("#id_usuario").change(function(){
	var var_usuario = $("#id_usuario").val();
	$.getJSON("listaRolPorUsuario", {"idUsuario":var_usuario }, function(data){
		agregarGrilla(data , var_usuario);
	});
});

function agregarGrilla(lista, var_usuario){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idRol"},
				{data: "nombre"},
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + var_usuario +'\',\'' + row.idRol +'\')">Eliminar</button>';
					return salida;
				},className:'text-center'},	
			]                                     
	    });
}

$("#id_btn_agregar").click(function(){
	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();
	
	 if (validator.isValid()) {
		$.ajax({
	        type: "POST",
	        url: "registraRol", 
	        data: $('#id_form').serialize(), //------------> ENVÌA como variable "data" toda la informaciòn recogida en el formulario del .jsp
	        success: function(data){
	      	  agregarGrilla(
	      			  data.lista, 
	      			  data.usuario);
	      	  mostrarMensaje(data.mensaje);
	        },
	        error: function(){
	      	  mostrarMensaje(MSG_ERROR);
	        }
	      });
	}
});


function accionEliminar(idUsuario, idRol){
	$.ajax({
        type: "POST",
        url: "eliminaRol", 
        data: {"idUsuario": idUsuario, "idRol": idRol}, //ENVÌA idUsuario e idRol para que el controller los coja como paràmetros
        success: function(data){
      	  agregarGrilla(
      			  data.lista, 
      			  data.usuario);
      	  mostrarMensaje(data.mensaje);
        },
        error: function(){
      	  mostrarMensaje(MSG_ERROR);
        }
     });
}


$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		idUsuario:{
                    selector: "#id_usuario",
                    validators:{
                        notEmpty: {
                             message: 'Seleccione un usuario'
                        }
                    }
                },
                idRol:{
                    selector: "#id_rol",
                    validators:{
                        notEmpty: {
                             message: 'Seleccione un rol'
                        }
                    }
                }
        }   
    });
});
</script>   		
</body>
</html>