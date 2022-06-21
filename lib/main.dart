import 'package:flutter/material.dart';
import 'package:petaverse/Model/Status/user_status.dart';
import 'package:petaverse/Model/User/user.dart';
import 'package:petaverse/UI/HomePage/home_page.dart';
import 'package:petaverse/UI/LoginPage/login_page.dart';
import './Model/Table/table_model.dart';
import 'Model/pet.dart';
import 'package:get/get.dart';

import 'UI/HomePage/ShiftingMenu/dashborad_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: '/home', page: () => const MenuDashboardLayout()),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Controller extends GetxController {
  var value = "";
  increment(String newValue) => value = newValue;
}

class _MyHomePageState extends State<MyHomePage> {
  var seen = <String>{};
  String dropDownValue = 'Canada';
  List<String> countries = [
    "Canada",
    "Russia",
    "USA",
    "China",
    "United Kingdom",
    "USA",
    "India"
  ];
  List<String> uniquelist = [];
  List<Pet> pets = [Pet('', '', '', 5), Pet('name', 'id', 'department', 4)];
  List<User> users = [User('', '', ''), User('id', 'name', 'avatarUrl')];
  List<Status> statuses = [
    Status('title', 'id', 'topic', 'content', 'postingTime',
        User('id', 'name', 'avatarUrl')),
    Status('title2', 'id2', 'topic2', 'content2', 'postingTime2',
        User('id2', 'name2', 'avatarUrl2'))
  ];
  Widget getContent() {
    final Controller c = Get.put(Controller());
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SingleChildScrollView(
          child: Container(
        height: 500.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          const Text('Dialog'),
          SampleComponent.searchField(context),
          DropdownButton(
            value: dropDownValue,
            onChanged: (country) {
              setState(() {
                dropDownValue = c.increment(country.toString());
              });
            },
            items: uniquelist.map((country) {
              return DropdownMenuItem(
                child: Text(country),
                value: country,
              );
            }).toList(),
          )
        ]),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    uniquelist = countries.where((country) => seen.add(country)).toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

        // body: Center(
        //     child: TextButton(
        //         child: const Text("abcdefgh"),
        //         onPressed: () {
        //           SampleComponent.dynamicDialog(
        //               getContent(), context, () => null, "route", "title");
        //         })),
        body: Center(child: LoginPage.loginPage(context, height, width)));
  }
}
