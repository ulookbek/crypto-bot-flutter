import 'dart:async';
import 'package:admin/repositories/api_key/api_key.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './api_key_event.dart';
part './api_key_state.dart';

class ApiKeyBloc extends Bloc<ApiKeyEvent, ApiKeyState> {
  ApiKeyBloc() : super(ApiKeyInitial()) {
    on<LoadApiKeysList>(_load);
  }

  Future<void> _load(
    LoadApiKeysList event,
    Emitter<ApiKeyState> emit,
  ) async {
    try {
      if (state is! ApiKeyLoaded) {
        emit(ApiKeyLoading());
      }
      final apiKeysList = await ApiKeyRepository().getApiKeysList();
      emit(ApiKeyLoaded(apiKeysList: apiKeysList));
    } catch (e) {
      emit(ApiKeyLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
