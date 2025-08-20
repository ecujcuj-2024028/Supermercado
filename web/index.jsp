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
        <title>SuperKinal</title>
        <link rel="stylesheet" href="css/principal.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    </head>
    
    <body>
    <header>
        <div class="header-content">
            <h1 class="header-title">
                <i class="fas fa-shopping-cart me-3"></i>
                SuperKinal
            </h1>
            <nav class="nav-buttons">
                <a href="Controlador?menu=Productos&accion=Listar" class="nav-btn">
                    <i class="fas fa-box"></i>
                    Productos
                </a>
                <a href="Controlador?menu=Ventas&accion=Listar" class="nav-btn">
                    <i class="fas fa-chart-line"></i>
                    Ventas
                </a>
            </nav>
        </div>
    </header>
    
    <main>
        <div class="carousel-container">
            <div id="superKinalCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=1200&h=600&fit=crop" class="d-block w-100" alt="Productos frescos del supermercado">
                        <a href="Controlador?menu=Productos&accion=Listar" class="carousel-btn">
                            <i class="fas fa-shopping-basket"></i>
                            Ver Productos
                        </a>
                    </div>
                    <div class="carousel-item">
                        <img src="https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=1200&h=600&fit=crop" class="d-block w-100" alt="Sistema de ventas moderno">
                        <a href="Controlador?menu=Ventas&accion=Listar" class="carousel-btn">
                            <i class="fas fa-cash-register"></i>
                            Gestionar Ventas
                        </a>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#superKinalCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#superKinalCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Siguiente</span>
                </button>
            </div>
        </div>
    </main>
    
    <footer>
        <div class="footer-content">
            <h3 class="footer-title">
                <i class="fas fa-store me-2"></i>
                SuperKinal
            </h3>
            <div class="footer-info">
                <div class="footer-item">
                    <i class="fas fa-envelope"></i>
                    <span>info@superkinal.com</span>
                </div>
                <div class="footer-item">
                    <i class="fas fa-phone"></i>
                    <span>+502 1234 5678</span>
                </div>
                <div class="footer-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>Guatemala City, GT</span>
                </div>
            </div>
            <p>&copy; 2025 SuperKinal. Todos los derechos reservados.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Efectos adicionales de interactividad
        document.addEventListener('DOMContentLoaded', function() {
            // Smooth scrolling para enlaces internos
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });

            // Parallax ligero para el header
            window.addEventListener('scroll', function() {
                const scrolled = window.pageYOffset;
                const header = document.querySelector('header');
                if (header) {
                    header.style.transform = `translateY(${scrolled * 0.1}px)`;
                }
            });
        });
    </script>
</body>
</html>