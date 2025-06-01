package Logica;

import Logica.Productos;
import Logica.Ventas;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-05-20T16:15:02")
@StaticMetamodel(DetalleVenta.class)
public class DetalleVenta_ { 

    public static volatile SingularAttribute<DetalleVenta, Ventas> venta;
    public static volatile SingularAttribute<DetalleVenta, Double> precio_Unitario;
    public static volatile SingularAttribute<DetalleVenta, Double> subtotal;
    public static volatile SingularAttribute<DetalleVenta, Integer> id;
    public static volatile SingularAttribute<DetalleVenta, Integer> cantidad;
    public static volatile SingularAttribute<DetalleVenta, Productos> producto;

}