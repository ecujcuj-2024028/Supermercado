<%-- 
    Document   : venta
    Created on : 19 ago 2025, 10:34:21
    Author     : informatica
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venta - SuperKinal</title>
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
                <h1 class="users-title">Ventas</h1>

                <!-- Formulario para agregar venta -->
                <form action="Controlador?menu=Ventas" method="POST" class="formulario-detalle">
                    <div class="form-row">
                        <input type="hidden" value="${venta.codigoVenta}" name="codigoVenta">
                        <label>Código Producto:
                            <input type="number" value="${venta.codigoProducto}" name="txtCodigoProducto" placeholder="Ej. 1" required>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>Subtotal:
                            <input type="number" step="0.01" value="${venta.subtotal}" name="txtSubtotal" placeholder="Ej. 150.00" required>
                        </label>
                        <label>Total:
                            <input type="number" step="0.01" value="${venta.total}" name="txtTotal" placeholder="Ej. 180.00" required>
                        </label>
                        <label>Descuento:
                            <input type="number" step="0.01" value="${venta.descuento}" name="txtDescuento" placeholder="Ej. 20.00">
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
                        <input type="hidden" name="menu" value="Ventas" />
                        <div class="search-buttons">
                            <button class="btn-crud" name="accion" value="Buscar">Buscar</button>
                            <input type="text" class="input-search" placeholder="Buscar por ID..." name="id" />
                        </div>
                    </form>
                </div>

                <!-- Tabla de ventas -->
                <div class="table-wrapper">
                    <table class="users-table">
                        <thead>
                            <tr>
                                <th>Código Venta</th>
                                <th>Código Producto</th>
                                <th>Subtotal</th>
                                <th>Total</th>
                                <th>Descuento</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="venta" items="${Ventas}">
                                <tr>
                                    <td>${venta.codigoVenta}</td>
                                    <td>${venta.codigoProducto}</td>
                                    <td>${venta.subtotal}</td>
                                    <td>${venta.total}</td>
                                    <td>${venta.descuento}</td>
                                    <td>
                                        <a class="btn-crud" href="Controlador?menu=Ventas&accion=Editar&id=${venta.codigoVenta}">Editar</a>
                                        <a class="btn-crud" href="Controlador?menu=Ventas&accion=Eliminar&id=${venta.codigoVenta}">Eliminar</a>
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
