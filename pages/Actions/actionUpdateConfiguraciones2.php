<?php
$resultado= array();
//print_r($_POST);
if(isset($_POST['jefeDepartamento']) && isset($_POST['directorEducacion']) && isset($_POST['jefeDivision'])){
	//correcto
	
	if($_POST['accion']=='actualizar'){
    $Con = mysqli_connect("localhost","root","","tecweb");
	
        $jefeDepartamento=$_POST['jefeDepartamento'];
        $directorEducacion=$_POST['directorEducacion'];
        $jefeDivision=$_POST['jefeDivision'];
        
	    //$id=$_POST['id'];
        
	$Query_actualizar= "UPDATE autoridades SET jefeDepartamento='".$jefeDepartamento."', directorEducacion='".$directorEducacion."', jefeDivision='".$jefeDivision."' WHERE id=1";
	
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