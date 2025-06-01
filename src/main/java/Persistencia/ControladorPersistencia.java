/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistencia;

import Logica.Compras;
import Logica.DetalleCompra;
import Logica.MateriaPrima;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;

/**
 *
 * @author jv176
 */
public class ControladorPersistencia {
    
    MateriaPrimaJpaController materiaJpa=new MateriaPrimaJpaController();
    ComprasJpaController comprasJpa=new ComprasJpaController();
    DetalleCompraJpaController detalleCompraJpa=new DetalleCompraJpaController();
    
    //METODOS MATERIA PRIMA
    public List<MateriaPrima> listarMateriasPrimas(){
    return materiaJpa.findMateriaPrimaEntities();
    }
   public MateriaPrima traerMateriaPrima(int id) {
    return materiaJpa.findMateriaPrima(id);
   }

    public void agregarMateriaPrima(MateriaPrima materiaPrima){
    materiaJpa.create(materiaPrima);
    }
    public void eliminarMateriaPrima(int id) throws NonexistentEntityException{
    materiaJpa.destroy(id);
    }
    public void editarMateriaPrima(MateriaPrima materiaPrima) throws Exception{
    materiaJpa.edit(materiaPrima);}
    
    
    
    
    
    //METODOS DE COMPRA AGREGAR Y LISTAR LAS COMPRAS NADA MAS 
    public void agregarCompra(Compras compras){
        comprasJpa.create(compras);
    
    }
    
    public List<Compras>listarCompras(){
    return comprasJpa.findComprasEntities();
    }
    
    //METODO DE DETALLE COMPRA  
    public void agregarDetalleCompra(DetalleCompra detalleCompra){
    detalleCompraJpa.create(detalleCompra);
    }
    public List<DetalleCompra> listarDetalleCompra(){
    return detalleCompraJpa.findDetalleCompraEntities();}
    
    
    
    
    
    
}
