/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class MateriaPrima implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String nombre;
    private int stock;
    private Double precio_unitario;
    @OneToMany(mappedBy = "materiaPrima", cascade = CascadeType.ALL, orphanRemoval = true)
   private List<DetalleCompra> DetalleCompra;
    

    public MateriaPrima() {
    }

    public MateriaPrima(int id, String nombre, int stock, Double precio_unitario) {
        this.id = id;
        this.nombre = nombre;
        this.stock = stock;
        this.precio_unitario = precio_unitario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Double getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(Double precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    @Override
    public String toString() {
        return "MateriaPrima{" + "id=" + id + ", nombre=" + nombre + ", stock=" + stock + ", precio_unitario=" + precio_unitario + '}';
    }
    
    
    
    
}
