import 'package:amazonui/screens/home_screen/home_screen.dart';
import 'package:amazonui/screens/nav_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  //Animation Controller
  late final AnimationController _animationController;

  //Scale animation for the home screen
  late final Animation<double> _scaleAnimation;

  //Transform animation for the home screen
  late final Animation<Offset> _translateAnimation;

  //Rotation animation for the home screen
  late final Animation<double> _rotateAnimation;

  final Curve curve = Curves.fastOutSlowIn;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.85,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: curve,
      ),
    );

    _translateAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0.65, 0.05),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: curve,
      ),
    );

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: -0.015,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: curve,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void handleMenu() {
    if (showMenu) {
      _animationController.forward();
      showMenu = false;
    } else {
      _animationController.reverse();
      showMenu = true;
    }

    setState(() {});
  }

  bool showMenu = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white60,
              child: NavScreen(),
            ),
          ),
          ScaleTransition(
            scale: _scaleAnimation,
            child: SlideTransition(
              position: _translateAnimation,
              child: RotationTransition(
                alignment: Alignment.topCenter,
                turns: _rotateAnimation,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: HomeScreen(
                    showMenu: showMenu,
                    onPressed: handleMenu,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
