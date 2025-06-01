/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import Persistencia.ControladorPersistencia;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;


public class Controladora {
    ControladorPersistencia controlPersis=new ControladorPersistencia();
    
    //METODO DE MATERIA PRIMA
    public List<MateriaPrima>listarMateriaPrima(){
    return controlPersis.listarMateriasPrimas();
    }
    public MateriaPrima buscarMateriaPrimaPorId(int id) {
    return controlPersis.traerMateriaPrima(id); // o como lo llames
}

    public void agregarMateriaPrima(MateriaPrima materiaPrima){
    controlPersis.agregarMateriaPrima(materiaPrima);
    }
    public void eliminarMateriaPrima(int id) throws NonexistentEntityException{
    controlPersis.eliminarMateriaPrima(id);
    }
    public void editarMateriaPrima(MateriaPrima materiaPrima) throws Exception{
        controlPersis.editarMateriaPrima(materiaPrima);
    }
    
    //METODOS DE CRUD DE COMPRA ALTA MODIFICAR ELIMINAR
    //ALTA DE COMPRA
    public void agregarCompra(Compras compra){
         controlPersis.agregarCompra(compra);
    }
   //ELIMINAR COMPRA
    public void eliminarCompra(int id)throws Exception{
    }
    //LISTAR COMPRAS
    public List<Compras>listarCompras(){
    return null;}
    //METODOS DE DETALLECOMPRA
    
    //ALTA DE DETALLECOMPRA
    public void agregarDetalleCompra(){
    
    }
    //ELIMINAR DETALLECOMPRA
    
    public void eliminarDetalleCompra(){
    
    }
    public List<DetalleCompra>listarDetalleCompra(){
    return null;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //METODOS DE CRUD DE VENTA ALTA MODIFICAR ELMINAR Y LISTAR
    public void agregarVenta(){
    }
    //METODO PARA LISTAR VENTAS
    public List<Ventas> listarVentas(){
    return null;
    }
    
 }
    
   

