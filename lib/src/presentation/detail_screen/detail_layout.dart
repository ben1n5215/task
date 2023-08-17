import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/domain/models/user.dart';
import 'package:task/src/presentation/detail_screen/cubit/detail_cubit.dart';
import 'package:task/src/presentation/detail_screen/cubit/detail_state.dart';

class DetailLayout extends StatefulWidget {
  const DetailLayout({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<DetailLayout> createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  @override
  void initState() {
    context.read<DetailCubit>().getInfo();
    super.initState();
  }

  static const fontSize = 18.0;
  static const elevation = 32.0;
  static const widthOfCard = 400.0;
  static const heightOfCard = 400.0;
  static const radiusOfAvatar = 44.0;

  static const space = SizedBox(height: 4);
  static const padding = EdgeInsets.all(8.0);
  static const spaceBetween = SizedBox(width: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
            child: BlocConsumer<DetailCubit, DetailState>(
          listener: (context, state) {
            if (state is ErrorDetailState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.error}'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingDetailState) {
              return const CircularProgressIndicator();
            } else if (state is LoadedDetailState) {
              return Center(
                child: SizedBox(
                  width: widthOfCard,
                  height: heightOfCard,
                  child: Card(
                    elevation: elevation,
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: padding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(widget.user.avatar!),
                            radius: radiusOfAvatar,
                          ),
                          spaceBetween,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID: ${widget.user.id}",
                                style: const TextStyle(fontSize: fontSize),
                              ),
                              space,
                              Text(
                                "Full Name: ${widget.user.firstName} ${widget.user.lastName}",
                                style: const TextStyle(fontSize: fontSize),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        )));
  }
}
