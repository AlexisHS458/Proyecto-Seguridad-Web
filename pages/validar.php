<?php

$usuario=$_POST['usuario'];
$clave=$_POST['clave'];

//conectar a la base de datos
$conexion=mysqli_connect("localhost","root","","tecweb") or die ();

//consulta
$consulta=" SELECT * FROM administrador WHERE usuario= '$usuario' and clave='$clave' ";
$resultado=mysqli_query($conexion, $consulta);

$filas=mysqli_num_rows($resultado);

if ($filas>0){
    header("location:PaginaPrincipal.php");//Cambiar aqui al main
}
else {
    header("location:../index.php");
}
mysqli_free_result($resultado);
mysqli_close($conexion);
?>