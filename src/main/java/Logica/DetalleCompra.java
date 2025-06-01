/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class DetalleCompra implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String detalle;
    private int cantidad;
    private Double total;
   @ManyToOne
   @JoinColumn(name = "compra_id")
   private  Compras compra;
    @ManyToOne
    @JoinColumn(name = "materia_prima_id")
    private MateriaPrima materiaPrima;
    
    public DetalleCompra() {
    }
    public DetalleCompra(int id, String detalle, int cantidad, Double total, Compras compra, MateriaPrima materiaPrima) {
        this.id = id;
        this.detalle = detalle;
        this.cantidad = cantidad;
        this.total = total;
        this.compra = compra;
        this.materiaPrima = materiaPrima;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Compras getCompra() {
        return compra;
    }

    public void setCompra(Compras compra) {
        this.compra = compra;
    }

    public MateriaPrima getMateriaPrima() {
        return materiaPrima;
    }

    public void setMateriaPrima(MateriaPrima materiaPrima) {
        this.materiaPrima = materiaPrima;
    }

    @Override
    public String toString() {
        return "DetalleCompra{" + "id=" + id + ", detalle=" + detalle + ", cantidad=" + cantidad + ", total=" + total + ", compra=" + compra + ", materiaPrima=" + materiaPrima + '}';
    }

   
    
      
}
