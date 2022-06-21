import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petaverse/Model/Login%20Model/login_model.dart';

class LoginPage {
  static Widget loginPage(BuildContext context, double height, double width) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 0, 10),
      height: height,
      width: width,
      child: Column(
        children: [
          Lottie.asset(
            'assets/food.json',
            width: width / 1.2,
            height: width / 1.2,
            fit: BoxFit.fill,
          ),
          LoginModel.loginModel(context, height / 2.5, width / 1.2)
        ],
      ),
    );
  }
}
