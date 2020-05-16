<?php
$resultado=array();
print_r($_POST);
if(isset($_POST['nombre']) && isset($_POST['descripcion']) && isset($_POST['accion'])){
	if($_POST['accion']=='agregar'){
		$Con = mysqli_connect("localhost","tecweb","1eYCekqNpYd3aKHN","tecweb");
		$nombre=$_POST['nombre'];
		$descripcion=$_POST['descripcion'];
		$Query_agregar = "INSERT INTO estado(nombre,descripcion) VALUES ('".$nombre."','".$descripcion."')";
		if(mysqli_query($Con,$Query_agregar)){
			$idNew = mysqli_insert_id($Con);
				$resultado['estado']=1;
				$resultado['mensaje']='Estado agregado con exito';
				$resultado['id']=$idNew;
		}else{
			$resultado['estado']=0;
			$resultado['mensaje']="Ocurrio un errror desconocido";
		}
		mysqli_close($Con);



	}else{
		$resultado['estado']=0;
		$resultado['mensaje']='Acccion no valida';
	}

}else{
	$resultado['estado']=0;
	$resultado['mensaje']='Faltan parametros';
}


echo json_encode($resultado);

?>