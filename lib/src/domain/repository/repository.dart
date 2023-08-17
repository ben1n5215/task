import 'package:task/src/domain/models/user.dart';

abstract class Repository {
  Future<List<User>> getInfo();
}
