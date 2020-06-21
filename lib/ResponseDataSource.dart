
import 'dart:convert';

import 'package:httplogger/LoggableResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ResponseDataSource {
  Future<void> save(LoggableResponse response);
  Future<List<LoggableResponse>> get();
}

class ResponseDataSourceImpl implements ResponseDataSource {

  String _key = "LOCAL_RESPONSES_KEY";
  SharedPreferences _storage;
  List<LoggableResponse> _cached = [];

  @override
  Future<List<LoggableResponse>> get() async {
    if (_cached.isNotEmpty) return _cached;
    await _initStorageIfNeeded();
    return _cached;
  }

  @override
  save(LoggableResponse response) async {
    await _initStorageIfNeeded();
    _cached.add(response);
    await _storage.setStringList(_key, _cached.map((e) => jsonEncode(e)).toList(growable: false));
  }


  _initStorageIfNeeded() async {
    if (_storage == null) {
      _storage = await SharedPreferences.getInstance();
      final json = _storage.getStringList(_key);
      if (json != null) {
        _cached = json.map((e) => HttpLoggableResponse.fromJson(jsonDecode(e))).toList(growable: true);
      }
    }
  }
}
