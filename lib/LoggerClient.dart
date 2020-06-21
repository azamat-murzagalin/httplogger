
import 'dart:convert';

import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:httplogger/LoggableResponse.dart';
import 'package:httplogger/ResponseDataSource.dart';

abstract class LoggerClient implements Client {

  ResponseDataSource dataSource;

  static Client client() {
    return LoggerClientWrapper(Client());
  }

  static Client wrap(Client client) {
    return LoggerClientWrapper(client);
  }
}

class LoggerClientWrapper extends LoggerClient {

  Client _client;

  LoggerClientWrapper(this._client) {
    dataSource = ResponseDataSourceImpl();
  }

  @override
  void close() => _client.close();

  @override
  Future<Response> delete(url, {Map<String, String> headers}) {
    return _client.delete(url, headers: headers).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    return _client.get(url, headers: headers).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    return _client.head(url, headers: headers).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> patch(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _client.patch(url, headers: headers, body: body, encoding: encoding).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _client.post(url, headers: headers, body: body, encoding: encoding).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> put(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _client.put(url, headers: headers, body: body, encoding: encoding).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<String> read(url, {Map<String, String> headers}) {
    return _client.read(url, headers: headers);
  }

  @override
  Future<Uint8List> readBytes(url, {Map<String, String> headers}) {
    return _client.readBytes(url, headers: headers);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) => _client.send(request);

}
