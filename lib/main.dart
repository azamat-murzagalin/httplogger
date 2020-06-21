
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:httplogger/LoggerClient.dart';
import 'package:httplogger/ResponseListWidget.dart';

void main(List<String> arguments) async {

  final client = LoggerClient.wrap(Client());

  await client.get('https://www.googleapis.com/books/v1/volumes?q={http}');

  runApp (
    ResponseListWidget(client)
  );
}
