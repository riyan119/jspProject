<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% 
String strId =request.getParameter("id");
int id = Integer.parseInt(strId);
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
String phone=request.getParameter("phone");
String alasan=request.getParameter("alasan");
String tambah=request.getParameter("tambah");
int in = st.executeUpdate("UPDATE student_info SET name='"+name+"',city='"+city+"',hobi='"+hobi+"',phone='"+phone+"',alasan='"+alasan+"' "
                          + "WHERE id='"+id+"'");
con.close();
    %>
    <script type="text/javascript">alert("Data berhasil diubah"); 
					window.location.href="../list.jsp";
					</script>
    <%
}
catch (SQLException ex){
System.out.println("SQL statement is not executed!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>

