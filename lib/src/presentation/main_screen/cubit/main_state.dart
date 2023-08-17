import 'package:task/src/domain/models/user.dart';

abstract class MainState {}

class InitialMainState extends MainState {}

class LoadingMainState extends MainState {}

class LoadedMainState extends MainState {
  final List<User> infoList;

  LoadedMainState(this.infoList);
}

class SuccessMainState extends MainState {}

class ErrorMainState extends MainState {
  ErrorMainState(this.error);

  final Object error;
}
