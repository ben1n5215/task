import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/domain/repository/repository.dart';
import 'package:task/src/presentation/main_screen/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.repository) : super(InitialMainState());

  final Repository repository;

  void getInfo() async {
    late final info;

    emit(LoadingMainState());
    try {
      info = await repository.getInfo();
      emit(LoadedMainState(info));
    } catch (error) {
      emit(ErrorMainState(error));
    }
  }
}
