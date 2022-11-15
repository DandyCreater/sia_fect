part of 'nredata_bloc.dart';

abstract class NredataEvent extends Equatable {
  const NredataEvent();

  @override
  List<Object> get props => [];
}

class FetchNreData extends NredataEvent {}
