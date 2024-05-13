String? foo = 'a string';
String? bar; // = null

// Sustituye un operador que haga que 'una cadena' se asigne a baz.
String? baz = foo ?? bar;

void updateSomeVars() {
  // Sustituye un operador que haga que 'una cadena' se asigne a bar.
  bar ??= 'a string';
}

void main() {
  try {
    updateSomeVars();

    if (foo != 'a string') {
      print('Parece que foo terminó con el valor incorrecto.');
    } else if (bar != 'a string') {
      print('Parece que bar terminó con el valor incorrecto.');
    } else if (baz != 'a string') {
      print('Parece que baz terminó con el valor incorrecto.');
    } else {
      print('¡Éxito!');
    }
  } catch (e) {
    print('Exception: ${e.runtimeType}.');
  }
}
