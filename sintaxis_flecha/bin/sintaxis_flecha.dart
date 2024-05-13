class MyClass {
  int value1 = 2;
  int value2 = 3;
  int value3 = 5;

  // Retorna el producto de los valores anteriores:
  int get product => value1 * value2 * value3;

  // Añade 1 a value1:
  void incrementValue1() => value1++;

  // Retorna una cadena que contiene cada elemento en la lista, separados por comas (por ejemplo, 'a,b,c'):
  String joinWithCommas(List<String> strings) => strings.join(',');
}

void main() {
  final obj = MyClass();
  final errs = <String>[];

  try {
    final product = obj.product;

    if (product != 30) {
      errs.add(
          'La propiedad product devolvió $product \n en lugar del valor esperado (30).');
    }
  } catch (e) {
    print(
        'Se intentó usar MyClass.product, pero se encontró una excepción: \n ${e.runtimeType}.');
    return;
  }

  try {
    obj.incrementValue1();

    if (obj.value1 != 3) {
      errs.add(
          'Después de llamar a incrementValue1, value1 fue ${obj.value1} \n en lugar del valor esperado (3).');
    }
  } catch (e) {
    print(
        'Se intentó usar MyClass.incrementValue1, pero se encontró una excepción: \n ${e.runtimeType}.');
    return;
  }

  try {
    final joined = obj.joinWithCommas(['uno', 'dos', 'tres']);

    if (joined != 'uno,dos,tres') {
      errs.add(
          'Se intentó llamar a joinWithCommas([\'uno\', \'dos\', \'tres\']) \n y se recibió $joined en lugar del valor esperado (\'uno,dos,tres\').');
    }
  } catch (e) {
    print(
        'Se intentó usar MyClass.joinWithCommas, pero se encontró una excepción: \n ${e.runtimeType}.');
    return;
  }

  if (errs.isEmpty) {
    print('¡Éxito!');
  } else {
    errs.forEach(print);
  }
}
