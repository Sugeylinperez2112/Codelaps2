String stringify(int x, int y) {
  return '$x $y';
}

void main() {
  assert(stringify(2, 3) == '2 3',
      "Tu método convertirEnCadena devolvió '${stringify(2, 3)}' en lugar de '2 3'");
  print('Exito!  | ${2} | - | ${3}|');
}
