
import 'package:http/http.dart';

import 'package:http/http.dart';

abstract class LoggableResponse {
  String shortDescription();
  String longDescription();

  Map<String, dynamic> toJson();
}

class HttpLoggableResponse implements LoggableResponse {

  String _method;
  int _status;
  String _url;
  String _headers;
  String _body;
  String _resultBody;
  String _time;

  HttpLoggableResponse(Response response) {
    final request = response.request;
    _method = request.method;
    _url = request.url.toString();
    _headers = request.headers.toString();
    _resultBody = response.body;
    _status = response.statusCode;
    _body = (request is Request) ? request.body : "EMPTY";
    _time = DateTime.now().toString();
  }

  HttpLoggableResponse.fromJson(Map<String, dynamic> json) {
    _method = json["method"];
    _url = json["url"];
    _headers = json["headers"];
    _resultBody = json["resultBody"];
    _status = json["status"];
    _body = json["body"];
    _time = json["time"];
  }

  @override
  Map<String, dynamic> toJson() {
    final result = Map<String, dynamic>();
    result["method"] = _method;
    result["url"] = _url;
    result["headers"] = _headers;
    result["resultBody"] = _resultBody;
    result["status"] = _status;
    result["body"] = _body;
    result["time"] = _time;
    result["type"] = "http";

    return result;
  }


  @override
  LoggableResponse fromJson() {

  }

  @override
  String shortDescription() {
    return """
    
    $_time
    method: HTTP ${_method.toUpperCase()}
    
    status: $_status
    
    url: $_url
    """;
  }

  @override
  String longDescription() {
    return """
    
    $_time
    method: HTTP ${_method.toUpperCase()}
    
    status: $_status
    
    url: $_url
    
    headers: $_headers
    
    body: $_body
    
    result: $_resultBody""".trim();
  }

}
