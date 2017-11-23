<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@ page language="java" import="java.sql.*"%>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Tugas Java Servlet</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/jquery-confirm.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">

                    <h1 style="color:white">@Riyanriyans</h1>
                </a>

            </div>

            <div class="left-div">
                <div class="user-settings-wrapper">
                    <ul class="nav">

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                            </a>
                            <div class="dropdown-menu dropdown-settings">
                                <div class="media">
                                    <a class="media-left" href="#">
                                        <img src="assets/img/64-64.jpg" alt="" class="img-rounded" />
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">Muhammad Riyan Setiawan </h4>
                                        <h5>Developer & Designer</h5>

                                    </div>
                                </div>
                                <hr />
                                <h5><strong>Personal Bio : </strong></h5>
                                Coding Until Die
                                <hr />
                                <a href="#" class="btn btn-info btn-sm">Full Profile</a>&nbsp; <a href="" class="btn btn-danger btn-sm">Close</a>

                            </div>
                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGO HEADER END-->
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a  href="./">Beranda</a></li>
                            <li><a href="tambah.jsp">Tambah Data</a></li>
                            <li><a href="list.jsp">Lihat Data</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Daftar Anggota</h4>

                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class=" table table-striped" >
                         <thead>
                            <th>NO</th>
                            <th><center>NAMA LENGKAP</center></th>
                            <th><center>KOTA</center></th>
                            <th><center>Hobi</center></th>
                            <th><center>NOMOR HP</center></th>
                            <th><center>Alasan</center></th>
                            <th colspan="2"><center>AKSI</center></th>
                            
                        </thead>
                            <%
                            String DRIVER = "com.mysql.jdbc.Driver";
                            Class.forName(DRIVER).newInstance();
                            Connection con=null;
                            ResultSet rst=null;
                            Statement stmt=null;
                            try{

                            String url="jdbc:mysql://localhost:3306/netbeans_test?user=root&password=root";
                            int i=1;
                            con=DriverManager.getConnection(url);
                            stmt=con.createStatement();
                            rst=stmt.executeQuery("SELECT * FROM student_info ORDER BY name ASC ");
                            while(rst.next()){
                            %>
                            
                            <tbody>
                            <td  vAlign="top"  align="center" width="10" height="19" ><%=i%></td>
                            <td  vAlign="top" width="307" height="19"><%=rst.getString(2)%></td>
                            <td  vAlign="top" width="324" height="19"><%=rst.getString(3)%></td>
                            <td  vAlign="top" width="324" height="19"><%=rst.getString(4)%></td>
                            <td  vAlign="top" width="324" height="19"><%=rst.getString(5)%></td>
                            <td  vAlign="top" width="330" height="19"><%=rst.getString(6)%></td>
                            <td  vAlign="top" width="2" height="19" >
                                <a href="edit.jsp?id=<%=rst.getInt("id")%>"> <i class="glyphicon glyphicon-edit"></i> </a></td>
                            <td  colspan="2" vAlign="top" width="30" height="19">
                                <a href="delete.jsp?id=<%=rst.getInt("id")%>" onclick="return confirm('Anda Yakin ingin menghapus data ini?')"> <i class="glyphicon glyphicon-trash"></i> </a></td>
                            </tbody>
                            
                            <%	

                            i++;
                            }
                            rst.close();
                            stmt.close();
                            con.close();
                            }catch(Exception e){
                            System.out.println(e.getMessage());
                            }
                            %>
                    </table>
                </div>

            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    &copy; 2017 riyanriyans : <a href="riyanriyans.pe.hu" target="_blank">Muhammad Riyan Setiawan</a>
                </div>

            </div>
        </div>
    </footer>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/confirm.js"></script>
</body>
</html>