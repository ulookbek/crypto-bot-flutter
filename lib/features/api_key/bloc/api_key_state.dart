part of './api_key_bloc.dart';

abstract class ApiKeyState extends Equatable {}

class ApiKeyInitial extends ApiKeyState {
  @override
  List<Object?> get props => [];
}

class ApiKeyLoading extends ApiKeyState {
  @override
  List<Object?> get props => [];
}

class ApiKeyLoaded extends ApiKeyState {
  ApiKeyLoaded({
    required this.apiKeysList,
  });

  final List<ApiKeyEntity> apiKeysList;

  @override
  List<Object?> get props => [apiKeysList];
}

class ApiKeyLoadingFailure extends ApiKeyState {
  ApiKeyLoadingFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
