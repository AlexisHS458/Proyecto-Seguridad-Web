var idEliminar = 0;
var idActualizar = 0;
//var practica;

/*function addEstado() {
    //alert("Entro agregar estado");
    var tabla = $('#example1').DataTable();
    var id = 7;
    var botonActualizar;
    var botonEliminar;
    //Variables
    
    var programa= $("#programa").val();
    //alert(programa);
    var noPractica= $("#noPractica").val();
    var grupo= $("#grupo").val();
    var fecha= $("#fecha").val();
    var preAsignado= $("#preAsignado").val();
    var nomEmpresa= $("#nomEmpresa").val();
    var competencias= $("#competencias").val();
    var estrategias= $("#estrategias").val();
    var semestre= $("#semestre").val();
    var noAlumnos= $("#noAlumnos").val();
    var foranea= $("#foranea").val();
    var entFederativa= $("#entFederativa").val();
    var unidadApre= $("#unidadApre").val();
    var nomProfesor= $("#nomProfesor").val();
    //alert(nomProfesor);
    var objetivo= $("#objetivo").val();  
    //Variables


    
    
    botonActualizar = '<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-update">Actualizar</button>';
    botonEliminar = '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger" onclick="identificaEliminar(' + id + ');">Eliminar</button>';

    $.ajax({
        url: 'actionAddPracticas.php',
        type: 'POST',
        data: {
            programa: programa,
            noPractica: noPractica,
            grupo: grupo,
            fecha: fecha,
            preAsignado: preAsignado,
            nomEmpresa: nomEmpresa,
            competencias: competencias,
            estrategias: estrategias,
            semestre: semestre,
            noAlumnos: noAlumnos,
            foranea: '1',
            entFederativa: entFederativa,
            unidadApre: unidadApre,
            nomProfesor: nomProfesor,
            objetivo: objetivo,            
            accion: 'agregar'
        },
        success: function (resultado) {
            //alert(resultado);
            var resJSON = JSON.parse(resultado);

            if (resJSON.estado == 1) {
                id = resJSON.id;
                tabla.row.add([id, noPractica,nomEmpresa,nomProfesor,fecha,noAlumnos, nomProfesor, preAsignado, botonActualizar, botonEliminar]).draw().node().id = "row_" + id;
            }
            //alert(resJSON.mensaje);

        },
        error: function (data) {
            alert("Ocurrio un error");
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
        url: 'actionDelPracticas.php',
        type: 'POST',
        data: {
            id: idEliminar,
            accion: 'eliminar'
        },
        success: function (Resultado) {
            //alert(Resultado);
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
*/
function identificaActualizar(id) {
    //alert("id actualizar" + id);
    idActualizar = id;
}

function updateEstado() {
    //alert("Actulizar Estado");
    //variables
    var updateobjetivo= $("#objetivoEdit").val();
    var updateporque=$("#porqueEdit").val();
    var updatedescripcion=$("#descripcionEdit").val();
    var updateconclusiones=$("#conclusionesEdit").val();
    var updateobservaciones=$("#observacionesEdit").val();

    var id;
    var tabla;

    tabla = $("#example1").DataTable();
    id = idActualizar;

    $.ajax({
        url: '../pages/Actions/actionUpdateInformes.php',
            type: 'POST',
            data: {
            objetivo: updateobjetivo,
            porque: updateporque,
            descripcion: updatedescripcion,
            conclusiones: updateconclusiones,
            observaciones: updateobservaciones,
            id: id,
            accion: 'actualizar'
        },
        success: function (resultado) {
            var resJSON=JSON.parse(resultado);
            //alert(resJSON.mensaje);
            alert("Se actualizo el informe");
           
        },
        error: function () {
            alert("Existe un error de comunicacion");
        }
    });
}