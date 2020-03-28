//CRUD Estado
//variables globales
var idEliminar = 0;
var idActualizar = 0;

function addEstado() {
    var tabla = $('#example1').DataTable();
    var estado;
    var descripcion;
    var id = 7;
    var botonActualizar;
    var botonEliminar;

    //referencias
    var tabla = $('#example1').DataTable();

    //estado =document.getElementById("estado");
    estado = $("#estado").val();

    //descripcion =document.getElementBId("descripcion");
    descripcion = $("#descripcion").val();

    botonActualizar = '<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-update">Actualizar</button>';
    botonEliminar = '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger" onclick="identificaEliminar(' + id + ');">Eliminar</button>';

    $.ajax({
        url: '../pages/Actions/actionAddEstado.php',
        type: 'POST',
        data: {
            nombre: estado,
            descripcion: descripcion,
            accion: 'agregar'
        },
        success: function (resultado) {
            //alert(resultado);
            alert("Se agrego la entidad federativa");
            var resJSON = JSON.parse(resultado);

            if (resJSON.estado == 1) {
                id = resJSON.id;
                tabla.row.add([id, estado, descripcion, botonActualizar, botonEliminar]).draw().node().id = "row_" + id;
            }
            //alert(resJSON.mensaje);
        },
        error: function () {

        }
    });

}

function identificaEliminar(id) {
    //alert("ID por elminiar: " + id);
    idEliminar = id;
}

function delEstado() {
    //alert("Entro delEstado()");
    var tabla = $('#example1').DataTable();

    //mostramos la variable 
    
    $.ajax({
        url: '../pages/Actions/actionDelEstado.php',
        type: 'POST',
        data: {
            id: idEliminar,
            accion: 'eliminar'
        },
        success: function (Resultado) {
            //alert(Resultado);
            alert("Se elimino la entidad federativa");
            var resJSON = JSON.parse(Resultado);
            if (resJSON.estado == 1) {
                tabla.row("#row_" + idEliminar).remove().draw();
            }
            //alert(resJSON.mensaje);

        },
        error: function (data) {
            alert("ocurrio un error");
        }
    });

}

function identificaActualizar(id) {
    //alert("id actualizar" + id);
    idActualizar = id;
}

function updateEstado() {
    //alert("Actulizar Estado");
    //variables
    var updateEstado;
    var updateDescripcion;
    var id;
    var tabla;

    //referencias 
    updateEstado = document.getElementById("estadoActualizar").value;
    updateDescripcion = document.getElementById("descripcionActualizar").value;
    tabla = $("#example1").DataTable();
    id = idActualizar;
    //acciones
    //alert("nuevo valor de estado: "+updateEstado);
    //alert("nuevo valor de descripcion: "+updateDescripcion);

    //$=Libreria de JQERY
    $.ajax({
        url: '../pages/Actions/actionUpdateEstado.php',
        type: 'POST',
        data: {
            nombre: updateEstado,
            descripcion: updateDescripcion,
            id: id,
            accion: 'actualizar'
        },
        success: function (resultado) {
            var resJSON = JSON.parse(resultado);
            if (resJSON.estado == 1) {

                var temp = tabla.row('#row_' + id).data();
                temp[1] = updateEstado;
                temp[2] = updateDescripcion;

                tabla.row('#row_' + id).data(temp).draw();
            }
            //alert(resJSON.mensaje);
            //alert(resultado);
            alert("Se actualizo la entidad federativa");
        },
        error: function () {
            alert("Existe un error de comunicacion");
        }
    });
}
//var temp = tabla.row('#row_'+id).data();
//temp= {1,"Aguascalientes",Ninguna};

//function redEstado(){
//alert("Muestra todos los Estados");
