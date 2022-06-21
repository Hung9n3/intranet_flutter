import 'package:flutter/material.dart';
import 'package:petaverse/bloc/navigation_bloc.dart';

class GameHub extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  GameHub({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  State<GameHub> createState() => _GameHubState();
}

class _GameHubState extends State<GameHub> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
