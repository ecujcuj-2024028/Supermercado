<%-- 
    Document   : index
    Created on : 19 ago 2025, 10:27:45
    Author     : informatica
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stilo.css"/>
    </head>
    <body>
        <header>
            <nav class="navbar bg-body-tertiary">
                <form class="container-fluid justify-content-start">
                    <a class="btn btn-outline-success me-2" href="Controlador?menu=Principal">Inicio</a>
                    <a class="btn btn-outline-success me-2" href="Controlador?menu=Productos&accion=Listar">Productos</a>
                    <a class="btn btn-sm btn-outline-secondary" href="Controlador?menu=Ventas&accion=Listar">Ventas</a>
                </form>
            </nav>
        </header>
        
        <main>
            <section class="users-section container">
                <h1 class="users-title">Productos</h1>

                <!-- Formulario para agregar producto -->
                <input type="hidden" value="${producto.codigoProducto}" name="txtCodigoProducto">
                <form action="Controlador?menu=Productos"  method="POST" class="formulario-detalle">
                    <div class="form-row">
                        <label>Nombre:
                            <input type="text" value="${producto.nombreProducto}" name="txtNombreProducto" placeholder="Ej. Arroz" required>
                        </label>
                        <label>Precio:
                            <input type="number" value="${producto.precio}" step="0.01" name="txtPrecio" placeholder="Ej. 150.00" required>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>Descripción:
                            <input type="text" name="txtDescripcion" value="${producto.descripcion}" placeholder="Ej. Paquete de 1kg" required>
                        </label>
                    </div>

                    <div class="crud-buttons">
                        <button class="btn-crud" type="submit" name="accion" value="Agregar">Agregar</button>
                        <button class="btn-crud" type="submit" name="accion" value="Actualizar">Actualizar</button>
                    </div>
                </form>

                <!-- Buscador -->
                <div class="search-container">
                    <form class="search-form" action="Controlador" method="GET">
                        <input type="hidden" name="menu" value="Productos" />
                        <div class="search-buttons">
                            <button class="btn-crud" name="accion" value="Buscar">Buscar</button>
                            <input type="text" class="input-search" placeholder="Buscar por ID..." name="id" />
                        </div>
                    </form>
                </div>

                <!-- Tabla de productos -->
                <div class="table-wrapper">
                    <table class="users-table">
                        <thead>
                            <tr>
                                <th>Código Producto</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Descripción</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="producto" items="${Productos}">
                                <tr>
                                    <td>${producto.codigoProducto}</td>
                                    <td>${producto.nombreProducto}</td>
                                    <td>${producto.precio}</td>
                                    <td>${producto.descripcion}</td>
                                    <td>
                                        <a class="btn-crud" href="Controlador?menu=Productos&accion=Editar&id=${producto.codigoProducto}">Editar</a>
                                        <a class="btn-crud" href="Controlador?menu=Productos&accion=Eliminar&id=${producto.codigoProducto}">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </section>
        </main>
        
    </body>
</html>
