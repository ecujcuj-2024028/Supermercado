/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

public class Venta {
    private int codigoVenta;
    private double subtotal;
    private double total;
    private double descuento;
    private int codigoProducto;

    public Venta() {}

    public Venta(int codigoVenta, double subtotal, double total, double descuento, int codigoProducto) {
        this.codigoVenta = codigoVenta;
        this.subtotal = subtotal;
        this.total = total;
        this.descuento = descuento;
        this.codigoProducto = codigoProducto;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    @Override
    public String toString() {
        return "Venta{" +
                "codigoVenta=" + codigoVenta +
                ", subtotal=" + subtotal +
                ", total=" + total +
                ", descuento=" + descuento +
                ", codigoProducto=" + codigoProducto +
                '}';
    }
}
