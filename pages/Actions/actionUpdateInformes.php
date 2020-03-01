<?php
$resultado= array();
print_r($_POST);
if(isset($_POST['objetivo']) && isset($_POST['porque']) && isset($_POST['descripcion']) && isset($_POST['conclusiones']) && isset($_POST['observaciones'])){
	//correcto
	
	if($_POST['accion']=='actualizar'){
    $Con = mysqli_connect("localhost","root","","tecweb");
	
        $objetivo=$_POST['objetivo'];
        $porque=$_POST['porque'];
        $descripcion=$_POST['descripcion'];
        $conclusiones=$_POST['conclusiones'];
        $observaciones=$_POST['observaciones'];
	    $id=$_POST['id'];
        
	$Query_actualizar= "UPDATE informes SET objetivo='".$objetivo."', porque='".$porque."', descripcion='".$descripcion."',
    conclusiones='".$conclusiones."', observaciones='".$observaciones."' WHERE id=".$id;
	
    if(mysqli_query($Con,$Query_actualizar)){
		$resultado['estado']=1;
		$resultado['mensaje']='Actualizacion exitosa';

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