import 'package:get_it/get_it.dart';
import 'package:task/src/domain/repository/repository.dart';
import 'package:task/src/domain/repository/repository_impl.dart';
import 'package:task/src/domain/service/network_service.dart';
import 'package:task/src/domain/service/network_service_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  NetworkService service = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(service);
  getIt.registerSingleton<Repository>(RepositoryImpl(service));
}
