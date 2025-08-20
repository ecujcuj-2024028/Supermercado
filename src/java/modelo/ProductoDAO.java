package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Producto> listar() {
        String sql = "call sp_ListarProductos()";
        List<Producto> listaProductos = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setCodigoProducto(rs.getInt("codigoProducto"));
                p.setNombreProducto(rs.getString("nombreProducto"));
                p.setPrecio(rs.getDouble("precio"));
                p.setDescripcion(rs.getString("descripcion"));

                listaProductos.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error en listar productos: " + e.getMessage());
            e.printStackTrace();
        }
        return listaProductos;
    }

    public int agregar(Producto p) {
        String sql = "call sp_AgregarProducto(?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setString(1, p.getNombreProducto());
            ps.setDouble(2, p.getPrecio());
            ps.setString(3, p.getDescripcion());

            resp = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en agregar producto: " + e.getMessage());
            e.printStackTrace();
        }
        return resp;
    }

    public Producto buscarProducto(int codigo) {
        Producto p = new Producto();
        String sql = "call sp_BuscarProducto(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setCodigoProducto(rs.getInt("codigoProducto"));
                p.setNombreProducto(rs.getString("nombreProducto"));
                p.setPrecio(rs.getDouble("precio"));
                p.setDescripcion(rs.getString("descripcion"));
            }
        } catch (Exception e) {
            System.out.println("Error en buscar producto: " + e.getMessage());
        }
        return p;
    }

    public int actualizar(Producto p) {
        String sql = "call sp_EditarProducto(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setInt(1, p.getCodigoProducto());
            ps.setString(2, p.getNombreProducto());
            ps.setDouble(3, p.getPrecio());
            ps.setString(4, p.getDescripcion());

            resp = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en actualizar producto: " + e.getMessage());
            e.printStackTrace();
        }
        return resp;
    }

    public void eliminar(int codigo) {
        String sql = "call sp_EliminarProducto(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setInt(1, codigo);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en eliminar producto: " + e.getMessage());
        }
    }

}
