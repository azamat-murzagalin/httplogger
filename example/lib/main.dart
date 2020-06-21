
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:httplogger/LoggerClient.dart';
import 'package:http/http.dart';
import 'package:httplogger/ResponseListWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final client = LoggerClient.wrap(Client());

  await client.get('https://www.googleapis.com/books/v1/volumes?q={http}');

  runApp (
      MaterialApp (
        home: ResponseListWidget(client)
      )
  );
}
