package Logica;

import Logica.DetalleCompra;
import java.time.LocalDateTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-05-20T16:15:02")
@StaticMetamodel(Compras.class)
public class Compras_ { 

    public static volatile SingularAttribute<Compras, LocalDateTime> fecha;
    public static volatile SingularAttribute<Compras, Double> total;
    public static volatile ListAttribute<Compras, DetalleCompra> detallecompra;
    public static volatile SingularAttribute<Compras, Integer> compra_id;

}