<%-- 
    Document   : index
    Created on : 19 ago 2025, 11:29:22
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/principal.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    
    <body>
        <header>
            <div class="menu-container">
                <h1>Bienvenido al Supermercado</h1>
                <a class="btn-productos" href="Controlador?menu=Productos&accion=Listar">Productos</a>
                <a class="btn-ventas" href="Controlador?menu=Ventas&accion=Listar">Ventas</a>
            </div>
        </header>
        
        
        <main>
            <section>
                <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                      <img src="img/productos.jpg" class="d-block w-100" alt="imagen de productos">
                      <a class="btn-productos" href="Controlador?menu=Productos&accion=Listar">Productos</a>
                  </div>
                  <div class="carousel-item">
                      <img src="img/venta.png" class="d-block w-100" alt="imagen de Venta">
                      <a class="btn-ventas" href="Controlador?menu=Ventas&accion=Listar">Ventas</a>
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </section>
        </main>
        
        <footer class="text-center py-3" style="background-color: #0b2342; color: white;">
            <p>&copy; 2025 Supermercado. Todos los derechos reservados.</p>
            <p>Contacto: info@supermercado.com | Tel: +502 1234 5678</p>
        </footer>

        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>
