package Logica;

import Logica.DetalleCompra;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-05-20T16:15:02")
@StaticMetamodel(MateriaPrima.class)
public class MateriaPrima_ { 

    public static volatile SingularAttribute<MateriaPrima, Double> precio_unitario;
    public static volatile ListAttribute<MateriaPrima, DetalleCompra> DetalleCompra;
    public static volatile SingularAttribute<MateriaPrima, Integer> id;
    public static volatile SingularAttribute<MateriaPrima, Integer> stock;
    public static volatile SingularAttribute<MateriaPrima, String> nombre;

}