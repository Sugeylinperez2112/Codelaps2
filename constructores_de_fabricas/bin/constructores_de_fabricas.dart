class IntegerHolder {
  IntegerHolder();

  // Constructor de fábrica
  factory IntegerHolder.fromList(List<int> lista) {
    if (lista.length == 1) {
      return IntegerSingle(lista[0]);
    } else if (lista.length == 2) {
      return IntegerDouble(lista[0], lista[1]);
    } else if (lista.length == 3) {
      return IntegerTriple(lista[0], lista[1], lista[2]);
    } else {
      throw Error();
    }
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a);
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b);
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c);
}

void main() {
  final errores = <String>[];

  bool lanzado = false;
  try {
    IntegerHolder.fromList([]);
  } on UnimplementedError {
    print('La prueba falló. ¿Implementaste el método?');
    return;
  } on Error {
    lanzado = true;
  } catch (e) {
    print(
        'Se llamó a IntegerSingle.fromList([]) y se obtuvo una excepción de \n tipo ${e.runtimeType}.');
    return;
  }

  if (!lanzado) {
    errores.add('Se llamó a IntegerSingle.fromList([]) y no lanzó Error.');
  }

  try {
    final obj = IntegerHolder.fromList([1]);

    if (obj is! IntegerSingle) {
      errores.add(
          'Se llamó a IntegerHolder.fromList([1]) y se obtuvo un objeto de tipo \n ${obj.runtimeType} en lugar de IntegerSingle.');
    } else {
      if (obj.a != 1) {
        errores.add(
            'Se llamó a IntegerHolder.fromList([1]) y se obtuvo un IntegerSingle con \n un valor \'a\' de ${obj.a} en lugar del valor esperado (1).');
      }
    }
  } catch (e) {
    print(
        'Se llamó a IntegerHolder.fromList([]) y se obtuvo una excepción de \n tipo ${e.runtimeType}.');
    return;
  }

  try {
    final obj = IntegerHolder.fromList([1, 2]);

    if (obj is! IntegerDouble) {
      errores.add(
          'Se llamó a IntegerHolder.fromList([1, 2]) y se obtuvo un objeto de tipo \n ${obj.runtimeType} en lugar de IntegerDouble.');
    } else {
      if (obj.a != 1) {
        errores.add(
            'Se llamó a IntegerHolder.fromList([1, 2]) y se obtuvo un IntegerDouble \n con un valor \'a\' de ${obj.a} en lugar del valor esperado (1).');
      }

      if (obj.b != 2) {
        errores.add(
            'Se llamó a IntegerHolder.fromList([1, 2]) y se obtuvo un IntegerDouble \n con un valor \'b\' de ${obj.b} en lugar del valor esperado (2).');
      }
    }
  } catch (e) {
    print(
        'Se llamó a IntegerHolder.fromList([1, 2]) y se obtuvo una excepción \n de tipo ${e.runtimeType}.');
    return;
  }

  try {
    final obj = IntegerHolder.fromList([1, 2, 3]);

    if (obj is! IntegerTriple) {
      errores.add(
          'Se llamó a IntegerHolder.fromList([1, 2, 3]) y se obtuvo un objeto de tipo \n ${obj.runtimeType} en lugar de IntegerTriple.');
    } else {
      if (obj.a != 1) {
        errores.add(
            'Se llamó a IntegerHolder.fromList([1, 2, 3]) y se obtuvo un IntegerTriple \n con un valor \'a\' de ${obj.a} en lugar del valor esperado (1).');
      }

      if (obj.b != 2) {
        errores.add(
            'Se llamó a IntegerHolder.fromList([1, 2, 3]) y se obtuvo un IntegerTriple \n con un valor \'b\' de ${obj.b} en lugar del valor esperado (2).');
      }

      if (obj.c != 3) {
        errores.add(
            'Se llamó a IntegerHolder.fromList([1, 2, 3]) y se obtuvo un IntegerTriple \n con un valor \'c\' de ${obj.b} en lugar del valor esperado (2).');
      }
    }
  } catch (e) {
    print(
        'Se llamó a IntegerHolder.fromList([1, 2, 3]) y se obtuvo una excepción \n de tipo ${e.runtimeType}.');
    return;
  }

  if (errores.isEmpty) {
    print('¡Éxito!');
  } else {
    errores.forEach(print);
  }
}
