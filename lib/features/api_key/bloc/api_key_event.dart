part of './api_key_bloc.dart';

abstract class ApiKeyEvent extends Equatable {}

class LoadApiKeysList extends ApiKeyEvent {
  LoadApiKeysList({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
