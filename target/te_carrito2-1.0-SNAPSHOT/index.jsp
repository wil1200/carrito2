<%@page import="com.emergentes.Producto"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("almacen") == null){
        ArrayList<Producto> lisaux = new ArrayList<Producto>();
        session.setAttribute("almacen",lisaux);
    }
    ArrayList<Producto> almacen= (ArrayList<Producto>)session.getAttribute("almacen");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>carrito de compras 2</h1>
        <form action="procesaServlet" method="post">
            <table>
                <tr>
                    <td>id</td>
                    <td><input type="text" name="id" value="0"/></td>
                </tr>
                <tr>
                    <td>producto</td>
                    <td><input type="text" name="producto"/></td>
                </tr>
                <tr>
                    <td>cantidad</td>
                    <td><input type="text" name="cantidad" value="0"/></td>
                </tr>
                <tr>
                    <td>precio</td>
                    <td><input type="text" name="precio" value="0"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="procesar"/></td>
                </tr>
            </table>
        </form>
        
        <h3>contenido del carrito</h3>
        <a href="procesaServlet?op=vaciar">vaciar carrito</a>
        <table border="1">
            <tr>
                    <td>id</td>
                    <td>producto</td>
                     <td>Cantidad</td>
                     <td>precio</td>
                     <td></td>
               </tr>
               <%
                  if(almacen !=null){
                    for(Producto p : almacen){
                  
               %>
               <tr>
                   <td>
                       <%=p.getId() %>
                   </td>
                   <td>
                       <%=p.getProducto() %>
                   </td>
                   <td>
                       <%=p.getCantidad() %>
                   </td>
                   <td>
                       <%=p.getPrecio() %>
                   </td>
                   <td>
                       <a href="procesaServlet?op=eliminar&id=<%= p.getId()%>">X</a>
                   </td>
               </tr>
               <%
                    } 
                }
               %>
        </table>
    </body>
</html>
