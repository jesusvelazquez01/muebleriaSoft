/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Ventas implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int venta_id;
    private LocalDateTime fecha;
    private Double total;
    @OneToMany(mappedBy = "venta", cascade = CascadeType.ALL, orphanRemoval = true)
private List<DetalleVenta> DetalleVenta;

    public Ventas() {
    }

    public Ventas(int venta_id, LocalDateTime fecha, Double total, List<DetalleVenta> DetalleVenta) {
        this.venta_id = venta_id;
        this.fecha = fecha;
        this.total = total;
        this.DetalleVenta = DetalleVenta;
    }

   

    public int getVenta_id() {
        return venta_id;
    }

    public void setVenta_id(int venta_id) {
        this.venta_id = venta_id;
    }

   

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public List<DetalleVenta> getDetalleVenta() {
        return DetalleVenta;
    }

    public void setDetalleVenta(List<DetalleVenta> DetalleVenta) {
        this.DetalleVenta = DetalleVenta;
    }



    
    

   
    
    
    
    
    
    
}
