/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Logica.Auxiliar.ItemCarritoCompra;
import Logica.Compras;
import Logica.Controladora;
import Logica.DetalleCompra;
import Logica.MateriaPrima;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "SvConfirmarCompraMateriaPrima", urlPatterns = {"/SvConfirmarCompraMateriaPrima"})
public class SvConfirmarCompraMateriaPrima extends HttpServlet {
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
            out.println("<title>Servlet SvConfirmarCompraMateriaPrima</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvConfirmarCompraMateriaPrima at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        // 1️⃣ Obtener la fecha del formulario o usar fecha actual
        String fechaStr = request.getParameter("fecha");
        LocalDateTime fechaCompra;
        if (fechaStr != null && !fechaStr.isEmpty()) {
            fechaCompra = LocalDate.parse(fechaStr).atStartOfDay(); // convierte LocalDate a LocalDateTime
        } else {
            fechaCompra = LocalDateTime.now();
        }

        // 2️⃣ Obtener el carrito desde sesión
        HttpSession session = request.getSession();
        List<ItemCarritoCompra> carrito = (List<ItemCarritoCompra>) session.getAttribute("carritoCompra");

        if (carrito == null || carrito.isEmpty()) {
            response.sendRedirect("compras.jsp?error=carrito_vacio");
            return;
        }

        // 3️⃣ Calcular el total de la compra
        double total = 0;
            for (ItemCarritoCompra item : carrito) {
            total += item.getSubtotal();
        }


        // 4️⃣ Crear la compra
        Compras compra = new Compras();
        compra.setFecha(fechaCompra);
        compra.setTotal(total);

        // 5️⃣ Crear lista de detalles
        List<DetalleCompra> detalles = new ArrayList<>();

        for (ItemCarritoCompra item : carrito) {
            MateriaPrima mp = control.buscarMateriaPrimaPorId(item.getMateriaPrimaId());

            // Actualizar el stock
            mp.setStock(mp.getStock() + item.getCantidad());
            try {
                control.editarMateriaPrima(mp);
            } catch (Exception ex) {
                Logger.getLogger(SvConfirmarCompraMateriaPrima.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Crear el detalle
            DetalleCompra detalle = new DetalleCompra();
            detalle.setCompra(compra); // Muy importante para mappedBy
            detalle.setMateriaPrima(mp);
            detalle.setCantidad(item.getCantidad());
            detalle.setDetalle(item.getDetalle());
            detalle.setTotal(item.getSubtotal());

            detalles.add(detalle);
        }

        // 6️⃣ Asignar los detalles a la compra
        compra.setDetallecompra(detalles);

        // 7️⃣ Persistir la compra (con cascade también guarda los detalles)
        control.agregarCompra(compra);

        // 8️⃣ Limpiar carrito
        session.setAttribute("carritoCompra", new ArrayList<>());

        // 9️⃣ Redirigir con éxito
        response.sendRedirect("compras.jsp?exito=1");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>



}
