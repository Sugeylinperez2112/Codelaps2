class MyClass {
  final int anInt;
  final String aString;
  final double aDouble;

  // Constructor
  MyClass(this.anInt, this.aString, this.aDouble);
}

void main() {
  final errs = <String>[];

  try {
    final obj = MyClass(1, 'two', 3);

    if (obj.anInt != 1) {
      errs.add(
          'Se llamó a MyClass(1, \'two\', 3) y se obtuvo un objeto con anInt de ${obj.anInt} \n en lugar del valor esperado (1).');
    }

    if (obj.aString != 'two') {
      errs.add(
          'Se llamó a MyClass(1, \'two\', 3) y se obtuvo un objeto con aString de \'${obj.aString}\' \n en lugar del valor esperado (\'two\').');
    }

    if (obj.aDouble != 3) {
      errs.add(
          'Se llamó a MyClass(1, \'two\', 3) y se obtuvo un objeto con aDouble de ${obj.aDouble} \n en lugar del valor esperado (3).');
    }
  } catch (e) {
    print(
        'Se llamó a MyClass(1, \'two\', 3) y se obtuvo una excepción \n de tipo ${e.runtimeType}.');
  }

  if (errs.isEmpty) {
    print('¡Éxito!');
  } else {
    errs.forEach(print);
  }
}
