// Asigna una lista que contenga 'a', 'b' y 'c' en ese orden:
final aListOfStrings = ['a', 'b', 'c'];

// Asigna un conjunto que contenga 3, 4 y 5:
final aSetOfInts = {3, 4, 5};

// Asigna un mapa de String a int para que aMapOfStringsToInts['miClave'] devuelva 12:
final aMapOfStringsToInts = {'myKey': 12};

// Asigna una lista vacía de tipo double:
final anEmptyListOfDouble = <double>[];

// Asigna un conjunto vacío de tipo String:
final anEmptySetOfString = <String>{};

// Asigna un mapa vacío de double a int:
final anEmptyMapOfDoublesToInts = <double, int>{};

void main() {
  final errs = <String>[];

  if (aListOfStrings is! List<String>) {
    errs.add('aListOfStrings debería tener el tipo List<String>.');
  } else if (aListOfStrings.length != 3) {
    errs.add(
        'aListOfStrings tiene ${aListOfStrings.length} elementos, \n en lugar de los 3 esperados.');
  } else if (aListOfStrings[0] != 'a' ||
      aListOfStrings[1] != 'b' ||
      aListOfStrings[2] != 'c') {
    errs.add(
        'aListOfStrings no contiene los valores correctos (\'a\', \'b\', \'c\').');
  }

  if (aSetOfInts is! Set<int>) {
    errs.add('aSetOfInts debería tener el tipo Set<int>.');
  } else if (aSetOfInts.length != 3) {
    errs.add(
        'aSetOfInts tiene ${aSetOfInts.length} elementos, \n en lugar de los 3 esperados.');
  } else if (!aSetOfInts.contains(3) ||
      !aSetOfInts.contains(4) ||
      !aSetOfInts.contains(5)) {
    errs.add('aSetOfInts no contiene los valores correctos (3, 4, 5).');
  }

  if (aMapOfStringsToInts is! Map<String, int>) {
    errs.add('aMapOfStringsToInts debería tener el tipo Map<String, int>.');
  } else if (aMapOfStringsToInts['myKey'] != 12) {
    errs.add(
        'aMapOfStringsToInts no contiene los valores correctos (\'myKey\': 12).');
  }

  if (anEmptyListOfDouble is! List<double>) {
    errs.add('anEmptyListOfDouble debería tener el tipo List<double>.');
  } else if (anEmptyListOfDouble.isNotEmpty) {
    errs.add('anEmptyListOfDouble debería estar vacío.');
  }

  if (anEmptySetOfString is! Set<String>) {
    errs.add('anEmptySetOfString debería tener el tipo Set<String>.');
  } else if (anEmptySetOfString.isNotEmpty) {
    errs.add('anEmptySetOfString debería estar vacío.');
  }

  if (anEmptyMapOfDoublesToInts is! Map<double, int>) {
    errs.add(
        'anEmptyMapOfDoublesToInts debería tener el tipo Map<double, int>.');
  } else if (anEmptyMapOfDoublesToInts.isNotEmpty) {
    errs.add('anEmptyMapOfDoublesToInts debería estar vacío.');
  }

  if (errs.isEmpty) {
    print('¡Éxito!');
  } else {
    errs.forEach(print);
  }

  // ignore_for_file: unnecessary_type_check
}
