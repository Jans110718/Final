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

<title>Consulta Libro</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 4%">
	<h4>Consulta Libro</h4>
		<div class="row" style="margin-top: 3%">
		<div class="col-md-6">
			<label class="control-label" for="id_titulo">Titulo del Libro</label> 
			<input class="form-control" type="text" id="id_titulo"	name="titulo">
		</div>
		<div class="col-md-6">
			<label class="control-label" for="id_estado">Estado</label> 
			<input class="form-control" type="checkbox" id="id_estado" name="paramEstado" checked="checked">
		</div>
	</div>
	<div class="row" style="margin-top: 2%">
		<div class="col-md-6">
            <label class="control-label" for="id_desde">Año del Libro (Desde)</label>
			<input class="form-control" type="text" id="id_desde" name="paramDesde" placeholder="Ingrese Año"  maxlength="4">
		</div>
                 	
		
		<div class="col-md-6">
			<label class="control-label" for="id_hasta">(Hasta) </label> 
			<input class="form-control" type="text" id="id_hasta" name="paramHasta" placeholder="Ingrese Año"  maxlength="4">
		</div>
	</div>
	<div class="row" style="margin-top: 2%">
		<div class="col-md-6">
			<label class="control-label" for="id_CategoriaLibro">Categoria</label> 
			<select id="id_CategoriaLibro" name="idCategoriaLibro" class='form-control'>
				<option value="-1">[ Todos ]</option>
			</select>
		</div>
		
		<div class="col-md-6">
			<label class="control-label" for="id_TipoLibro">Tipo</label> 
			<select id="id_TipoLibro" name="idTipoLibro" class='form-control'>
				<option value="-1">[ Todos ]</option>
			</select>
		</div>
		
	</div>
	<div class="row" style="margin-top: 3%">
		<div class="col-md-12" align="center">
			<button type="button" class="btn btn-primary" id="id_btn_filtra">FILTRA</button>
			<button type="button" class="btn btn-danger" id="id_btn_reporte">PDF</button>
		</div>
	</div>
	<div class="row" style="margin-top: 3%">
		<div class="col-md-12">
			<table id="id_table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 5%">ID</th>
						<th style="width: 22%">Titulo</th>
						<th style="width: 15%">Año</th>
						<th style="width: 15%">Serie</th>
						<th style="width: 15%">Categoria</th>
						<th style="width: 15%">Tipo</th>
						<th style="width: 15%">Estado</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	
	
</div>

<script type="text/javascript">

$.getJSON("listaCategoriaDeLibro", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_CategoriaLibro").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
	});
});

$.getJSON("listaTipoLibroRevista", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_TipoLibro").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
	});
});


$("#id_btn_filtra").click(function(){
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0;  
	var varCategoria = $("#id_CategoriaLibro").val();
	var varTipo = $("#id_TipoLibro").val();
	var varTitulo = $("#id_titulo").val();
	var varFecDesde = $("#id_desde").val() == '' ?'1900' : $("#id_desde").val();
	var varFecHasta = $("#id_hasta").val() == '' ?'9999' : $("#id_hasta").val();
	
	console.log(">> varEstado >> " + varEstado );
	console.log(">> varCategoria >> " + varCategoria );
	console.log(">> varTipo >> " + varTipo );
	console.log(">> varTitulo >> " + varTitulo );
	console.log(">> varFecDesde >> " + varFecDesde );
	console.log(">> varFecHasta >> " + varFecHasta );
	
	if (valFechaInicioMayFechaFin("#id_desde", "#id_hasta")){
		mostrarMensaje("La fecha hasta es superior a la fecha desde");
		return;
	}
	
	$.getJSON("consultaLibro", {
		"estado": varEstado, 
		"idCategoriaLibro": varCategoria,
		"idTipoLibro": varTipo, 
		"titulo": varTitulo, 
		"desde": varFecDesde, 
		"hasta": varFecHasta }, function(data){
		agregarGrilla(data);
	});
});

function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 5,
			lengthChange: false,
			columns:[
				{data: "idLibro"},
				{data: "titulo"},
				{data: "anio"},
				{data: "serie"},
				{data: "categoriaLibro.descripcion"},
				{data: "tipoLibro.descripcion"},
				{data: function(row, type, val, meta){
					var salida = (row.estado == 1) ? 'Activo' : "Inactivo" ;
					return salida;
				},className:'text-center'},	
			]                                     
	    });
}




</script>   		
</body>
</html>