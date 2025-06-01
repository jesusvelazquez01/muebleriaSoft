package Logica;

import Logica.Compras;
import Logica.MateriaPrima;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-05-20T16:15:02")
@StaticMetamodel(DetalleCompra.class)
public class DetalleCompra_ { 

    public static volatile SingularAttribute<DetalleCompra, Compras> compra;
    public static volatile SingularAttribute<DetalleCompra, Double> total;
    public static volatile SingularAttribute<DetalleCompra, Integer> id;
    public static volatile SingularAttribute<DetalleCompra, Integer> cantidad;
    public static volatile SingularAttribute<DetalleCompra, String> detalle;
    public static volatile SingularAttribute<DetalleCompra, MateriaPrima> materiaPrima;

}