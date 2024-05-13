class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  // Método copyWith para crear una nueva instancia con los campos actualizados:
  MyDataObject copyWith({
    int? newInt,
    String? newString,
    double? newDouble,
  }) {
    return MyDataObject(
      anInt: newInt ?? anInt,
      aString: newString ?? aString,
      aDouble: newDouble ?? aDouble,
    );
  }
}

void main() {
  final source = MyDataObject();
  final errs = <String>[];

  try {
    final copy = source.copyWith(newInt: 12, newString: 'New!', newDouble: 3.0);

    if (copy.anInt != 12) {
      errs.add(
          'Se llamó a copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n y el nuevo valor de anInt fue ${copy.anInt} en lugar del valor esperado (12).');
    }

    if (copy.aString != 'New!') {
      errs.add(
          'Se llamó a copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n y el nuevo valor de aString fue ${copy.aString} en lugar del valor esperado (\'New!\').');
    }

    if (copy.aDouble != 3) {
      errs.add(
          'Se llamó a copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n y el nuevo valor de aDouble fue ${copy.aDouble} en lugar del valor esperado (3).');
    }
  } catch (e) {
    print(
        'Se llamó a copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0) \n y se obtuvo una excepción: ${e.runtimeType}');
  }

  try {
    final copy = source.copyWith();

    if (copy.anInt != 1) {
      errs.add(
          'Se llamó a copyWith(), y el nuevo valor de anInt fue ${copy.anInt} \n en lugar del valor esperado (1).');
    }

    if (copy.aString != 'Old!') {
      errs.add(
          'Se llamó a copyWith(), y el nuevo valor de aString fue ${copy.aString} \n en lugar del valor esperado (\'Old!\').');
    }

    if (copy.aDouble != 2) {
      errs.add(
          'Se llamó a copyWith(), y el nuevo valor de aDouble fue ${copy.aDouble} \n en lugar del valor esperado (2).');
    }
  } catch (e) {
    print('Se llamó a copyWith() y se obtuvo una excepción: ${e.runtimeType}');
  }

  if (errs.isEmpty) {
    print('¡Éxito!');
  } else {
    errs.forEach(print);
  }
}
