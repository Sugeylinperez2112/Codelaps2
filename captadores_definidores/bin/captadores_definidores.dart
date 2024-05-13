class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  // Getter para calcular el total de los precios en el carrito:
  double get total => _prices.fold(0, (e, t) => e + t);

  // Setter para establecer los precios del carrito:
  set prices(List<double> value) {
    if (value.any((p) => p < 0)) {
      throw InvalidPriceException();
    }

    _prices = value;
  }
}

void main() {
  var foundException = false;

  try {
    final cart = ShoppingCart();
    cart.prices = [12.0, 12.0, -23.0];
  } on InvalidPriceException {
    foundException = true;
  } catch (e) {
    print(
        'Se intentó establecer un precio negativo y se recibió un ${e.runtimeType} \n en lugar de un InvalidPriceException.');
    return;
  }

  if (!foundException) {
    print(
        'Se intentó establecer un precio negativo \n y no se obtuvo un InvalidPriceException.');
    return;
  }

  final secondCart = ShoppingCart();

  try {
    secondCart.prices = [1.0, 2.0, 3.0];
  } catch (e) {
    print(
        'Se intentó establecer precios con una lista válida, \n pero se recibió una excepción: ${e.runtimeType}.');
    return;
  }

  if (secondCart._prices.length != 3) {
    print(
        'Se intentó establecer precios con una lista de tres valores, \n pero _prices terminó teniendo longitud ${secondCart._prices.length}.');
    return;
  }

  if (secondCart._prices[0] != 1.0 ||
      secondCart._prices[1] != 2.0 ||
      secondCart._prices[2] != 3.0) {
    final vals = secondCart._prices.map((p) => p.toString()).join(', ');
    print(
        'Se intentó establecer precios con una lista de tres valores (1, 2, 3), \n pero se obtuvieron valores incorrectos en la lista de precios ($vals) .');
    return;
  }

  var sum = 0.0;

  try {
    sum = secondCart.total;
  } catch (e) {
    print(
        'Se intentó obtener el total, pero se recibió una excepción: ${e.runtimeType}.');
    return;
  }

  if (sum != 6.0) {
    print(
        'Después de establecer los precios en (1, 2, 3), el total devuelto fue $sum en lugar de 6.');
    return;
  }

  print('¡Éxito!');
}
