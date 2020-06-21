
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_ui_logger/src/LoggableResponse.dart';
import 'package:http_ui_logger/LoggerClient.dart';
import 'package:http_ui_logger/src/ResponseWidget.dart';

class ResponseListWidget extends StatefulWidget {

  LoggerClient _client;

  ResponseListWidget(this._client);

  @override
  _ResponseListState createState() => _ResponseListState();
}


class _ResponseListState extends State<ResponseListWidget> {

  List<LoggableResponse> _responses = [];

  @override
  void initState() {
    super.initState();
    _loadResponses();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder(
          itemBuilder: (context, position) {
            return InkWell (
              onTap: () => _showDetails(_responses[position]),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(_responses[position].shortDescription()),
                ),
              ),
            );
          },
          itemCount: _responses.length,
        )
    );
  }

  _showDetails(LoggableResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResponseWidget(response))
    );
  }

  _loadResponses() async {
    final responses = await widget._client.dataSource.get();
    setState(() {
      _responses = responses.reversed.toList(growable: false);
    });
  }

}
