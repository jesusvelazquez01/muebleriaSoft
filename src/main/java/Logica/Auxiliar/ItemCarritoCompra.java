/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica.Auxiliar;


public class ItemCarritoCompra {
    
    private int materiaPrimaId;
    private String detalle;
    private int cantidad;
    private double precioUnitario;
    private double subtotal;

    public ItemCarritoCompra() {
    }
    public ItemCarritoCompra(int materiaPrimaId, String detalle, int cantidad, double precioUnitario, double subtotal) {
        this.materiaPrimaId = materiaPrimaId;
        this.detalle = detalle;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.subtotal = subtotal;
    }
    public int getMateriaPrimaId() {
        return materiaPrimaId;
    }
    public void setMateriaPrimaId(int materiaPrimaId) {
        this.materiaPrimaId = materiaPrimaId;
    }
    public String getDetalle() {
        return detalle;
    }
    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public double getPrecioUnitario() {
        return precioUnitario;
    }
    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }
    public double getSubtotal() {
        return subtotal;
    }
    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
    @Override
    public String toString() {
     return "ItemCarritoCompra{" + "materiaPrimaId=" + materiaPrimaId + ", detalle=" + detalle + ", cantidad=" + cantidad + ", precioUnitario=" + precioUnitario + ", subtotal=" + subtotal + '}';
    }
}
