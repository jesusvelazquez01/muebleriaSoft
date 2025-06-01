<%-- 
    Document   : ventas
    Created on : 29 abr. 2025, 21:39:53
    Author     : jv176
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- ventas.jsp --%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ventas - Sistema Mueblería</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  <script>tailwind.config={theme:{extend:{colors:{primary:'#8B4513',secondary:'#D2B48C'}}}}</script>
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body class="bg-gray-50 font-sans text-gray-700">
  <div class="flex h-screen">
    <%@ include file="Sidebar.jsp" %>

    <div class="flex-1 flex flex-col overflow-hidden">
     

      <main class="p-6 overflow-y-auto">
        <!-- Título -->
        <h1 class="text-2xl font-semibold mb-6">Gestión de Ventas</h1>

        <!-- 1) Formulario de Carga de Venta -->
        <section class="bg-white rounded-xl shadow p-6 mb-8">
          <h2 class="text-lg font-medium mb-4">Nueva Venta</h2>
          <form action="ventas" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <!-- Producto -->
            <div>
              <label for="producto" class="block text-sm font-medium mb-1">Producto</label>
              <select id="producto" name="producto" required
                      class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary">
                <option value="">-- Selecciona --</option>
                <option value="sofa_viena">Sofá Modelo Viena</option>
                <option value="mesa_roble">Mesa de Comedor Roble</option>
                <option value="cama_oslo">Cama King Modelo Oslo</option>
                <!-- … más opciones dinámicas … -->
              </select>
            </div>

            <!-- Cliente -->
            <div>
              <label for="cliente" class="block text-sm font-medium mb-1">Cliente</label>
              <input type="text" id="cliente" name="cliente" required
                     class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                     placeholder="Nombre del cliente">
            </div>

            <!-- Fecha -->
            <div>
              <label for="fecha" class="block text-sm font-medium mb-1">Fecha</label>
              <input type="date" id="fecha" name="fecha" required
                     class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary">
            </div>

            <!-- Monto -->
            <div>
              <label for="monto" class="block text-sm font-medium mb-1">Monto</label>
              <input type="number" id="monto" name="monto" required step="0.01"
                     class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                     placeholder="0.00">
            </div>

            <!-- Botón Enviar -->
            <div class="md:col-span-2 text-right">
              <button type="submit"
                      class="bg-primary hover:bg-opacity-90 text-white font-medium py-2 px-6 rounded-md">
                <i class="ri-save-line align-middle mr-1"></i> Guardar Venta
              </button>
            </div>
          </form>
        </section>

        <!-- 2) Últimas Ventas -->
        <section class="bg-white rounded-xl shadow p-6">
          <div class="flex items-center justify-between mb-4">
            <h2 class="text-lg font-medium">Últimas Ventas</h2>
            <a href="ventasTodas.jsp" class="text-primary text-sm flex items-center hover:underline">
              Ver todas
              <i class="ri-arrow-right-line ml-1"></i>
            </a>
          </div>
          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
                  <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Cliente</th>
                  <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Fecha</th>
                  <th class="px-4 py-2 text-right text-xs font-medium text-gray-500 uppercase">Monto</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <%-- Aquí iteras tu lista de ventas desde el Servlet o JPA --%>
                <c:forEach var="v" items="${listaVentas}">
                  <tr>
                    <td class="px-4 py-3 whitespace-nowrap">
                      <div class="flex items-center">
                        <div class="w-8 h-8 flex items-center justify-center bg-primary bg-opacity-10 rounded-md text-primary mr-3">
                          <i class="ri-shopping-bag-line"></i>
                        </div>
                        <span class="text-sm font-medium">${v.productoNombre}</span>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-sm">${v.cliente}</td>
                    <td class="px-4 py-3 text-sm">${v.fecha}</td>
                    <td class="px-4 py-3 text-sm text-right font-medium">$${v.monto}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </section>
      </main>
    </div>
  </div>
</body>
</html>
