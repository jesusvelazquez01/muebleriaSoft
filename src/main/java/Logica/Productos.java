/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

  @Entity
public class Productos implements Serializable {
  @Id
  public int id;
  public String nombre;
  public Double precio_venta;

    public Productos() {
    }

    public Productos(int id, String nombre, Double precio_venta) {
        this.id = id;
        this.nombre = nombre;
        this.precio_venta = precio_venta;
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

    public Double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(Double precio_venta) {
        this.precio_venta = precio_venta;
    }

    @Override
    public String toString() {
        return "Productos{" + "id=" + id + ", nombre=" + nombre + ", precio_venta=" + precio_venta + '}';
    }
  
}
