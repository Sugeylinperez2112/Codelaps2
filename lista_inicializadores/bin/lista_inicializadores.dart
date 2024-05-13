class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  // Constructor con una lista de inicialización
  FirstTwoLetters(String palabra)
      : assert(palabra.length >= 2),
        letterOne = palabra[0],
        letterTwo = palabra[1];
}

void main() {
  final errores = <String>[];

  try {
    final resultado = FirstTwoLetters('Mi Cadena');

    if (resultado.letterOne != 'M') {
      errores.add(
          'Se llamó a FirstTwoLetters(\'Mi Cadena\') y se obtuvo un objeto con \n letterOne igual a \'${resultado.letterOne}\' en lugar del valor esperado (\'M\').');
    }

    if (resultado.letterTwo != 'i') {
      errores.add(
          'Se llamó a FirstTwoLetters(\'Mi Cadena\') y se obtuvo un objeto con \n letterTwo igual a \'${resultado.letterTwo}\' en lugar del valor esperado (\'i\').');
    }
  } catch (e) {
    errores.add(
        'Se llamó a FirstTwoLetters(\'Mi Cadena\') y se obtuvo una excepción \n de tipo ${e.runtimeType}.');
  }

  bool excepcionCapturada = false;

  try {
    FirstTwoLetters('');
  } catch (e) {
    excepcionCapturada = true;
  }

  if (!excepcionCapturada) {
    errores.add(
        'Se llamó a FirstTwoLetters(\'\') y no se obtuvo una excepción \n por la aserción fallida.');
  }

  if (errores.isEmpty) {
    print('¡Éxito!');
  } else {
    errores.forEach(print);
  }
}
