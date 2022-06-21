import 'package:flutter/material.dart';
import 'package:petaverse/UI/HomePage/SideBar/curve_painter.dart';

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final Function onTap;
  final bool selected;
  const NavBarItem({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.selected,
  }) : super(key: key);
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  late Animation<double> _anim1;
  late Animation<double> _anim2;
  late Animation<double> _anim3;
  late Animation<Color?> _color;

  bool hovered = false;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 275),
    );

    _anim1 = Tween(begin: 101.0, end: 75.0).animate(_controller1);
    _anim2 = Tween(begin: 101.0, end: 25.0).animate(_controller2);
    _anim3 = Tween(begin: 101.0, end: 50.0).animate(_controller2);
    _color =
        ColorTween(end: Colors.blue, begin: Colors.white).animate(_controller2);

    _controller1.addListener(() {
      setState(() {});
    });
    _controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(NavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.selected) {
      Future.delayed(const Duration(milliseconds: 10), () {
        //_controller1.reverse();
      });
      _controller1.reverse();
      _controller2.reverse();
    } else {
      _controller1.forward();
      _controller2.forward();
      Future.delayed(const Duration(milliseconds: 10), () {
        //_controller2.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (value) {
          setState(() {
            hovered = false;
          });
        },
        child: Container(
          width: 101.0,
          color:
              hovered && !widget.selected ? Colors.white12 : Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                child: CustomPaint(
                  painter: CurvePainter(
                    value1: 0,
                    animValue1: _anim3.value,
                    animValue2: _anim2.value,
                    animValue3: _anim1.value,
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
                width: 101.0,
                child: Center(
                  child: Icon(
                    widget.icon,
                    color: _color.value,
                    size: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
