<%@page import="Logica.MateriaPrima"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<MateriaPrima> materias = (List<MateriaPrima>) session.getAttribute("listaMateriaPrima");
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Materia Prima</title>
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
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet" />
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
<div class="flex h-screen overflow-hidden">
  <%@ include file="Sidebar.jsp" %>

  <div class="flex-1 flex flex-col overflow-hidden">
    <main class="p-6 overflow-y-auto">

      <h1 class="text-2xl font-semibold mb-6">Gestión de Materia Prima</h1>

      <!-- Formulario para agregar materia prima -->
      <section class="bg-white rounded-xl shadow p-6 mb-8">
        <h2 class="text-lg font-medium mb-4">Nueva Materia Prima</h2>
        <form action="SvMateriaPrima" method="post" class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label for="nombre" class="block text-sm font-medium mb-1">Nombre</label>
            <input type="text" id="nombre" name="nombre" required
                   class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                   placeholder="Ej: Madera Pino, Barniz, Tornillos">
          </div>

          <div>
            <label for="stock" class="block text-sm font-medium mb-1">Stock</label>
            <input type="number" id="stock" name="stock" required min="0"
                   class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                   placeholder="Ej: 100">
          </div>

          <div>
            <label for="precio_unitario" class="block text-sm font-medium mb-1">Precio Unitario</label>
            <input type="number" id="precio_unitario" name="precio_unitario" required step="0.01"
                   class="w-full border-gray-300 rounded-md focus:ring-primary focus:border-primary"
                   placeholder="Ej: 250.50">
          </div>

          <div class="md:col-span-3 text-right">
            <button type="submit"
                    class="bg-primary hover:bg-opacity-90 text-white font-medium py-2 px-6 rounded-button">
              <i class="ri-add-line align-middle mr-1"></i> Agregar Materia Prima
            </button>
          </div>
        </form>
      </section>

      <!-- Tabla con Java embebido -->
      <section class="bg-white rounded-xl shadow p-6">
        <h2 class="text-lg font-medium mb-4">Listado de Materia Prima</h2>
        <table class="min-w-full divide-y divide-gray-200">
          <thead>
            <tr>
              <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
              <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Nombre</th>
              <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Stock</th>
              <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Precio Unitario</th>
              <th class="px-4 py-2 text-right text-xs font-medium text-gray-500 uppercase">Acciones</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <%
              if (materias != null && !materias.isEmpty()) {
                  for (MateriaPrima mp : materias) {
            %>
              <tr>
                <td class="px-4 py-3 text-sm"><%= mp.getId() %></td>
                <td class="px-4 py-3 text-sm"><%= mp.getNombre() %></td>
                <td class="px-4 py-3 text-sm"><%= mp.getStock() %></td>
                <td class="px-4 py-3 text-sm">$<%= mp.getPrecio_unitario() %></td>
                <td class="px-4 py-3 text-sm text-right">
                  <button class="text-primary hover:underline text-sm"><i class="ri-edit-line mr-1"></i>Editar</button>
                  <form action="SvMateriaPrimaEliminar" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= mp.getId() %>">
                    <button type="submit" class="text-red-600 hover:underline text-sm ml-4">
                      <i class="ri-delete-bin-line mr-1"></i>Eliminar
                    </button>
                  </form>
                </td>
              </tr>
            <%
                  }
              } else {
            %>
              <tr>
                <td colspan="5" class="text-center text-sm py-4 text-gray-500">
                  ⚠️ No hay materias primas cargadas todavía.
                </td>
              </tr>
            <%
              }
            %>
          </tbody>
        </table>
      </section>

    </main>
  </div>
</div>
</body>
</html>

