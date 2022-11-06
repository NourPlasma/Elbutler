import 'package:dio/dio.dart';
import 'network_config.dart';

class ApiController {
  NetworkConfig? _networkConfig;

  ApiController() {
    _networkConfig = NetworkConfig();
  }

  onClearCash() {
    _networkConfig!.clearCacheOptions();
  }

  //  Users
  Future<Response> onUsers({
    required String page,
    required String limit,
  }) {
    var header = <String, String>{};
    var query = <String, String>{'page': page, 'limit': limit};

    return _networkConfig!
        .get(url: 'users', headers: header, query: query, cash: false);
  }

  //  Add User
  Future<Response> onAddUser() {
    var header = <String, String>{};
    var body = <String, dynamic>{};
    var query = <String, String>{};

    return _networkConfig!.post(
        url: 'users', headers: header, body: body, query: query, cash: false);
  }

  //  Edit User
  Future<Response> onEditUser() {
    var header = <String, String>{};
    var body = <String, dynamic>{};
    var query = <String, String>{};
    return _networkConfig!.put(
        url: 'users', headers: header, body: body, query: query,);
  }
}
