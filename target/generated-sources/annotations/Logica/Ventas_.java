package Logica;

import Logica.DetalleVenta;
import java.time.LocalDateTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-05-20T16:15:02")
@StaticMetamodel(Ventas.class)
public class Ventas_ { 

    public static volatile SingularAttribute<Ventas, LocalDateTime> fecha;
    public static volatile ListAttribute<Ventas, DetalleVenta> DetalleVenta;
    public static volatile SingularAttribute<Ventas, Double> total;
    public static volatile SingularAttribute<Ventas, Integer> venta_id;

}