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

class NredataListSuccess extends NredataState {
  final DataResponseModel? value;

  const NredataListSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class NredataListFailed extends NredataState {
  final String? message;

  const NredataListFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
