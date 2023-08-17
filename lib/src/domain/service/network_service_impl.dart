import 'dart:convert';
import 'package:http/http.dart';
import 'package:task/src/domain/models/user.dart';
import 'package:task/src/domain/service/network_service.dart';

class NetworkServiceImpl implements NetworkService {
  @override
  Future<List<User>> getInfo() async {
    final url = Uri.parse('https://reqres.in/api/users?page=2');
    final response = await get(url);
    final jsonData = json.decode(response.body);

    List<User> users = [];

    for (var userData in jsonData['data']) {
      User user = User(
        id: userData['id'],
        email: userData['email'],
        firstName: userData['first_name'],
        avatar: userData['avatar'],
        lastName: userData['last_name'],
      );
      users.add(user);
    }

    return users;
  }
}
