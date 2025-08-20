package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Venta> listar() {
        String sql = "call sp_ListarVentas()";
        List<Venta> listaVentas = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Venta v = new Venta();
                v.setCodigoVenta(rs.getInt("codigoVenta"));
                v.setSubtotal(rs.getDouble("subtotal"));
                v.setTotal(rs.getDouble("total"));
                v.setDescuento(rs.getDouble("descuento"));
                v.setCodigoProducto(rs.getInt("codigoProducto"));

                listaVentas.add(v);
            }
        } catch (Exception e) {
            System.out.println("Error en listar ventas: " + e.getMessage());
            e.printStackTrace();
        }
        return listaVentas;
    }

    public int agregar(Venta v) {
        String sql = "call sp_AgregarVenta(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setDouble(1, v.getSubtotal());
            ps.setDouble(2, v.getTotal());
            ps.setDouble(3, v.getDescuento());
            ps.setInt(4, v.getCodigoProducto());

            resp = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en agregar venta: " + e.getMessage());
            e.printStackTrace();
        }
        return resp;
    }

    public Venta buscarVenta(int codigo) {
        Venta v = new Venta();
        String sql = "call sp_BuscarVenta(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                v.setCodigoVenta(rs.getInt("codigoVenta"));
                v.setSubtotal(rs.getDouble("subtotal"));
                v.setTotal(rs.getDouble("total"));
                v.setDescuento(rs.getDouble("descuento"));
                v.setCodigoProducto(rs.getInt("codigoProducto"));
            }
        } catch (Exception e) {
            System.out.println("Error en buscar venta: " + e.getMessage());
        }
        return v;
    }

    public int actualizar(Venta v) {
        String sql = "call sp_EditarVenta(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setInt(1, v.getCodigoVenta());
            ps.setDouble(2, v.getSubtotal());
            ps.setDouble(3, v.getTotal());
            ps.setDouble(4, v.getDescuento());
            ps.setInt(5, v.getCodigoProducto());

            resp = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en actualizar venta: " + e.getMessage());
            e.printStackTrace();
        }
        return resp;
    }

    public void eliminar(int codigo) {
        String sql = "call sp_EliminarVenta(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setInt(1, codigo);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en eliminar venta: " + e.getMessage());
        }
    }
}
