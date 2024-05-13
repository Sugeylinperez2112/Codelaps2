class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  // Constructor con nombre "black"_redirigiendo constructor
  Color.black() : this(0, 0, 0);
}

void main() {
  final errores = <String>[];

  try {
    final resultado = Color.black();

    if (resultado.red != 0) {
      errores.add(
          'Se llamó a Color.black() y se obtuvo un Color con el valor rojo igual a \n ${resultado.red} en lugar del valor esperado (0).');
    }

    if (resultado.green != 0) {
      errores.add(
          'Se llamó a Color.black() y se obtuvo un Color con el valor verde igual a \n ${resultado.green} en lugar del valor esperado (0).');
    }

    if (resultado.blue != 0) {
      errores.add(
          'Se llamó a Color.black() y se obtuvo un Color con el valor azul igual a \n ${resultado.blue} en lugar del valor esperado (0).');
    }
  } catch (e) {
    print(
        'Se llamó a Color.black() y se obtuvo una excepción de tipo ${e.runtimeType}.');
    return;
  }

  if (errores.isEmpty) {
    print('¡Éxito!');
  } else {
    errores.forEach(print);
  }
}
