class CompraDao {
  int? idCompra;
  String? fecha;
  double? total;

  CompraDao({
    this.idCompra, 
    this.fecha, 
    this.total
  });

  factory CompraDao.fromMap(Map<String, dynamic> mapa) {
    return CompraDao(
      idCompra: mapa['idCompra'],
      fecha: mapa['fecha'],
      total: mapa['total'],
    );
  }
}

class DetalleCompraDao {
  int? idDetalle;
  int? idCompra;
  String? producto;
  int? cantidad;
  double? precio;

  DetalleCompraDao({
    this.idDetalle,
    this.idCompra,
    this.producto,
    this.cantidad,
    this.precio,
  });

  factory DetalleCompraDao.fromMap(Map<String, dynamic> mapa) {
    return DetalleCompraDao(
      idDetalle: mapa['idDetalle'],
      idCompra: mapa['idCompra'],
      producto: mapa['producto'],
      cantidad: mapa['cantidad'],
      precio: mapa['precio'],
    );
  }
}
