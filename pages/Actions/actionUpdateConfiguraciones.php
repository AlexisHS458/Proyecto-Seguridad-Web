<?php
$resultado= array();
//print_r($_POST);
if(isset($_POST['director']) && isset($_POST['subdirectorAcademico']) && isset($_POST['subdirectorAdministrativo']) && isset($_POST['subdirectorServicios']) && isset($_POST['encargadoPracticas'])){
	//correcto
	
	if($_POST['accion']=='actualizar'){
    $Con = mysqli_connect("localhost","tecweb","1eYCekqNpYd3aKHN","tecweb");
	
        $director=$_POST['director'];
        $subdirectorAcademico=$_POST['subdirectorAcademico'];
        $subdirectorAdministrativo=$_POST['subdirectorAdministrativo'];
        $subdirectorServicios=$_POST['subdirectorServicios'];
        $encargadoPracticas=$_POST['encargadoPracticas'];
        
	    //$id=$_POST['id'];
        
	$Query_actualizar= "UPDATE autoridades SET director='".$director."', subdirectorAcademico='".$subdirectorAcademico."', subdirectorAdministrativo='".$subdirectorAdministrativo."',
    subdirectorServicios='".$subdirectorServicios."', encargadoPracticas='".$encargadoPracticas."' WHERE id=1";
	
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