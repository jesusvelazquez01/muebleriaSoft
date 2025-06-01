<%-- 
    Document   : index
    Created on : 19 abr. 2025, 21:38:45
    Author     : jv176
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión de Mueblería</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>tailwind.config={theme:{extend:{colors:{primary:'#8B4513',secondary:'#D2B48C'},borderRadius:{'none':'0px','sm':'4px',DEFAULT:'8px','md':'12px','lg':'16px','xl':'20px','2xl':'24px','3xl':'32px','full':'9999px','button':'8px'}}}}</script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>
    <style>
        :where([class^="ri-"])::before { content: "\f3c2"; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #F9F7F5;
            color: #4B3F32;
        }
        .sidebar-item.active {
            background-color: rgba(139, 69, 19, 0.1);
            border-left: 3px solid #8B4513;
        }
        .sidebar-item:hover:not(.active) {
            background-color: rgba(139, 69, 19, 0.05);
        }
        .custom-checkbox {
            appearance: none;
            width: 18px;
            height: 18px;
            border: 2px solid #D2B48C;
            border-radius: 4px;
            position: relative;
            cursor: pointer;
            transition: all 0.2s;
        }
        .custom-checkbox:checked {
            background-color: #8B4513;
            border-color: #8B4513;
        }
        .custom-checkbox:checked::after {
            content: '';
            position: absolute;
            left: 5px;
            top: 2px;
            width: 6px;
            height: 10px;
            border: solid white;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }
        .custom-switch {
            position: relative;
            display: inline-block;
            width: 44px;
            height: 22px;
        }
        .custom-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .switch-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #E5E7EB;
            transition: .4s;
            border-radius: 34px;
        }
        .switch-slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 3px;
            bottom: 2px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        input:checked + .switch-slider {
            background-color: #8B4513;
        }
        input:checked + .switch-slider:before {
            transform: translateX(20px);
        }
        .custom-range {
            -webkit-appearance: none;
            width: 100%;
            height: 6px;
            border-radius: 5px;
            background: #E5E7EB;
            outline: none;
        }
        .custom-range::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: #8B4513;
            cursor: pointer;
        }
        .custom-range::-moz-range-thumb {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: #8B4513;
            cursor: pointer;
            border: none;
        }
        .tab-button {
            position: relative;
        }
        .tab-button.active::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #8B4513;
        }
    </style>
</head>
<body>
    <div class="flex h-screen overflow-hidden">
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
                    <a href="SvMateriaPrima" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
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
                    <a href="SvDetalleCompra" class="sidebar-item flex items-center px-3 py-3 text-sm font-medium rounded-md">
                        <div class="w-6 h-6 flex items-center justify-center mr-3 text-gray-500">
                            <i class="ri-shopping-cart-line"></i>
                        </div>
                        <span>Compras de Materia prima</span>
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

        <!-- Main Content -->
        <div class="flex-1 flex flex-col overflow-hidden">
            <!-- Top Navigation -->
            <header class="bg-white shadow-sm z-10">
                <div class="px-6 py-4 flex items-center justify-between">
                    <div class="flex items-center">
                        <h2 class="text-lg font-medium">Inicio</h2>
                        <div class="hidden md:flex items-center ml-4 text-sm text-gray-500">
                            <span>Inicio</span>
                            <div class="w-4 h-4 flex items-center justify-center mx-1">
                                <i class="ri-arrow-right-s-line"></i>
                            </div>
                            <span class="text-primary">Dashboard</span>
                        </div>
                    </div>
                    <div class="flex items-center space-x-4">
                        <div class="relative">
                            
                        <div class="relative">
                            <button class="flex items-center text-sm focus:outline-none">
                                <span>01/06/2025</span>
                                <div class="w-4 h-4 flex items-center justify-center ml-1">
                                    <i class="ri-calendar-line"></i>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Content Area -->
            <main class="flex-1 overflow-y-auto bg-gray-50 p-6">
                <!-- Quick Stats -->
                

                <!-- Quick Actions -->
                <div class="bg-white rounded shadow-sm p-6 mb-6">
                    <h3 class="text-lg font-medium mb-4">Acciones Rápidas</h3>
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <button class="rounded-button bg-primary text-white py-3 px-4 flex items-center justify-center whitespace-nowrap">
                            <div class="w-5 h-5 flex items-center justify-center mr-2">
                                <i class="ri-add-line"></i>
                            </div>
                            <a href="#"> Nueva Venta</a>
                        </button>
                        <button class="rounded-button bg-secondary text-primary py-3 px-4 flex items-center justify-center whitespace-nowrap">
                            <div class="w-5 h-5 flex items-center justify-center mr-2">
                                <i class="ri-shopping-cart-line"></i>
                            </div>
                            <span>Nueva Compra</span>
                        </button>
                        <button class="rounded-button border border-gray-300 py-3 px-4 flex items-center justify-center whitespace-nowrap">
                            <div class="w-5 h-5 flex items-center justify-center mr-2">
                                <i class="ri-file-list-3-line"></i>
                            </div>
                            <span>Nuevo Presupuesto</span>
                        </button>
                        <button class="rounded-button border border-gray-300 py-3 px-4 flex items-center justify-center whitespace-nowrap">
                            <div class="w-5 h-5 flex items-center justify-center mr-2">
                                <i class="ri-bar-chart-line"></i>
                            </div>
                            <span>Ver Reportes</span>
                        </button>
                    </div>
                </div>

                <!-- Charts -->
                

                <!-- Recent Data -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    <!-- Recent Sales -->
                    <div class="bg-white rounded shadow-sm p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-lg font-medium">Últimas Ventas</h3>
                            <a href="#" class="text-sm text-primary flex items-center">
                                <span>Ver todas</span>
                                <div class="w-4 h-4 flex items-center justify-center ml-1">
                                    <i class="ri-arrow-right-line"></i>
                                </div>
                            </a>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead>
                                    <tr>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Producto</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Cliente</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha</th>
                                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Monto</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-primary bg-opacity-10 rounded-md text-primary mr-3">
                                                    <i class="ri-sofa-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Sofá Modelo Viena</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">Gabriela Fernández</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">19/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$15,800</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-primary bg-opacity-10 rounded-md text-primary mr-3">
                                                    <i class="ri-table-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Mesa de Comedor Roble</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">Ricardo Mendoza</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">18/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$8,750</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-primary bg-opacity-10 rounded-md text-primary mr-3">
                                                    <i class="ri-hotel-bed-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Cama King Modelo Oslo</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">Carolina Sánchez</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">17/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$12,300</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-primary bg-opacity-10 rounded-md text-primary mr-3">
                                                    <i class="ri-door-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Armario Ropero Doble</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">Miguel Herrera</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">16/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$9,450</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Recent Purchases -->
                    <div class="bg-white rounded shadow-sm p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-lg font-medium">Últimas Compras</h3>
                            <a href="#" class="text-sm text-primary flex items-center">
                                <span>Ver todas</span>
                                <div class="w-4 h-4 flex items-center justify-center ml-1">
                                    <i class="ri-arrow-right-line"></i>
                                </div>
                            </a>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead>
                                    <tr>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Material</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Cantidad</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha</th>
                                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Monto</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-secondary bg-opacity-20 rounded-md text-primary mr-3">
                                                    <i class="ri-stack-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Madera Roble Premium</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">120 m²</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">18/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$18,600</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-secondary bg-opacity-20 rounded-md text-primary mr-3">
                                                    <i class="ri-paint-brush-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Barniz Poliuretano</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">50 L</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">17/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$4,250</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-secondary bg-opacity-20 rounded-md text-primary mr-3">
                                                    <i class="ri-tools-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Tornillos Especiales</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">2,000 uds</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">15/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$1,800</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex items-center justify-center bg-secondary bg-opacity-20 rounded-md text-primary mr-3">
                                                    <i class="ri-scissors-cut-line"></i>
                                                </div>
                                                <span class="text-sm font-medium">Tela Tapicería Premium</span>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">80 m</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm">14/04/2025</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-right font-medium">$7,200</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Category Chart
            const categoryChart = echarts.init(document.getElementById('categoryChart'));
            const categoryOption = {
                animation: false,
                tooltip: {
                    trigger: 'item',
                    backgroundColor: 'rgba(255, 255, 255, 0.8)',
                    borderColor: '#E5E7EB',
                    textStyle: {
                        color: '#1f2937'
                    }
                },
                legend: {
                    orient: 'vertical',
                    right: 10,
                    top: 'center',
                    textStyle: {
                        color: '#1f2937'
                    }
                },
                series: [
                    {
                        name: 'Ventas por Categoría',
                        type: 'pie',
                        radius: ['40%', '70%'],
                        avoidLabelOverlap: false,
                        itemStyle: {
                            borderRadius: 8,
                            borderColor: '#fff',
                            borderWidth: 2
                        },
                        label: {
                            show: false
                        },
                        emphasis: {
                            label: {
                                show: false
                            }
                        },
                        labelLine: {
                            show: false
                        },
                        data: [
                            { value: 38, name: 'Salas', itemStyle: { color: 'rgba(87, 181, 231, 1)' } },
                            { value: 25, name: 'Comedores', itemStyle: { color: 'rgba(141, 211, 199, 1)' } },
                            { value: 22, name: 'Dormitorios', itemStyle: { color: 'rgba(251, 191, 114, 1)' } },
                            { value: 15, name: 'Oficina', itemStyle: { color: 'rgba(252, 141, 98, 1)' } }
                        ]
                    }
                ]
            };
            categoryChart.setOption(categoryOption);

            // Sales Chart
            const salesChart = echarts.init(document.getElementById('salesChart'));
            const salesOption = {
                animation: false,
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: 'rgba(255, 255, 255, 0.8)',
                    borderColor: '#E5E7EB',
                    textStyle: {
                        color: '#1f2937'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    top: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun'],
                    axisLine: {
                        lineStyle: {
                            color: '#E5E7EB'
                        }
                    },
                    axisLabel: {
                        color: '#1f2937'
                    }
                },
                yAxis: {
                    type: 'value',
                    axisLine: {
                        show: false
                    },
                    axisLabel: {
                        color: '#1f2937'
                    },
                    splitLine: {
                        lineStyle: {
                            color: '#E5E7EB'
                        }
                    }
                },
                series: [
                    {
                        name: 'Ventas',
                        type: 'line',
                        smooth: true,
                        symbol: 'none',
                        lineStyle: {
                            width: 3,
                            color: 'rgba(87, 181, 231, 1)'
                        },
                        areaStyle: {
                            color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [
                                    {
                                        offset: 0,
                                        color: 'rgba(87, 181, 231, 0.2)'
                                    },
                                    {
                                        offset: 1,
                                        color: 'rgba(87, 181, 231, 0.01)'
                                    }
                                ]
                            }
                        },
                        data: [85000, 69000, 92000, 78000, 110000, 95000]
                    }
                ]
            };
            salesChart.setOption(salesOption);

            // Resize charts when window resizes
            window.addEventListener('resize', function() {
                categoryChart.resize();
                salesChart.resize();
            });
        });
    </script>
</body>
</html>

</html>
