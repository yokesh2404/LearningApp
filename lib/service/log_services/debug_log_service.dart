import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:logger/logger.dart';
import 'dart:developer' as developer;

class DebugLogService extends LogService {
  DebugLogService({Logger? logger}) {
    _logger = logger ??
        Logger(
          printer: PrefixPrinter(
            PrettyPrinter(
              methodCount: 0,
              errorMethodCount: 500,
              lineLength: 100,
            ),
          ),
          output: _MyConsoleOutput(),
        );
  }
  late final Logger _logger;
  @override
  void e(String message, dynamic e, StackTrace? stack) {
    _logger.e(message, error: e, stackTrace: stack);
  }

  @override
  void i(String message) {
    _logger.i(message);
  }

  @override
  void w(String message, [e, StackTrace? stack]) {
    _logger.w(message, error: e, stackTrace: stack);
  }
}

class _MyConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(developer.log);
  }
}
