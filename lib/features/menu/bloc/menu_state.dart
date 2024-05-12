part of './menu_bloc.dart';

abstract class MenuState {}

class MenuInitial extends MenuState {}
class CurrentPageState extends MenuState {
  final Widget currentPage;
  CurrentPageState(this.currentPage);
}

class DrawerOpenedState extends MenuState {}
