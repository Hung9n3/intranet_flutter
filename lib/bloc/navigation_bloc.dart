import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petaverse/UI/FoodPicking/food_picking_page.dart';
import 'package:petaverse/UI/GameHub/game_hub_page.dart';
import 'package:petaverse/UI/HomePage/home_page.dart';

// enum NavigationEvents {
//   homePageClickedEvent,
//   foodPickingClickedEvent,
//   gameHubClickedEvent
// }
class homePageClickedEvent extends NavigationEvents {}

class foodPickingClickedEvent extends NavigationEvents {}

abstract class NavigationStates {}

abstract class NavigationEvents {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final VoidCallback onMenuTap;
  final GlobalKey<NavigatorState> navigatorKey;
  NavigationBloc(NavigationStates initialState,
      {required this.onMenuTap, required this.navigatorKey})
      : super(initialState) {
    on<homePageClickedEvent>(
      (event, emit) async {
        emit(HomePage(onMenuTap: onMenuTap));
      },
    );
    on<foodPickingClickedEvent>(
      (event, emit) async {
        emit(FoodPicking(onMenuTap: onMenuTap));
      },
    );
  }

  NavigationStates get initialState => HomePage(
        onMenuTap: onMenuTap,
      );

  // Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
  //   switch (event) {
  //     case NavigationEvents.homePageClickedEvent:
  //       yield HomePage(
  //         onMenuTap: onMenuTap,
  //       );
  //       break;
  //     case NavigationEvents.foodPickingClickedEvent:
  //       yield FoodPicking(
  //         onMenuTap: onMenuTap,
  //       );
  //       break;
  //     case NavigationEvents.gameHubClickedEvent:
  //       yield GameHub(
  //         onMenuTap: onMenuTap,
  //       );
  //       break;
  //   }
  // }
}
