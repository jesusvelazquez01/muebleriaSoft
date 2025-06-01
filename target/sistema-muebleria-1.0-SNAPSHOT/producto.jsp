<%-- 
    Document   : producto
    Created on : 31 may. 2025, 21:25:18
    Author     : jv176
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet" />
         <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #F9F7F5;
      color: #4B3F32;
    }
  </style>
            <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#8B4513',
            secondary: '#D2B48C'
          },
          borderRadius: {
            'button': '8px'
          }
        }
      }
    };
  </script>
    </head>
   
    <body class="bg-gray-50 font-sans text-gray-700">
        <div class="flex h-screen overflow-hidden">
            <%@ include file="Sidebar.jsp" %>
            <div class="flex-1 flex flex-col overflow-hidden">
    <main class="p-6 overflow-y-auto">

      <h1 class="text-2xl font-semibold mb-6">Gestión de Producto Terminado</h1>

      <!-- Formulario para agregar materia prima -->
      <section class="bg-white rounded-xl shadow p-6 mb-8">
        <h2 class="text-lg font-medium mb-4">Nuevo Producto Terminado</h2>
        <form action="SvMateriaPrima" method="post" class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label for="nombre" class="block text-sm font-medium mb-1">Nombre</label>
            <input type="text" id="nombre" name="nombre" required
                   class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                   placeholder="Ej: Mesa de Algarrobo, Silla de abeto">
          </div>

          <div>
            <label for="precioVenta" class="block text-sm font-medium mb-1">Precio de Venta</label>
            <input type="number" id="stock" name="stock" required min="0"
                   class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                   placeholder="Ej: 15000">
          </div>


          <div class="md:col-span-3 text-right">
            <button type="submit"
                    class="bg-primary hover:bg-opacity-90 text-white font-medium py-2 px-6 rounded-button">
              <i class="ri-add-line align-middle mr-1"></i> Agregar Producto
            </button>
          </div>
        </form>
      </section>
        </div>
    </body>
</html>
