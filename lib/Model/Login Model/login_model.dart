import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginModel {
  static Widget loginModel(BuildContext context, double height, double width) {
    bool isObscure = true;
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    bool isChecked = false;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          height: height,
          width: width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Company Name',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: username,
                  autofocus: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text(
                        'Username',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                TextField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      label: const Text(
                        'Password',
                        style: TextStyle(fontSize: 20),
                      ),
                      prefixIcon: const Icon(Icons.shield),
                      suffixIcon: IconButton(
                        icon: Icon(isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      )),
                ),
                Row(
                  children: [
                    Switch(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    const Text('Remember sign-in'),
                  ],
                ),
                MaterialButton(
                  height: height / 7,
                  minWidth: width,
                  color: const Color.fromRGBO(0, 90, 158, 1),
                  textColor: Colors.white,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Get.toNamed('/home');
                  },
                  splashColor: Colors.redAccent,
                )
              ]),
        ),
      );
    });
  }
}
