import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/get_it.dart';
import 'package:task/src/domain/models/user.dart';
import 'package:task/src/domain/repository/repository.dart';
import 'package:task/src/presentation/detail_screen/cubit/detail_cubit.dart';
import 'package:task/src/presentation/detail_screen/detail_layout.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailCubit(getIt<Repository>()),
      child: DetailLayout(
        user: user,
      ),
    );
  }
}
