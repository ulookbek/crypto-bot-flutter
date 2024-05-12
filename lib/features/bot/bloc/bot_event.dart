part of './bot_bloc.dart';

abstract class BotsEvent extends Equatable {}

class LoadBotsList extends BotsEvent {
  LoadBotsList({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class DeleteBot extends BotsEvent {
  DeleteBot({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
