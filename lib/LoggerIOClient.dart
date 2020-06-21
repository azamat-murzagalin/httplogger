
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:httplogger/LoggableResponse.dart';
import 'package:httplogger/LoggerClient.dart';


class LoggerIOClient extends IOClient with LoggerClient {

  @override
  Future<Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    return super.post(url, headers: headers, body: body, encoding: encoding).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> delete(url, {Map<String, String> headers}) {
    return super.delete(url, headers: headers).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    return super.get(url, headers: headers).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    return super.head(url, headers: headers).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> patch(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.patch(url, headers: headers, body: body, encoding: encoding).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }

  @override
  Future<Response> put(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.put(url, headers: headers, body: body, encoding: encoding).then((response) {
      dataSource.save(HttpLoggableResponse(response));
      return Future.value(response);
    });
  }
}
