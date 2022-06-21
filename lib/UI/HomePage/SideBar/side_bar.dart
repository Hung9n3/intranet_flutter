import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:petaverse/UI/HomePage/SideBar/nav_bar_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

List<bool> selected = [true, false, false, false, false];

class _SideBarState extends State<SideBar> {
  List<IconData> icon = [
    Feather.wind,
    Feather.folder,
    Feather.monitor,
    Feather.lock,
    Feather.mail,
  ];

  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      width: 101.0,
      decoration: BoxDecoration(
        color: const Color(0xff332A7C),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 110,
            child: Column(
              children: icon
                  .map(
                    (e) => NavBarItem(
                      icon: e,
                      selected: selected[icon.indexOf(e)],
                      onTap: () {
                        setState(() {
                          select(icon.indexOf(e));
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
