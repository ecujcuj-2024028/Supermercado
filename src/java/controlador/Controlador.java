/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import modelo.ProductoDAO;
import modelo.Venta;
import modelo.VentaDAO;

/**
 *
 * @author informatica
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    Producto producto = new Producto();
    ProductoDAO productoDAO = new ProductoDAO();
    int codProducto;

    Venta venta = new Venta();
    VentaDAO ventaDAO = new VentaDAO();
    int codVenta;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("Principal")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        else if (menu.equals("Productos")) {
            if (accion == null) {
                accion = "Listar";
            }
            switch (accion) {
                case "Listar":
                    List<Producto> listaProductos = productoDAO.listar();
                    request.setAttribute("Productos", listaProductos);
                    request.getRequestDispatcher("producto.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String nombre = request.getParameter("txtNombreProducto");
                    double precio = Double.parseDouble(request.getParameter("txtPrecio"));
                    String descripcion = request.getParameter("txtDescripcion");

                    producto.setNombreProducto(nombre);
                    producto.setPrecio(precio);
                    producto.setDescripcion(descripcion);

                    productoDAO.agregar(producto);
                    response.sendRedirect("Controlador?menu=Productos&accion=Listar");
                    break;
                case "Eliminar":
                    codProducto = Integer.parseInt(request.getParameter("id"));
                    productoDAO.eliminar(codProducto);
                    response.sendRedirect("Controlador?menu=Productos&accion=Listar");
                    break;
                case "Editar":
                    System.out.println("Entro a editar");
                    codProducto = Integer.parseInt(request.getParameter("id"));
                    Producto productoSeleccionado = productoDAO.buscarProducto(codProducto);
                    request.getSession().setAttribute("producto", productoSeleccionado); // usar session
                    response.sendRedirect("Controlador?menu=Productos&accion=Listar");
                    break;
                case "Actualizar":
                    codProducto = Integer.parseInt(request.getParameter("codigo-producto"));
                    String nombreActualizar = request.getParameter("nombre-producto");
                    double precioActualizar = Double.parseDouble(request.getParameter("precio-producto"));
                    String descripcionActualizar = request.getParameter("descripcion-producto");

                    producto.setCodigoProducto(codProducto);
                    producto.setNombreProducto(nombreActualizar);
                    producto.setPrecio(precioActualizar);
                    producto.setDescripcion(descripcionActualizar);

                    productoDAO.actualizar(producto);
                    response.sendRedirect("Controlador?menu=Productos&accion=Listar");
                    break;
                default:
                    List<Producto> listaDefault = productoDAO.listar();
                    request.setAttribute("Productos", listaDefault);
                    request.getRequestDispatcher("producto.jsp").forward(request, response);
                    break;
                case "Buscar":
                    String idS = request.getParameter("id");
                    List<Producto> listaProducto;

                    if (idS != null && !idS.isEmpty()) {
                        int id = Integer.parseInt(idS);
                        Producto productoBuscado = productoDAO.buscarProducto(id);
                        listaProducto = new ArrayList<>();
                        if (productoBuscado != null) {
                            listaProducto.add(productoBuscado);
                        }
                    } else {
                        listaProducto = productoDAO.listar();
                    }

                    request.setAttribute("Productos", listaProducto);
                    request.getRequestDispatcher("producto.jsp").forward(request, response);
                    return; 
            }
        } else if (menu.equals("Ventas")) {
            if (accion == null) {
                accion = "Listar";
            }
            switch (accion) {
                case "Listar":
                    List<Venta> listaVentas = ventaDAO.listar();
                    request.setAttribute("Ventas", listaVentas);
                    request.getRequestDispatcher("venta.jsp").forward(request, response);
                    break;

                case "Agregar":
                    double subtotal = Double.parseDouble(request.getParameter("txtSubtotal"));
                    double total = Double.parseDouble(request.getParameter("txtTotal"));
                    double descuento = Double.parseDouble(request.getParameter("txtDescuento"));
                    int codigoProd = Integer.parseInt(request.getParameter("txtCodigoProducto"));

                    venta.setSubtotal(subtotal);
                    venta.setTotal(total);
                    venta.setDescuento(descuento);
                    venta.setCodigoProducto(codigoProd);

                    ventaDAO.agregar(venta);
                    response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                    break;

                case "Eliminar":
                    codVenta = Integer.parseInt(request.getParameter("id"));
                    ventaDAO.eliminar(codVenta);
                    response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                    break;

                case "Editar":
                    int codVenta = Integer.parseInt(request.getParameter("id"));
                    Venta ventaSeleccionada = ventaDAO.buscarVenta(codVenta);
                    request.setAttribute("venta", ventaSeleccionada);
                    request.getRequestDispatcher("Controlador?menu=Ventas&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    codVenta = Integer.parseInt(request.getParameter("codigoVenta"));
                    int codProdAct = Integer.parseInt(request.getParameter("txtCodigoProducto"));
                    double subtotalAct = Double.parseDouble(request.getParameter("txtSubtotal"));
                    double totalAct = Double.parseDouble(request.getParameter("txtTotal"));
                    double descuentoAct = Double.parseDouble(request.getParameter("txtDescuento"));

                    Venta ventaActualizada = new Venta();
                    ventaActualizada.setCodigoVenta(codVenta);
                    ventaActualizada.setCodigoProducto(codProdAct);
                    ventaActualizada.setSubtotal(subtotalAct);
                    ventaActualizada.setTotal(totalAct);
                    ventaActualizada.setDescuento(descuentoAct);

                    ventaDAO.actualizar(ventaActualizada);
                    
                    response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                    break;

                case "Buscar":
                    String idS = request.getParameter("id");
                    List<Venta> listaVentasBuscar;

                    if (idS != null && !idS.isEmpty()) {
                        int id = Integer.parseInt(idS);
                        Venta ventaBuscada = ventaDAO.buscarVenta(id);
                        listaVentasBuscar = new ArrayList<>();
                        if (ventaBuscada != null) {
                            listaVentasBuscar.add(ventaBuscada);
                        }
                    } else {
                        listaVentasBuscar = ventaDAO.listar();
                    }

                    request.setAttribute("Ventas", listaVentasBuscar);
                    request.getRequestDispatcher("venta.jsp").forward(request, response);
                    break;

                default:
                    List<Venta> listaDefaultVentas = ventaDAO.listar();
                    request.setAttribute("Ventas", listaDefaultVentas);
                    request.getRequestDispatcher("venta.jsp").forward(request, response);
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
