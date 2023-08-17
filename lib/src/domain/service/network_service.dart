import 'package:task/src/domain/models/user.dart';

abstract class NetworkService {
  Future<List<User>> getInfo();
}
