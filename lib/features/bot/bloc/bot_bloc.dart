import 'dart:async';
import 'package:admin/repositories/bot/bot_repository.dart';
import 'package:admin/repositories/bot/models/Bot.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './bot_event.dart';
part './bot_state.dart';

class BotBloc extends Bloc<BotsEvent, BotsState> {
  BotBloc() : super(BotsInitial()) {
    on<LoadBotsList>(_load);
  }

  Future<void> _load(
    LoadBotsList event,
    Emitter<BotsState> emit,
  ) async {
    try {
      if (state is! BotsLoaded) {
        emit(BotsLoading());
      }
      final botsList = await BotRepository().getBotsList();
      emit(BotsLoaded(botsList: botsList));
    } catch (e) {
      emit(BotsLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
