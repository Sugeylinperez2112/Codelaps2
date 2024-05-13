String? upperCaseIt(String? str) {
  // Intentar acceder condicionalmente al método `toUpperCase` aquí.
  return str?.toUpperCase();
}

void main() {
  try {
    String? one = upperCaseIt(null);
    if (one != null) {
      print('Parece que no estás devolviendo null para entradas nulas.');
    } else {
      print('¡Éxito cuando str es nulo!');
    }
  } catch (e) {
    print(
        'Intentaste llamar a upperCaseIt(null) y obtuviste una excepción: \n ${e.runtimeType}.');
  }

  try {
    String? two = upperCaseIt('una cadena');
    if (two == null) {
      print(
          'Parece que estás devolviendo null incluso cuando str tiene un valor.');
    } else if (two != 'UNA CADENA') {
      print(
          'Intentaste upperCaseIt(\'una cadena\'), pero no obtuviste \'UNA CADENA\' como respuesta.');
    } else {
      print('¡Éxito cuando str no es nulo!');
    }
  } catch (e) {
    print(
        'Intentaste llamar a upperCaseIt(\'una cadena\') y obtuviste una excepción: \n ${e.runtimeType}.');
  }
}
