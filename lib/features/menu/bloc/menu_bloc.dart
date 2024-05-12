import 'package:admin/features/bot/widgets/add_bot_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part './menu_event.dart';
part './menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _currentPage = AddBotScreen();

  MenuBloc() : super(MenuInitial()) {
    on<MenuEvent>((event, emit) {});

    on<OpenDrawerEvent>((event, emit) {
      if (!scaffoldKey.currentState!.isDrawerOpen) {
        scaffoldKey.currentState!.openDrawer();
        emit(DrawerOpenedState());
      }
    });

    on<SetCurrentPageEvent>((event, emit) {
      _currentPage = event.page;
      emit(CurrentPageState(_currentPage));
    });
  }
}

// class MenuBloc extends Bloc<MenuEvent, MenuState> {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   Widget _currentPage = AddBotScreen();

//   MenuBloc() : super(CurrentPageState(AddBotScreen())) {
//     on<OpenDrawerEvent>((event, emit) {
//       if (!scaffoldKey.currentState!.isDrawerOpen) {
//         scaffoldKey.currentState!.openDrawer();
//         emit(DrawerOpenedState());
//       }
//     });

//     on<SetCurrentPageEvent>((event, emit) {
//       _currentPage = event.page;
//       emit(CurrentPageState(_currentPage));
//     });
//   }
// }
