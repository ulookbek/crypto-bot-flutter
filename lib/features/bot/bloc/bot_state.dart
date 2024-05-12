part of './bot_bloc.dart';

abstract class BotsState extends Equatable {}

class BotsInitial extends BotsState {
  @override
  List<Object?> get props => [];
}

class BotsLoading extends BotsState {
  @override
  List<Object?> get props => [];
}

class BotsLoaded extends BotsState {
  BotsLoaded({
    required this.botsList,
  });

  final List<BotEntity> botsList;

  @override
  List<Object?> get props => [botsList];
}

class BotsLoadingFailure extends BotsState {
  BotsLoadingFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
