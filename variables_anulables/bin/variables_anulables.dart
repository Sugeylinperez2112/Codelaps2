//Se ejecute todo bien y de Success!
String? name = 'Jane';
String? address = 'null';

//Se realice las variables nulas
String? name1;
String? address1;

void main() {
  try {
    if (name == 'Jane' && address == 'null') {
      name = null;
      print('Ejemplo 1');
      print('-----------');
      print('Success!');
      print('-----------');
    } else {
      print('No todo bien, intenta de nuevo');
    }
  } catch (e) {
    print('Error: $e');
  }

  try {
    if (name1 == 'Jane' && address1 == 'null') {
      name1 = null;
      print('Success!');
    } else {
      print('Ejemplo 2');
      print('-----------');
      print('No todo bien, intenta de nuevo');
      print('-----------');
    }
  } catch (e) {
    print('Error: $e');
  }
}
