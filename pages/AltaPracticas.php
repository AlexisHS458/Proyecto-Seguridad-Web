<?php 
	session_start();
	if (!isset($_SESSION['usuario'])) {
		header('Location: ../index.php');
	}
?>
<?php
  //Mostrar en la tabla los estado
  //de la tabla=estado de la db=sipravie
  
  //Si bandRegistros = 0 NO HAY REGISTRO
  //Si bandRegistros = 1 SI HAY REGISTRO

  //Por default indico que no hay regitros
  $bandRegitros=0;
  
  //1.- Conexión a la base de datos
 $Con = mysqli_connect("localhost","tecweb","1eYCekqNpYd3aKHN","tecweb");
  //2.- Verificar que se ralizó la conexión
  if(mysqli_connect_errno()){

    echo "Error: ".mysqli_connect_errno();

  }else{
    
    //Cadena de la consulta
    $Query_estado="SELECT A.id, A.numero, C.nombre , A.razon_social, B.nombre, A.fecha, A.total_alumnos, A.total_profesores, A.presupuesto FROM practicas A INNER JOIN profesor B ON A.profesor_id=B.id INNER JOIN programa_academico C ON A.programa_academico_id=C.id";

    //Ejecutamos y guardamos el reultado
    $Resultado_estado=mysqli_query($Con,$Query_estado);
    
    $consulta_pa="SELECT * FROM programa_academico";
    $resultado_consulta_pa=mysqli_query($Con,$consulta_pa);

      
    $consulta_grupo="SELECT * FROM grupo";
    $resultado_consulta_grupo=mysqli_query($Con,$consulta_grupo);

      
    $consulta_semestre="SELECT * FROM semestre";
    $resultado_consulta_semestre=mysqli_query($Con,$consulta_semestre);

      
    $consulta_estado="SELECT * FROM estado";
    $resultado_consulta_estado=mysqli_query($Con,$consulta_estado);

      
    $consulta_u_aprendizaje="SELECT * FROM unidad_aprendizaje";
    $resultado_consulta_u_aprendizaje=mysqli_query($Con,$consulta_u_aprendizaje);

      
    $consulta_profesor="SELECT * FROM profesor";
    $resultado_consulta_profesor=mysqli_query($Con,$consulta_profesor);
    //Obtener registro x registro
    //$Renglon = mysqli_fetch_array($Resultado_estado);

    $bandRegitros=1;
  }
?>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=500, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Prácticas escolares</title>

    <style>
        body {
            padding-left: 0px !important;
        }

    </style>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="../plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
    <script src="jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>



</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="PaginaPrincipal.php" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg">SiPraViE</span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

                <div class="navbar-custom-menu">

                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">

                            <ul class="dropdown-menu">
                                <li class="header">You have 4 messages</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Support Team
                                                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <!-- end message -->
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    AdminLTE Design Team
                                                    <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Developers
                                                    <small><i class="fa fa-clock-o"></i> Today</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Sales Department
                                                    <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Reviewers
                                                    <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">See All Messages</a></li>
                            </ul>
                        </li>
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">

                            <ul class="dropdown-menu">
                                <li class="header">You have 10 notifications</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                                                page and may cause design problems
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users text-red"></i> 5 new members joined
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user text-red"></i> You changed your username
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu">

                            <ul class="dropdown-menu">
                                <li class="header">You have 9 tasks</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Create a nice theme
                                                    <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Some task I need to do
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Make beautiful transitions
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->

                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="../dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                <span class="hidden-xs">Alexander Pierce</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                    <p>
                                        Alexander Pierce - Web Developer

                                    </p>
                                </li>
                                <!-- Menu Body -->

                                <!-- Menu Footer-->
                                <li class="user-footer">

                                    <div class="pull-right">
                                    <form class="w3-container" action="../login/controller_login.php" method="post">
		                            <input type="hidden" name="salir" value="salir">
	                            	<button class="btn btn-default btn-flat">Salir</button>
                            	</form>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Control Sidebar Toggle Button -->

                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- /.search form -->
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">Menú Principal</li>
                    <li>
                        <a href="AltaPracticas.php">
                            <i class="fa fa-dashboard"></i> <span>Alta de prácticas escolares</span>
                        </a>
                    </li>
                   
                    <li>
                        <a href="InformesAcademicos.php">
                            <i class="fa fa-edit"></i> <span>Captura informes <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;académicos</span>
                            <span class="pull-right-container">
                        </a>
                    </li>



                    
                   
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-folder"></i> <span>Catálogos</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="ProgramaAcademico.php"><i class="fa fa-circle-o"></i> Programa academico</a></li>
                            <li><a href="semestre.php"><i class="fa fa-circle-o"></i> Semestre</a></li>
                            <li><a href="Nivel.php"><i class="fa fa-circle-o"></i> Nivel</a></li>
                            <li><a href="Grupo.php"><i class="fa fa-circle-o"></i> Grupo</a></li>
                            <li><a href="TipoPractica.php"><i class="fa fa-circle-o"></i> Tipo de Práctica</a></li>
                            <li><a href="EntidadFederativa.php"><i class="fa fa-circle-o"></i>
                                    Entidad Federativa</a></li>
                            <li><a href="UnidadAprendizaje.php"><i class="fa fa-circle-o"></i>
                                    Unidad de Aprendizaje</a></li>
                            <li><a href="Profesor.php"><i class="fa fa-circle-o"></i>Profesor</a></li>
                        </ul>
                    </li>
                   

                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->


            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- /.box-body -->
                        <!-- /.box -->
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">Alta de prácticas escolares</h3>
                                <table align=right>
                                    <tr>
                                        <td>


                                            <div class="box-body">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default" id="buttonAddestado">
                                                    Nueva
                                                </button>

                                            </div>


                            </div>



                            </td>
                            </tr>

                            </table>



                        </div>

                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Práctica</th>
                                        <th>Programa academico</th>
                                        <th>Nombre de la razón social</th>
                                        <th>Nombre del profesor responsable</th>
                                        <th>Fecha de realización</th>
                                        <th>Total de alumnos</th>
                                        <th>Total de profesores</th>
                                        <th>Presupuesto</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                  if($bandRegitros==1){
                    //GENERAR LOS RENGLONES DE LA TABLA

                    while ($renglonEstado=mysqli_fetch_array($Resultado_estado)) {

                      echo "<tr id='row_".$renglonEstado['id']."'>";
                      
                      echo "<td>".$renglonEstado[0]."</td>";
                      echo "<td>".$renglonEstado[1]."</td>";
                      echo "<td>".$renglonEstado[2]."</td>";
                      echo "<td>".$renglonEstado[3]."</td>";
                      echo "<td>".$renglonEstado[4]."</td>";
                      echo "<td>".$renglonEstado[5]."</td>";
                      echo "<td>".$renglonEstado[6]."</td>";    
                      echo "<td>".$renglonEstado[7]."</td>"; 
                      echo "<td>".$renglonEstado[8]."</td>"; 
                        
                      echo '<td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#modaledit" onclick="identificaActualizar('.$renglonEstado['id'].');">
                        Actualizar
                        </button> </td>';
                      echo '<td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-del" onclick="identificaEliminar('.$renglonEstado['id'].');">
                        Eliminar
                        </button> </td> ';
                      echo "</tr>";
                    }

                  }
                ?>

                                </tbody>




                                <tfoot>
                                    <th>ID</th>
                                    <th>Práctica</th>
                                    <th>Programa academico</th>
                                    <th>Nombre de la razón social</th>
                                    <th>Nombre del profesor responsable</th>
                                    <th>Fecha de realización</th>
                                    <th>Total de alumnos</th>
                                    <th>Total de profesores</th>
                                    <th>Presupuesto</th>
                                    <th></th>
                                    <th></th>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
        </div>
        <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">

        </div>
        <strong>Copyright &copy; 2019 <a href="PaginaPrincipal.php">Dinamita Studio</a>.</strong> Todos los derechos reservados.
        reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-user bg-yellow"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                <p>New phone +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                <p>Execution time 5 seconds</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Update Resume
                                <span class="label label-success pull-right">95%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Laravel Integration
                                <span class="label label-warning pull-right">50%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Back End Framework
                                <span class="label label-primary pull-right">68%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Other sets of options are available
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
                            <input type="checkbox" class="pull-right" checked>
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
                            <input type="checkbox" class="pull-right">
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
                            <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
    </div>
    <!-- Modal editar Práctica -->


    <?php
  //Mostrar en la tabla los estado
  //de la tabla=estado de la db=sipravie
  
  //Si bandRegistros = 0 NO HAY REGISTRO
  //Si bandRegistros = 1 SI HAY REGISTRO

  //Por default indico que no hay regitros
  $bandRegitros=0;
  
  //1.- Conexión a la base de datos
  $Con = mysqli_connect("localhost","tecweb","1eYCekqNpYd3aKHN","tecweb");
  //2.- Verificar que se ralizó la conexión
  if(mysqli_connect_errno()){

    echo "Error: ".mysqli_connect_errno();

  }else{
    
    //Cadena de la consulta
    $Query_estado="SELECT * FROM practicas";

    //Ejecutamos y guardamos el reultado
    $Resultado_estado=mysqli_query($Con,$Query_estado);
    
    $consulta_pa="SELECT * FROM programa_academico";
    $resultado_consulta_pa=mysqli_query($Con,$consulta_pa);

      
    $consulta_grupo="SELECT * FROM grupo";
    $resultado_consulta_grupo=mysqli_query($Con,$consulta_grupo);

      
    $consulta_semestre="SELECT * FROM semestre";
    $resultado_consulta_semestre=mysqli_query($Con,$consulta_semestre);

      
    $consulta_estado="SELECT * FROM estado";
    $resultado_consulta_estado=mysqli_query($Con,$consulta_estado);

      
    $consulta_u_aprendizaje="SELECT * FROM unidad_aprendizaje";
    $resultado_consulta_u_aprendizaje=mysqli_query($Con,$consulta_u_aprendizaje);

      
    $consulta_profesor="SELECT * FROM profesor";
    $resultado_consulta_profesor=mysqli_query($Con,$consulta_profesor);
    //Obtener registro x registro
    //$Renglon = mysqli_fetch_array($Resultado_estado);

    $bandRegitros=1;
  }
?>


    <div class="modal fade" id="modaledit">
        <div style="width:80%;" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Editar Práctica</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>PROGRAMA ACADÉMICO:</label>
                                <select class="form-control select2" style="width: 100%;" id="programaEdit">
                                    <?php
	                                   while($fila=mysqli_fetch_array($resultado_consulta_pa)){
        	                           echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
	                                   }
                                    ?>

                                </select>

                                <br><br>
                                <label>No. DE PRÁCTICA Y VISITA ESCOLAR:</label><br>
                                <input type="numer" class="form-control" id="noPracticaEdit">

                                <br><br>
                                <label>GRUPO:</label>
                                <select class="form-control select2" style="width: 100%;" id="grupoEdit">
                                    <?php
                                    while($fila=mysqli_fetch_array($resultado_consulta_grupo)){
                                    echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                    }
                                    ?>

                                </select>

                                <br><br>
                                <label>FECHA DE REALIZACIÓN: </label>
                                <br>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" data-inputmask="'alias': 'yyyy-mm-dd'" data-mask id="fechaEdit">
                                    </div>

                                </div>


                                <br><br>
                                <label>PRESUPUESTO ASIGNADO:</label>
                                <br>
                                <input type="numer" class="form-control" id="preAsignadoEdit">
                                <br><br>
                                <label>NOMBRE DE LA EMPRESA, INSTITUCIÓN O RAZÓN SOCIAL:</label>
                                <input type="text" class="form-control" id="nomEmpresaEdit">
                                <!-- /.input group -->
                                <br>
                                <label>COMPETENCIAS A DESARROLLAR:</label>
                                <br>

                                <textarea name="com" rows="5" cols="60" placeholder="Comentarios Adicionales" id="competenciasEdit"></textarea>
                                <br><br>
                                <label>ESTRATEGIAS PARA EL DESARROLLO DE LAS COMPETENCIAS:</label>
                                <br>
                                <textarea name="est" rows="5" cols="60" placeholder="Comentarios Adicionales" id="estrategiasEdit"></textarea>


                            </div>
                            <!-- /.form-group -->

                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6">
                            <div class="form-group">


                                <!-- /.input group -->




                                <label>SEMESTRE/NIVEL:</label>
                                <select class="form-control select2" style="width: 100%;" id="semestreEdit">
                                    <?php
                                    while($fila=mysqli_fetch_array($resultado_consulta_semestre)){
                                    echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                    }
                                    ?>

                                </select>


                                <br><br>
                                <label>No. DE ALUMNOS:</label>
                                <input type="text" class="form-control" id="noAlumnosEdit">

                            </div>

                            <br>
                            <div class="form-group">
                                <label>TIPO DE PRÁCTICA</label>
                                <br><br>

                                <label>
                                    <input type="radio" name="practica" class="minimal" id="tipoPracticaEdit" value="1">FORÁNEA
                                </label> &nbsp;
                                <label>
                                    <input type="radio" name="practica" class="minimal" id="tipoPracticaEdit" value="2">METROPOLITANA
                                </label>



                            </div>
                            <br>
                            <label>ENTIDAD FEDERATIVA:</label>
                            <select class="form-control select2" style="width: 100%;" id="entFederativaEdit">
                                <?php
                                while($fila=mysqli_fetch_array($resultado_consulta_estado)){
                                echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                }
                                ?>

                            </select>

                            <br><br>
                            <label>UNIDAD DE APRENDIZAJE:</label>

                            <select class="form-control select2" style="width: 100%;" id="unidadApreEdit">
                                <?php
                                while($fila=mysqli_fetch_array($resultado_consulta_u_aprendizaje)){
                                echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                }
                                ?>

                            </select>
                            <br><br>
                            <label>NOMBRE DEL PROFESOR RESPONSABLE:</label>
                            <select class="form-control select2" style="width: 100%;" id="nomProfesorEdit">
                                <?php
                                while($fila=mysqli_fetch_array($resultado_consulta_profesor)){
                                echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                }
                                ?>
                            </select>
                            <br>
                            <label>OBJETIVO:</label>
                            <br>
                            <textarea name="obj" rows="5" cols="60" placeholder="Comentarios Adicionales" id="objetivoEdit"></textarea>
                            <br><br>

                        </div>




                        <!-- /.form-group -->

                        <!-- /.form-group -->
                    </div>



                    <!-- /.col -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="updateEstado();">Guardar Cambios</button>
                </div>
            </div>




        </div>
        <!-- /.modal-content -->
    </div>

    <div class="modal modal-danger fade" id="modal-del">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Eliminar práctica</h4>
                </div>
                <div class="modal-body">
                    <p>Deseas Eliminar Práctica</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-outline" onclick="delEstado();">Eliminar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <?php
  //Mostrar en la tabla los estado
  //de la tabla=estado de la db=sipravie
  
  //Si bandRegistros = 0 NO HAY REGISTRO
  //Si bandRegistros = 1 SI HAY REGISTRO

  //Por default indico que no hay regitros
  $bandRegitros=0;
  
  //1.- Conexión a la base de datos
  $Con = mysqli_connect("localhost","tecweb","1eYCekqNpYd3aKHN","tecweb");
  //2.- Verificar que se ralizó la conexión
  if(mysqli_connect_errno()){

    echo "Error: ".mysqli_connect_errno();

  }else{
    
    //Cadena de la consulta
    $Query_estado="SELECT * FROM practicas";

    //Ejecutamos y guardamos el reultado
    $Resultado_estado=mysqli_query($Con,$Query_estado);
    
    $consulta_pa="SELECT * FROM programa_academico";
    $resultado_consulta_pa=mysqli_query($Con,$consulta_pa);

      
    $consulta_grupo="SELECT * FROM grupo";
    $resultado_consulta_grupo=mysqli_query($Con,$consulta_grupo);

      
    $consulta_semestre="SELECT * FROM semestre";
    $resultado_consulta_semestre=mysqli_query($Con,$consulta_semestre);

      
    $consulta_estado="SELECT * FROM estado";
    $resultado_consulta_estado=mysqli_query($Con,$consulta_estado);

      
    $consulta_u_aprendizaje="SELECT * FROM unidad_aprendizaje";
    $resultado_consulta_u_aprendizaje=mysqli_query($Con,$consulta_u_aprendizaje);

      
    $consulta_profesor="SELECT * FROM profesor";
    $resultado_consulta_profesor=mysqli_query($Con,$consulta_profesor);
    //Obtener registro x registro
    //$Renglon = mysqli_fetch_array($Resultado_estado);

    $bandRegitros=1;
  }
?>

    <div class="modal fade" id="modal-default">
        <div style="width:80%;" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Nuevo práctica</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>PROGRAMA ACADÉMICO:</label>
                                <select class="form-control select2" style="width: 100%;" id="programa">
                                    <?php
                                        while($fila=mysqli_fetch_array($resultado_consulta_pa)){
                                            echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                        }
                                    ?>

                                </select>

                                <br>
                                <label>No. DE PRÁCTICA Y VISITA ESCOLAR:</label>
                                <input type="numer" class="form-control" id="noPractica">

                                <br>
                                <label>GRUPO:</label>
                                <select class="form-control select2" style="width: 100%;" id="grupo">
                                    <?php
                                         while($fila=mysqli_fetch_array($resultado_consulta_grupo)){
                                            echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                        }
                                    ?>

                                </select>

                                <br>
                                <label>FECHA DE REALIZACIÓN: </label>

                                <!-- Date mm/dd/yyyy -->
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" data-inputmask="'alias': 'yyyy-mm-dd'" data-mask id="fecha">
                                    </div>

                                </div>

                                <br>
                                <label>PRESUPUESTO ASIGNADO:</label>
                                <input type="numer" class="form-control" id="preAsignado">
                                <br>
                                <label>NOMBRE DE LA EMPRESA, INSTITUCIÓN O RAZÓN SOCIAL:</label>
                                <br>
                                <input type="text" class="form-control" id="nomEmpresa">
                                <!-- /.input group -->
                                <br>
                                <label>COMPETENCIAS A DESARROLLAR:</label>
                                <br>
                                <textarea name="com" rows="5" cols="60" placeholder="Comentarios Adicionales" id="competencias"></textarea>
                                <br><br>
                                <label>ESTRATEGIAS PARA EL DESARROLLO DE LAS COMPETENCIAS:</label>
                                <br>
                                <textarea name="est" rows="5" cols="60" placeholder="Comentarios Adicionales" id="estrategias"></textarea>


                            </div>
                            <!-- /.form-group -->

                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6">
                            <div class="form-group">


                                <!-- /.input group -->




                                <label>SEMESTRE/NIVEL:</label>
                                <select class="form-control select2" style="width: 100%;" id="semestre">
                                    <?php
                                        while($fila=mysqli_fetch_array($resultado_consulta_semestre)){
                                            echo "<option value=".$fila['id'].">".$fila['nombre']."</option>";
                                        }
                                    ?>

                                </select>


                                <br>
                                <label>No. DE ALUMNOS:</label>
                                <input type="text" class="form-control" id="noAlumnos">

                            </div>


                            <div class="form-group">

                                <label>TIPO DE PRÁCTICA</label>
                                <br>
                                <label>
                                    <input type="radio" name="practica" class="minimal" id="tipoPractica" value="4">FORÁNEA
                                </label> &nbsp;
                                <label>
                                    <input type="radio" name="practica" class="minimal" id="tipoPractica" value="2">METROPOLITANA
                                </label>



                            </div>
                            <br>
                            <label>ENTIDAD FEDERATIVA:</label>
                            <select class="form-control select2" style="width: 100%;" id="entFederativa">
                                <?php
                                    while($fila=mysqli_fetch_array($resultado_consulta_estado)){
                                        echo "<option value=$fila[id]>".$fila['nombre']."</option>";
                                    }
                                ?>

                            </select>

                            <br>
                            <label>UNIDAD DE APRENDIZAJE:</label>
                            <select class="form-control select2" style="width: 100%;" id="unidadApre">
                                <?php
                                    while($fila=mysqli_fetch_array($resultado_consulta_u_aprendizaje)){
                                        echo "<option value=$fila[id]>".$fila['nombre']."</option>";
                                    }
                                ?>

                            </select>
                            <br>
                            <label>NOMBRE DEL PROFESOR RESPONSABLE:</label>
                            <select class="form-control select2" style="width: 100%;" id="nomProfesor">
                                <?php
                                    while($fila=mysqli_fetch_array($resultado_consulta_profesor)){
                                        echo "<option value=".$fila['nombre'].">".$fila['nombre']."</option>";
                                    }
                                ?>

                            </select>





                            <br>
                            <label>OBJETIVO:</label>
                            <br>
                            <textarea name="obj" rows="5" cols="60" placeholder="Comentarios Adicionales" id="objetivo"></textarea>

                        </div>




                        <!-- /.form-group -->

                        <!-- /.form-group -->
                    </div>



                    <!-- /.col -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="addEstado();">Guardar Cambios</button>
                </div>
            </div>




        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->





    <!-- jQuery 3 -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js"></script>
    <!-- page script -->
    <script>
        $(function() {
            $('#example1').DataTable()
            $('#example2').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        })

    </script>
    <!-- Select2 -->
    <script src="../bower_components/select2/dist/js/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="../plugins/input-mask/jquery.inputmask.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <script src="../bower_components/moment/min/moment.min.js"></script>
    <script src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap datepicker -->
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- bootstrap color picker -->
    <script src="../bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- bootstrap time picker -->
    <script src="../plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <!-- SlimScroll -->
    <script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- iCheck 1.0.1 -->
    <script src="../plugins/iCheck/icheck.min.js"></script>
    <!-- FastClick -->
    <script src="../bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js"></script>
    <!-- Page script -->
    <script>
        $(function() {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('yyyy-mm-dd', {
                'placeholder': 'yyyy-mm-dd'
            })
            //Datemask2 mm/dd/yyyy
            $('#datemask2').inputmask('yyyy-mm-dd', {
                'placeholder': 'yyyy-mm-dd'
            })
            //Money Euro
            $('[data-mask]').inputmask()

            //Date range picker
            $('#reservation').daterangepicker()
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({
                timePicker: true,
                timePickerIncrement: 30,
                format: 'MM/DD/YYYY h:mm A'
            })
            //Date range as a button
            $('#daterange-btn').daterangepicker({
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function(start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
                }
            )

            //Date picker
            $('#datepicker').datepicker({
                autoclose: true,
                format: 'yyyy-mm-dd'
            })

            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            })
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            })
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            })

            //Colorpicker
            $('.my-colorpicker1').colorpicker()
            //color picker with addon
            $('.my-colorpicker2').colorpicker()

            //Timepicker
            $('.timepicker').timepicker({
                showInputs: false
            })
        })

    </script>
    <script src="../js/crudPracticas.js"></script>
</body>

</html>
