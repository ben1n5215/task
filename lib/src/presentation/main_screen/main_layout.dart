import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/presentation/detail_screen/detail_screen.dart';
import 'package:task/src/presentation/main_screen/cubit/main_cubit.dart';
import 'package:task/src/presentation/main_screen/cubit/main_state.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    context.read<MainCubit>().getInfo();
    super.initState();
  }

  static const fontSize = 18.0;
  static const elevation = 32.0;
  static const radiusOfAvatar = 44.0;

  static const space = SizedBox(height: 4);
  static const padding = EdgeInsets.all(8.0);
  static const spaceBetween = SizedBox(width: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is ErrorMainState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.error}'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingMainState) {
              return const CircularProgressIndicator();
            } else if (state is LoadedMainState) {
              return ListView.builder(
                itemCount: state.infoList.length,
                itemBuilder: (context, index) {
                  final user = state.infoList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            user: user,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: elevation,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: padding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar!),
                              radius: radiusOfAvatar,
                            ),
                            spaceBetween,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email: ${user.email}",
                                  style: const TextStyle(fontSize: fontSize),
                                ),
                                space,
                                Text(
                                  "First Name: ${user.firstName}",
                                  style: const TextStyle(fontSize: fontSize),
                                ),
                                space,
                                Text(
                                  "Last Name: ${user.lastName}",
                                  style: const TextStyle(fontSize: fontSize),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
