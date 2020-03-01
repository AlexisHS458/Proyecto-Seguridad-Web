<?php
$resultado=array();
//print_r($_POST);
if(
    isset($_POST['programa']) && isset($_POST['noPractica']) &&
    isset($_POST['grupo']) && isset($_POST['fecha']) &&
    isset($_POST['preAsignado']) && isset($_POST['nomEmpresa']) &&
    isset($_POST['competencias']) && isset($_POST['estrategias']) &&
    isset($_POST['semestre']) && isset($_POST['noAlumnos']) &&
    isset($_POST['foranea']) && isset($_POST['entFederativa']) &&
    isset($_POST['unidadApre']) && isset($_POST['nomProfesor']) &&
    isset($_POST['objetivo']) && isset($_POST['accion']) 
){
	if($_POST['accion']=='agregar'){
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
        
        
        $Query_agregar ="INSERT INTO practicas (fecha,total_alumnos,total_profesores,objetivo,competencias,estrategia,numero,presupuesto,institucion,profesor_id,programa_academico_id,tipo_id,estatus_id,razon_social) VALUES 
        ('".$fecha."','".$noAlumnos."','1','".$objetivo."','".$competencias."','".$estrategias."','".$noPractica."','".$preAsignado."','".$nomEmpresa."','".$nomProfesor."','".$programa."','".$foranea."','1','".$nomEmpresa."')";
        echo  $Query_agregar;
        
		//$Query_agregar = "INSERT INTO practicas(practica,programa_academico, razon_social,profesor, fecha,  talumnos,tprofesores,presupuesto) VALUES ('".$practica."','".$programa_academico."','".$razon_social."','".$profesor."','".$fecha."','".$talumnos."','".$tprofesores."','".$presupuesto."')";
        
        
		if(mysqli_query($Con,$Query_agregar)){
			$idNew = mysqli_insert_id($Con);
			$resultado['estado']=1;
			$resultado['mensaje']="Estado agregado con exito";
			$resultado['id']=$idNew;
		}else{
			$resultado['estado']=0;
			$resultado['mensaje']="Ocurrio un errror desconocido";
		}
		mysqli_close($Con);

	}else{
		$resultado['estado']=0;
		$resultado['mensaje']="Action no validad";
	}

}else{
	$resultado['estado']=0;
	//$resultado['mensaje']= print_r($_POST);
    $resultado['mensaje']= "Faltan Parametros";
    
}

echo json_encode($resultado);

?>
