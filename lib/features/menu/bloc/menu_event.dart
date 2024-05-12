part of './menu_bloc.dart';

abstract class MenuEvent {}

class OpenDrawerEvent extends MenuEvent {}

class SetCurrentPageEvent extends MenuEvent {
  final Widget page;
  SetCurrentPageEvent(this.page);
}
