import 'package:task/src/domain/models/user.dart';
import 'package:task/src/domain/repository/repository.dart';
import 'package:task/src/domain/service/network_service.dart';

class RepositoryImpl implements Repository {
  final NetworkService networkService;

  RepositoryImpl(this.networkService);

  @override
  Future<List<User>> getInfo() async => await networkService.getInfo();
}
