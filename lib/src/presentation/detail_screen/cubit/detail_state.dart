import 'package:task/src/domain/models/user.dart';

abstract class DetailState {}

class InitialDetailState extends DetailState {}

class LoadingDetailState extends DetailState {}

class LoadedDetailState extends DetailState {
  final List<User> infoList;

  LoadedDetailState(this.infoList);
}

class SuccessDetailState extends DetailState {}

class ErrorDetailState extends DetailState {
  ErrorDetailState(this.error);

  final Object error;
}
