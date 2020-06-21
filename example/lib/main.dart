
import 'package:flutter/material.dart';
import 'package:http_ui_logger/LoggerClient.dart';
import 'package:http/http.dart';
import 'package:http_ui_logger/ResponseListWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final client = LoggerClient.wrap(Client());

  await client.get('https://www.googleapis.com/books/v1/volumes?q={http}');
  await client.get('https://www.googleapis.com/books/v1/volumes?q={dart}');

  runApp (
      MaterialApp (
        home: ResponseListWidget(client)
      )
  );
}
