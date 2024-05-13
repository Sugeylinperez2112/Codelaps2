class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

BigObject fillBigObject(BigObject obj) {
  // Crea una única declaración que actualizará y devolverá obj:
  return obj
    ..anInt = 1
    ..aString = 'String!'
    ..aList.add(3)
    ..allDone();
}

void main() {
  BigObject obj;

  try {
    obj = fillBigObject(BigObject());
  } catch (e) {
    print(
        'Se produjo una excepción de tipo ${e.runtimeType} \n mientras se ejecutaba fillBigObject');
    return;
  }

  final errs = <String>[];

  if (obj.anInt != 1) {
    errs.add(
        'El valor de anInt fue ${obj.anInt} \n en lugar del valor esperado (1).');
  }

  if (obj.aString != 'String!') {
    errs.add(
        'El valor de aString fue \'${obj.aString}\' \n en lugar del valor esperado (\'String!\').');
  }

  if (obj.aList.length != 1) {
    errs.add(
        'La longitud de aList fue ${obj.aList.length} \n en lugar del valor esperado (1).');
  } else {
    if (obj.aList[0] != 3.0) {
      errs.add(
          'El valor encontrado en aList fue ${obj.aList[0]} \n en lugar del valor esperado (3.0).');
    }
  }

  if (!obj._done) {
    errs.add('Parece que no se llamó a allDone().');
  }

  if (errs.isEmpty) {
    print('¡Éxito!');
  } else {
    errs.forEach(print);
  }
}
