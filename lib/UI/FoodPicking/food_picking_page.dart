import 'package:flutter/material.dart';
import 'package:petaverse/bloc/navigation_bloc.dart';

class FoodPicking extends StatelessWidget with NavigationStates {
  final VoidCallback onMenuTap;

  const FoodPicking({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.redAccent,
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: const Icon(Icons.menu, color: Colors.white),
                onTap: onMenuTap,
              ),
              const Text("Messages",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              const Icon(Icons.settings, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
