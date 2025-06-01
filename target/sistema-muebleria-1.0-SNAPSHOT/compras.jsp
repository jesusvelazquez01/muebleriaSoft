<%@page import="Logica.Auxiliar.ItemCarritoCompra"%>
<%@page import="Logica.MateriaPrima"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<MateriaPrima> materias = (List<MateriaPrima>) session.getAttribute("listaMateriaPrima");
%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Registrar Nueva Compra</title>
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
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #F9F7F5;
      color: #4B3F32;
    }
  </style>
</head>
<body class="bg-gray-50 font-sans text-gray-700">

<div class="flex h-screen">
  <%@ include file="Sidebar.jsp" %>

  <div class="flex-1 flex flex-col overflow-hidden">
    <main class="p-6 overflow-y-auto">
      <h1 class="text-2xl font-semibold mb-6">Registrar Nueva Compra</h1>

      <!-- 1️⃣ Formulario para agregar detalle de compra -->
      <section class="bg-white rounded-xl shadow p-6 mb-8">
        <h2 class="text-lg font-medium mb-4">Agregar Materia Prima</h2>
        <form action="SvDetalleCompra" method="post" class="grid grid-cols-1 md:grid-cols-3 gap-4">

          <!-- Materia Prima (ID) -->
          <div>
  <label for="materiaPrimaId" class="block text-sm font-medium mb-1">Materia Prima</label>
  <select id="materiaPrimaId" name="materiaPrimaId" required
          class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary">
    <option value="">-- Selecciona --</option>
    <%
      if (materias != null && !materias.isEmpty()) {
          for (MateriaPrima mp : materias) {
    %>
      <option value="<%= mp.getId() %>"><%= mp.getNombre() %></option>
    <%
          }
      } else {
    %>
      <option disabled>⚠️ No hay materias primas cargadas</option>
    <%
      }
    %>
  </select>
</div>


          <!-- Cantidad -->
          <div>
            <label for="cantidad" class="block text-sm font-medium mb-1">Cantidad</label>
            <input type="number" id="cantidad" name="cantidad" required min="1"
                   class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                   placeholder="0">
          </div>

          <!-- Precio Unitario -->
          <div>
            <label for="precioUnitario" class="block text-sm font-medium mb-1">Precio Unitario</label>
            <input type="number" id="precioUnitario" name="precioUnitario" required step="0.01"
                   class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                   placeholder="0.00">
          </div>

          <!-- Botón para agregar -->
          <div class="md:col-span-3 text-right">
            <button type="submit"
                    class="bg-primary hover:bg-opacity-90 text-white font-medium py-2 px-6 rounded-button">
              <i class="ri-add-line align-middle mr-1"></i> Agregar al Carrito
            </button>
          </div>
        </form>
      </section>

      <!-- 2️⃣ Tabla del carrito (DetalleCompra temporal) -->
      <section class="bg-white rounded-xl shadow p-6 mb-8">
        <h2 class="text-lg font-medium mb-4">Carrito de Compras</h2>
        <table class="min-w-full divide-y divide-gray-200">
          <thead>
            <tr>
              <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Detalle</th>
              <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Cantidad</th>
              <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Precio Unitario</th>
              <th class="px-4 py-2 text-right text-xs font-medium text-gray-500 uppercase">Subtotal</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
<%
  List<ItemCarritoCompra> carrito = (List<ItemCarritoCompra>) session.getAttribute("carritoCompra");
  if (carrito != null && !carrito.isEmpty()) {
    for (ItemCarritoCompra item : carrito) {
%>
    <tr>
      <td class="px-4 py-3"><%= item.getDetalle() %></td>
      <td class="px-4 py-3"><%= item.getCantidad() %></td>
      <td class="px-4 py-3">$<%= item.getPrecioUnitario() %></td>
      <td class="px-4 py-3 text-right font-medium">$<%= item.getSubtotal() %></td>
    </tr>
<%
    }
  } else {
%>
    <tr>
      <td colspan="4" class="text-center text-sm py-4 text-gray-500">⚠️ No hay ítems en el carrito</td>
    </tr>
<%
  }
%>
</tbody>

        </table>
      </section>

      <!-- 3️⃣ Confirmar compra -->
      <form action="SvConfirmarCompraMateriaPrima" method="post">
        <div class="mb-4">
          <label for="fecha" class="block text-sm font-medium mb-1">Fecha</label>
          <input type="date" id="fecha" name="fecha"
                 class="border-gray-300 rounded-md focus:ring-primary focus:border-primary">
        </div>
        <button type="submit"
                class="bg-primary hover:bg-opacity-90 text-white font-medium py-2 px-6 rounded-button">
          <i class="ri-check-line align-middle mr-1"></i> Confirmar Compra
        </button>
      </form>

    </main>
  </div>
</div>

</body>
</html>




