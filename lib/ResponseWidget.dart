


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_ui_logger/LoggableResponse.dart';

class ResponseWidget extends StatelessWidget{

  LoggableResponse _response;

  ResponseWidget(this._response);

  @override
  Widget build(BuildContext context) {
    final response = _response.longDescription();

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SelectableText(response),
          ),
        )
    );
  }
}

