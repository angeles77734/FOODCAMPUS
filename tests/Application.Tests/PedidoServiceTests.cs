using Xunit;
using FoodCampus.Application.Services;
using FoodCampus.Domain.Models;
using FoodCampus.Infrastructure.Repositories;
using FoodCampus.Infrastructure.Models.Data;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace FoodCampus.Tests.Application;

/// <summary>
/// Pruebas unitarias para el servicio de gestión de pedidos.
/// Implementadas con xUnit y datos simulados para independencia absoluta.
/// </summary>
public class PedidoServiceTests
{
    private readonly ProductoRepository _fakeRepo;
    private readonly PedidoService _service;

    public PedidoServiceTests()
    {
        // Simulamos el repositorio con un connection string nulo para las pruebas unitarias
        // que no realizarán llamadas reales a la BD.
        _fakeRepo = new TestableProductoRepository();
        _service = new PedidoService(_fakeRepo);
    }

    [Fact]
    public void CrearPedido_EstudianteValido_DebeRetornarPedidoVacio()
    {
        // Arrange
        int estudianteId = 10;

        // Act
        var pedido = _service.CrearPedido(estudianteId);

        // Assert
        Assert.NotNull(pedido);
        Assert.Equal(estudianteId, pedido.EstudianteId);
        Assert.Empty(pedido.Detalles);
    }

    [Fact]
    public async Task ConfirmarPedido_SinProductos_DebeLanzarExcepcion()
    {
        // Arrange
        var pedido = _service.CrearPedido(1);

        // Act & Assert
        var ex = Assert.Throws<InvalidOperationException>(() => _service.ConfirmarPedido(pedido));
        Assert.Contains("No se puede confirmar un pedido sin productos", ex.Message);
    }

    [Fact]
    public async Task AgregarProducto_ProductoValido_DebeCalcularTotalCorrectamente()
    {
        // Arrange
        var pedido = _service.CrearPedido(1);
        int productoId = 1; // ID 1 en el Repo de Prueba (Precio 50.0)
        int cantidad = 2;

        // Act
        await _service.AgregarProductoPedidoAsync(pedido, productoId, cantidad);
        
        // Assert
        decimal esperado = 50.0m * 2;
        Assert.Single(pedido.Detalles);
        Assert.Equal(esperado, pedido.Total);
    }

    [Fact]
    public async Task AgregarProducto_ProductoInexistente_DebeLanzarKeyNotFound()
    {
        // Arrange
        var pedido = _service.CrearPedido(1);
        int productoIdInexistente = 999;

        // Act & Assert
        await Assert.ThrowsAsync<KeyNotFoundException>(async () => 
            await _service.AgregarProductoPedidoAsync(pedido, productoIdInexistente, 1));
    }

    [Fact]
    public void CrearPedido_EstudianteInexistente_DebeLanzarArgumentException()
    {
        // Arrange
        int estudianteIdInvalido = -1;

        // Act & Assert
        Assert.Throws<ArgumentException>(() => _service.CrearPedido(estudianteIdInvalido));
    }

    /// <summary>
    /// Clase interna para interceptar y simular datos sin tocar la BD real.
    /// </summary>
    private class TestableProductoRepository : ProductoRepository
    {
        public TestableProductoRepository() : base("NoConnectionString") { }

        // Sobrescribimos el comportamiento para las pruebas
        public new async Task<ProductoEntity?> GetProductoByIdAsync(int productoId)
        {
            if (productoId == 1)
                return new ProductoEntity(1, "Sándwich Prueba", "Desayunos", 50.0m, true);
            
            return null;
        }
    }
}
