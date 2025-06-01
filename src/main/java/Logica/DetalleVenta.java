/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class DetalleVenta implements Serializable {
    @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private int cantidad;
    private Double precio_Unitario;
    private Double subtotal;
    @ManyToOne
    @JoinColumn(name="venta_id")
    private Ventas venta;
    
     @ManyToOne
    @JoinColumn(name = "producto_id")
    private Productos producto;

    public DetalleVenta() {
    }

    public DetalleVenta(int id, int cantidad, Double precio_Unitario, Double subtotal, Ventas venta, Productos producto) {
        this.id = id;
        this.cantidad = cantidad;
        this.precio_Unitario = precio_Unitario;
        this.subtotal = subtotal;
        this.venta = venta;
        this.producto = producto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio_Unitario() {
        return precio_Unitario;
    }

    public void setPrecio_Unitario(Double precio_Unitario) {
        this.precio_Unitario = precio_Unitario;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Ventas getVenta() {
        return venta;
    }

    public void setVenta(Ventas venta) {
        this.venta = venta;
    }

    public Productos getProducto() {
        return producto;
    }

    public void setProducto(Productos producto) {
        this.producto = producto;
    }

    

   
    
    
    
    
    
    
    
    
}
