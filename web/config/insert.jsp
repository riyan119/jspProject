    <%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<%

String redirect ="";
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";;
String db = "netbeans_test";
String driver = "com.mysql.jdbc.Driver";
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,"root","root");
try{
Statement st = con.createStatement();
String name=request.getParameter("name");
String city=request.getParameter("city");
String hobi=request.getParameter("hobi");
String tambah=request.getParameter("tambah");
String telephone=request.getParameter("telephone");
String alasan=request.getParameter("alasan");

int val = st.executeUpdate("INSERT student_info "
        + "VALUES(id,'"+name+"','"+city+"','"+hobi+"','"+telephone +"','"+alasan+"')");

con.close();
if(tambah.isEmpty()|| name.isEmpty()){
    System.out.println("data ksong");
}else {
    %>
    <script type="text/javascript">alert("Data berhasil dimasukkan"); 
					window.location.href="../list.jsp";
					</script>
    <%
}
}
catch (SQLException ex){
System.out.println("SQL statement is not executed!");
}
}
catch (Exception e){
e.printStackTrace();
}

%>