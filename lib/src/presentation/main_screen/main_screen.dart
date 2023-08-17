import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/get_it.dart';
import 'package:task/src/domain/repository/repository.dart';
import 'package:task/src/presentation/main_screen/cubit/main_cubit.dart';
import 'package:task/src/presentation/main_screen/main_layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MainCubit(getIt<Repository>()),
        child: const MainLayout());
  }
}
