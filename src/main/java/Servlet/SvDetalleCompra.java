/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Logica.Auxiliar.ItemCarritoCompra;
import Logica.Controladora;
import Logica.MateriaPrima;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jv176
 */
@WebServlet(name = "SvDetalleCompra", urlPatterns = {"/SvDetalleCompra"})
public class SvDetalleCompra extends HttpServlet {
Controladora control=new Controladora();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvDetalleCompra</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvDetalleCompra at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //EN ESTE DOGET LO QUE VAMOS HACER ES LISTAR TODAS LAS MATERIAS PRIMAS QUE TENGAMOS CARGADAS EN LA BASE DE DATOS
        //PARA MOSTRARLAS EN UN SELECT EN LA VISTA
        //TAMBIEN LO QUE HACEMOS ES CREAR EL CARRITO DE COMPRAS
        //EL CONDICIONAL ESTA DICIENDDO SI NO HAY UN CARRITO DE COMPRAS EN LA VISTA CREADO LO QUE VAMOS HACER ES 
        //CREARLO COMO UN NUEVO OBJETO
         // 1. Obtener lista de materias primas desde la lógica
      List<MateriaPrima> listarMateriaPrima=control.listarMateriaPrima(); 
HttpSession sesion = request.getSession(); 
sesion.setAttribute("listaMateriaPrima", listarMateriaPrima);
            if (sesion.getAttribute("carritoCompra") == null) {
        sesion.setAttribute("carritoCompra", new ArrayList<>());
    }
        response.sendRedirect("compras.jsp");
    }

    
   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    //ACA OBTENEMOS LOS DATOS DEL FORMULARIO DE AGREGAR MATERIA PRIMA AL CARRITO
    // 1️⃣ Obtener datos del formulario
    int materiaPrimaId = Integer.parseInt(request.getParameter("materiaPrimaId"));
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double precioUnitario = Double.parseDouble(request.getParameter("precioUnitario"));

    // 2️⃣ Obtener nombre de la materia prima
    MateriaPrima mp = control.buscarMateriaPrimaPorId(materiaPrimaId);
    // Este método debe existir en Controladora
    String detalle = (mp != null) ? mp.getNombre() : "Materia desconocida";

    //  3️⃣ Crear el ítem del carrito
    ItemCarritoCompra item = new ItemCarritoCompra();
    item.setMateriaPrimaId(materiaPrimaId);
    item.setDetalle(detalle);
    item.setCantidad(cantidad);
    item.setPrecioUnitario(precioUnitario);
    item.setSubtotal(cantidad * precioUnitario);

    // 4️⃣ Obtener la lista del carrito desde la sesión
    HttpSession session = request.getSession();
    List<ItemCarritoCompra> carrito = (List<ItemCarritoCompra>) session.getAttribute("carritoCompra");

    if (carrito == null) {
        carrito = new ArrayList<>();
    }

    carrito.add(item);

    // 5️⃣ Guardar la lista actualizada en sesión
    session.setAttribute("carritoCompra", carrito);

    // 6️⃣ Redirigir de nuevo a la vista
    response.sendRedirect("compras.jsp");
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
