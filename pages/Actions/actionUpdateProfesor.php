<?php
$resultado= array();
if(isset($_POST['nombre']) && isset($_POST['descripcion']) && isset($_POST['accion'])){
	//correcto
	
	if($_POST['accion']=='actualizar'){
		$Con = mysqli_connect("localhost","tecweb","1eYCekqNpYd3aKHN","tecweb");
	$nombre=$_POST['nombre'];
	$descripcion=$_POST['descripcion'];
	$id=$_POST['id'];
	$Query_actualizar="UPDATE profesor SET nombre='".$nombre."', descripcion='".$descripcion."' WHERE id=".$id;
	if(mysqli_query($Con,$Query_actualizar)){
		$resultado['estado']=1;
		$resultado['mensaje']='Actualizacion esxitosa';

	}else{
		$resultado['estado']=0;
		$resultado['mensaje']='ocurrio un error desconocido';
	}
	mysqli_close($Con);

	}else{
		$resultado['estado']=0;
		$resultado['mensaje']='Accion no valida';
	}
}else{
	$resultado['estado']=0;
	$resultado['mensaje']='Faltan parametros';
}

echo json_encode($resultado);
?>