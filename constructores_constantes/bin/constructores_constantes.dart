class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;

  // Constructor constante
  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
}

void main() {
  final errores = <String>[];

  try {
    const obj =
        Recipe(['1 huevo', 'Pizca de mantequilla', 'Pizca de sal'], 120, 200);

    if (obj.ingredients.length != 3) {
      errores.add(
          'Se llamó a Recipe([\'1 huevo\', \'Pizca de mantequilla\', \'Pizca de sal\'], 120, 200) \n y se obtuvo un objeto con una lista de ingredientes de longitud ${obj.ingredients.length} en lugar de la longitud esperada (3).');
    }

    if (obj.calories != 120) {
      errores.add(
          'Se llamó a Recipe([\'1 huevo\', \'Pizca de mantequilla\', \'Pizca de sal\'], 120, 200) \n y se obtuvo un objeto con un valor de calorías de ${obj.calories} en lugar del valor esperado (120).');
    }

    if (obj.milligramsOfSodium != 200) {
      errores.add(
          'Se llamó a Recipe([\'1 huevo\', \'Pizca de mantequilla\', \'Pizca de sal\'], 120, 200) \n y se obtuvo un objeto con un valor de miligramos de sodio de ${obj.milligramsOfSodium} en lugar del valor esperado (200).');
    }
  } catch (e) {
    print(
        'Se intentó llamar a Recipe([\'1 huevo\', \'Pizca de mantequilla\', \'Pizca de sal\'], 120, 200) \n y se recibió un nulo.');
  }

  if (errores.isEmpty) {
    print('¡Éxito!');
  } else {
    errores.forEach(print);
  }
}
