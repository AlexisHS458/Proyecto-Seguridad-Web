<?php
$resultado= array();
//print_r($_POST);
if(
    isset($_POST['programa']) && isset($_POST['noPractica']) &&
    isset($_POST['grupo']) && isset($_POST['fecha']) &&
    isset($_POST['preAsignado'])  && isset($_POST['nomEmpresa']) &&
    isset($_POST['competencias']) && isset($_POST['estrategias']) &&
    isset($_POST['semestre'])  && isset($_POST['noAlumnos'])  &&
    isset($_POST['foranea']) && isset($_POST['entFederativa']) &&
    isset($_POST['unidadApre']) && isset($_POST['nomProfesor']) &&
    isset($_POST['objetivo']) && isset($_POST['accion'])
){
	//correcto
	
	if($_POST['accion']=='actualizar'){
    $Con = mysqli_connect("localhost","root","","tecweb");
	
        $programa=$_POST['programa'];
        $noPractica=$_POST['noPractica'];
        $grupo=$_POST['grupo'];
        $fecha=$_POST['fecha'];
        $nomEmpresa=$_POST['nomEmpresa'];
        $competencias=$_POST['competencias'];
        $estrategias=$_POST['estrategias'];
        $semestre=$_POST['semestre'];
        $noAlumnos=$_POST['noAlumnos'];
        $foranea=$_POST['foranea'];
        $nomProfesor=$_POST['nomProfesor'];
        $fecha=$_POST['fecha'];
        $entFederativa=$_POST['entFederativa'];
        $unidadApre=$_POST['unidadApre'];
        $nomProfesor=$_POST['nomProfesor'];
        $objetivo=$_POST['objetivo'];
        $preAsignado=$_POST['preAsignado'];
	    $id=$_POST['id'];
        
        
        
	$Query_actualizar= "UPDATE practicas SET fecha='".$fecha."', total_alumnos='".$noAlumnos."',total_profesores='1',objetivo='".$objetivo."',competencias='".$competencias."',estrategia='".$estrategias."',numero='".$noPractica."',presupuesto='".$preAsignado."',institucion='".$nomEmpresa."',profesor_id='".$nomProfesor."',programa_academico_id='".$programa."',estatus_id='".$foranea."',razon_social='".$nomEmpresa."' WHERE id=".$id;
       
        
        
        
        
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