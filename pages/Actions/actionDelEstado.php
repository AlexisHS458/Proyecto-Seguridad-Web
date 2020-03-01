<?php
$Resultado = array();
if(isset($_POST['id']) && isset($_POST['accion'])){
	if($_POST['accion']=="eliminar"){
        $Con = mysqli_connect("localhost","root","","tecweb");
        $id= $_POST['id'];
        $QueryEliminar='DELETE FROM estado WHERE id='.$id;
        if(mysqli_query($Con,$QueryEliminar)){
            $Resultado['estado']=1;
            $Resultado['mensaje']="Estado eliminado con exito";
        }
        else{
        $Resultado['estado']=0;
        $Resultado['mensaje']="Ocurrio un error desconocido";
        }
        mysqli_close($Con);
    }
    else{   
        $Resultado['estado']=0;
        $Resultado['mensaje']="solo se permite eliminar";
    }
}
else{
	$Resultado['estado']=0;
	$Resultado['mensaje']="Falta id y/o accion";
}

echo json_encode($Resultado);
?>
