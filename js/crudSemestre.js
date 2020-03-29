//CRUD Estado
//variables globales
var idEliminar = 0;
var idActualizar = 0;
var esValido = false;

function validar( estado, descripcion) {
    const patron = new RegExp('^[A-Z]+$', 'i');
    esValido = patron.test(estado) && patron.test(descripcion);    
}

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

    botonActualizar = '<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-edit">Actualizar</button>';
    botonEliminar = '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-delete" onclick="identificaEliminar(' + id + ');">Eliminar</button>';
    //acciones = agregar a la tabla 
    // en esta padasa alert("estado: "+estado);
    //en esta pasada alert("descripcion: "+descripcion);
    //alert("Hola");
    validar(estado,descripcion);
    if (esValido) {
        $.ajax({
            url: '../pages/Actions/actionAddSemestre.php',
            type: 'POST',
            data: {
                nombre: estado,
                descripcion: descripcion,
                accion: 'agregar'
            },
            success: function (resultado) {
                //alert(resultado);
                alert("Se agrego el semestre");
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
    } else {
        alert("Ingresaste caracteres invalidos");
    }
    

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
        url: '../pages/Actions/actionDelSemestre.php',
        type: 'POST',
        data: {
            id: idEliminar,
            accion: 'eliminar'
        },
        success: function (Resultado) {
            //alert(Resultado);
            alert("Se elimino el semestre");
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
    validar(updateEstado,updateDescripcion);
    if (esValido) {
        $.ajax({
            url: '../pages/Actions/actionUpdateSemestre.php',
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
                alert("Se actualizo el semestre");
            },
            error: function () {
                alert("Existe un error de comunicacion");
            }
        });
    } else {
        alert("Ingresaste caracteres invalidos");
    }
    
}
//var temp = tabla.row('#row_'+id).data();
//temp= {1,"Aguascalientes",Ninguna};

//function redEstado(){
//alert("Muestra todos los Estados");
