typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// Llama a logException para registrar una excepción y a doneLogging cuando hayas terminado.
abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  try {
    untrustworthy();
  } on ExceptionWithMessage catch (e) {
    logger.logException(e.runtimeType, e.message);
  } on Exception {
    logger.logException(Exception);
  } finally {
    logger.doneLogging();
  }
}

// Pruebas de tu solución (¡No edites!):
class MyLogger extends Logger {
  Type? lastType;
  String lastMessage = '';
  bool done = false;

  @override
  void logException(Type t, [String? message]) {
    lastType = t;
    lastMessage = message ?? lastMessage;
  }

  @override
  void doneLogging() => done = true;
}

void main() {
  final errs = <String>[];
  var logger = MyLogger();

  try {
    tryFunction(() => throw Exception(), logger);

    if ('${logger.lastType}' != 'Exception' &&
        '${logger.lastType}' != '_Exception') {
      errs.add(
          'Untrustworthy lanzó una Exception, pero se registró un tipo diferente: \n ${logger.lastType}.');
    }

    if (logger.lastMessage != '') {
      errs.add(
          'Untrustworthy lanzó una Exception sin mensaje, pero se registró un mensaje de todos modos: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add(
          'Untrustworthy lanzó una Exception, \n y doneLogging() no fue llamado posteriormente.');
    }
  } catch (e) {
    print(
        'Untrustworthy lanzó una excepción, y una excepción de tipo \n ${e.runtimeType} no fue manejada por tryFunction.');
  }

  logger = MyLogger();

  try {
    tryFunction(() => throw ExceptionWithMessage('¡Hey!'), logger);

    if (logger.lastType != ExceptionWithMessage) {
      errs.add(
          'Untrustworthy lanzó una ExceptionWithMessage(\'¡Hey!\'), pero se registró un \n tipo diferente: ${logger.lastType}.');
    }

    if (logger.lastMessage != '¡Hey!') {
      errs.add(
          'Untrustworthy lanzó una ExceptionWithMessage(\'¡Hey!\'), pero se registró \n un mensaje diferente: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add(
          'Untrustworthy lanzó una ExceptionWithMessage(\'¡Hey!\'), \n y doneLogging() no fue llamado posteriormente.');
    }
  } catch (e) {
    print(
        'Untrustworthy lanzó una ExceptionWithMessage(\'¡Hey!\'), \n y una excepción de tipo ${e.runtimeType} no fue manejada por tryFunction.');
  }

  logger = MyLogger();
  bool caughtStringException = false;

  try {
    tryFunction(() => throw 'A String', logger);
  } on String {
    caughtStringException = true;
  }

  if (!caughtStringException) {
    errs.add(
        'Untrustworthy lanzó una cadena, y fue manejada incorrectamente dentro de tryFunction().');
  }

  logger = MyLogger();

  try {
    tryFunction(() {}, logger);

    if (logger.lastType != null) {
      errs.add(
          'Untrustworthy no lanzó una Exception, \n pero de todos modos se registró uno: ${logger.lastType}.');
    }

    if (logger.lastMessage != '') {
      errs.add(
          'Untrustworthy no lanzó una Exception sin mensaje, \n pero se registró un mensaje de todos modos: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add(
          'Untrustworthy no lanzó una Exception, \n pero doneLogging() no fue llamado posteriormente.');
    }
  } catch (e) {
    print(
        'Untrustworthy no lanzó una excepción, \n pero una excepción de tipo ${e.runtimeType} no fue manejada por tryFunction.');
  }

  if (errs.isEmpty) {
    print('¡Éxito!');
  } else {
    errs.forEach(print);
  }
}
