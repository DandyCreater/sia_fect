part of 'nredata_bloc.dart';

abstract class NredataState extends Equatable {
  const NredataState();

  @override
  List<Object> get props => [];
}

class NredataInitial extends NredataState {}

class NredataLoading extends NredataState {}

class NredataSuccess extends NredataState {
  final DataResponseModel? value;

  const NredataSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class NredataFailed extends NredataState {
  final String? message;

  const NredataFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
