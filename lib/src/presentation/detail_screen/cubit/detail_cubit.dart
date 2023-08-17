import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/domain/repository/repository.dart';
import 'package:task/src/presentation/detail_screen/cubit/detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this.repository) : super(InitialDetailState());

  final Repository repository;

  void getInfo() async {
    late final info;

    emit(LoadingDetailState());
    try {
      info = await repository.getInfo();
      emit(LoadedDetailState(info));
    } catch (error) {
      emit(ErrorDetailState(error));
    }
  }
}
