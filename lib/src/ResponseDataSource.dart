
import 'package:http_ui_logger/src/LoggableResponse.dart';

abstract class ResponseDataSource {
  Future<void> save(LoggableResponse response);
  Future<List<LoggableResponse>> get();
}
