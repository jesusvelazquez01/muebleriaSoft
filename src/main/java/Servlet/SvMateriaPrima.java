/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Logica.Controladora;
import Logica.MateriaPrima;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SvMateriaPrima", urlPatterns = {"/SvMateriaPrima"})
public class SvMateriaPrima extends HttpServlet {
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
            out.println("<title>Servlet SvMateriaPrima</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvMateriaPrima at " + request.getContextPath() + "</h1>");
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
      ///TRAER LAS LISTAS DE MATERIAS PRIMAS
         List<MateriaPrima> listarMateriaPrima=control.listarMateriaPrima(); 
       HttpSession sesion = request.getSession(); 
sesion.setAttribute("listaMateriaPrima", listarMateriaPrima); 
       
       response.sendRedirect("materiaPrima.jsp");

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre=request.getParameter("nombre");
        int stock=Integer.parseInt(request.getParameter("stock"));
        Double precio_unitario=Double.valueOf(request.getParameter("precio_unitario"));
        MateriaPrima materia=new MateriaPrima();
        materia.setNombre(nombre);
        materia.setStock(stock);
        materia.setPrecio_unitario(precio_unitario);
        control.agregarMateriaPrima(materia);   
        response.sendRedirect("materiaPrima.jsp"); 
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
