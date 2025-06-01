<%-- 
    Document   : Sidebar
    Created on : 29 abr. 2025, 21:41:50
    Author     : jv176
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <!-- Sidebar -->
        <div class="w-64 bg-white shadow-md flex flex-col">
            <div class="p-4 flex items-center border-b border-gray-200">
                <div class="w-10 h-10 flex items-center justify-center bg-primary rounded-full text-white mr-3">
                    <i class="ri-store-2-line ri-lg"></i>
                </div>
                <h1 class="text-xl font-['Pacifico'] text-primary">Sistema Muebleria</h1>
            </div>
            <div class="flex-1 overflow-y-auto py-4">
                <nav class="px-2 space-y-1">
                    <a href="index.jsp" class="sidebar-item active flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-primary">
                            <i class="ri-dashboard-line"></i>
                        </div>
                        <span>Inicio</span>
                    </a>
                    <a href="materiaPrima.jsp" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-gray-500">
                            <i class="ri-stack-line"></i>
                        </div>
                        <span>Materias Primas</span>
                    </a>
                    <a href="producto.jsp" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-gray-500">
                            <i class="ri-archive-line"></i>
                        </div>
                        <span>Productos</span>
                    </a>
                    <a href="compras.jsp" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-gray-500">
                            <i class="ri-shopping-cart-line"></i>
                        </div>
                        <span>Compras Materia prima</span>
                    </a>
                    <a href="ventas.jsp" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-gray-500">
                            <i class="ri-shopping-bag-line"></i>
                        </div>
                        <span>Ventas</span>
                    </a>
                    <a href="#" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-gray-500">
                            <i class="ri-file-list-3-line"></i>
                        </div>
                        <span>Presupuestos</span>
                    </a>
                    <a href="#" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-gray-500">
                            <i class="ri-bar-chart-line"></i>
                        </div>
                        <span>Reportes</span>
                    </a>
                </nav>
            </div>
            <div class="p-4 border-t border-gray-200">
                <div class="flex items-center">
                    <div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center text-white">
                        <span class="text-xs font-medium">AM</span>
                    </div>
                    <div class="ml-3">
                        <p class="text-sm font-medium">Alejandro Martínez</p>
                        <p class="text-xs text-gray-500">Administrador</p>
                    </div>
                    <div class="ml-auto w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
                        <i class="ri-logout-box-r-line"></i>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
