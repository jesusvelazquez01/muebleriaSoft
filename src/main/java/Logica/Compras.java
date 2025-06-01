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
public class Compras implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int compra_id;
    private LocalDateTime fecha;
    private Double total;
      @OneToMany(mappedBy = "compra", cascade = CascadeType.ALL, orphanRemoval = true)

    private List<DetalleCompra> detallecompra;
    
    public Compras() {
    }

    public Compras(int compra_id, LocalDateTime fecha, Double total, List<DetalleCompra> detallecompra) {
        this.compra_id = compra_id;
        this.fecha = fecha;
        this.total = total;
        this.detallecompra = detallecompra;
    }

    public List<DetalleCompra> getDetallecompra() {
        return detallecompra;
    }

    public void setDetallecompra(List<DetalleCompra> detallecompra) {
        this.detallecompra = detallecompra;
    }

   

  

    public int getCompra_id() {
        return compra_id;
    }

    public void setCompra_id(int compra_id) {
        this.compra_id = compra_id;
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

    @Override
    public String toString() {
        return "Compras{" + "compra_id=" + compra_id + ", fecha=" + fecha + ", total=" + total + '}';
    }

   
    
    
    
    
    
    
    
    
}
