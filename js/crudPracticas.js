var idEliminar = 0;
var idActualizar = 0;
var practica;

function addEstado() {
    alert("Entro agregar estado");
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
    var nomProfesor= $("#tipoPractica").chec
    
    var objetivo= $("#objetivo").val();  
    //Variables


    
    
    botonActualizar = '<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-update">Actualizar</button>';
    botonEliminar = '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger" onclick="identificaEliminar(' + id + ');">Eliminar</button>';

    $.ajax({
        url: '../pages/Actions/actionAddPracticas.php',
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
            alert("Se agrego la practica");
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
        url: '../pages/Actions/actionDelPracticas.php',
        type: 'POST',
        data: {
            id: idEliminar,
            accion: 'eliminar'
        },
        success: function (Resultado) {
            //alert(Resultado);
            alert("Se elimino la practica");
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
     var programaEdit= $("#programaEdit").val();
    var noPracticaEdit= $("#noPracticaEdit").val();
    var grupoEdit= $("#grupoEdit").val();
    var fechaEdit= $("#fechaEdit").val();
    var preAsignadoEdit= $("#preAsignadoEdit").val();
    var nomEmpresaEdit= $("#nomEmpresaEdit").val();
    var competenciasEdit= $("#competenciasEdit").val();
    var estrategiasEdit= $("#estrategiasEdit").val();
    var semestreEdit= $("#semestreEdit").val();
    var noAlumnosEdit= $("#noAlumnosEdit").val();
    //alert(noAlumnosEdit);
    var foraneaEdit= $("#foraneaEdit").val();
    var entFederativaEdit= $("#entFederativaEdit").val();
    var unidadApreEdit= $("#unidadApre").val();
    var nomProfesorEdit= $("#nomProfesorEdit").val();
    //alert(nomProfesor);
    var objetivoEdit= $("#objetivoEdit").val();  
    //Variables
    
    
    
    
    var id;
    var tabla;

    tabla = $("#example1").DataTable();
    id = idActualizar;

    $.ajax({
        url: '../pages/Actions/actionUpdatePracticas.php',
        type: 'POST',
        data: {
            programa: programaEdit,
            noPractica: noPracticaEdit,
            grupo: grupoEdit,
            fecha: fechaEdit,
            preAsignado: preAsignadoEdit,
            nomEmpresa: nomEmpresaEdit,
            competencias: competenciasEdit,
            estrategias: estrategiasEdit,
            semestre: semestreEdit,
            noAlumnos: noAlumnosEdit,
            foranea: '1',
            entFederativa: entFederativaEdit,
            unidadApre: unidadApreEdit,
            nomProfesor: nomProfesorEdit,
            objetivo: objetivoEdit,  
            id: id,
            accion: 'actualizar'
        },
        success: function (resultado) {
            //alert(resultado);
            alert("Se actualizo la practica");
            var resJSON = JSON.parse(resultado);
            if (resJSON.estado == 1) {

                var temp = tabla.row('#row_' + id).data();
                temp[1] = noPracticaEdit;
                temp[2] = programaEdit;
                temp[3] = entFederativaEdit;
                temp[4] = nomProfesorEdit;
                temp[5] = fechaEdit;
                temp[6] = noAlumnosEdit;
                temp[7] = preAsignadoEdit;
                tabla.row('#row_' + id).data(temp).draw();
            }
            //alert(resJSON.mensaje);

        },
        error: function () {
            alert("Existe un error de comunicacion");
        }
    });
}
