import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_fect/core/model/login_response_model.dart';
import 'package:sia_fect/data/remote/api_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<FetchLogin>((event, emit) async {
      ApiServices apiServices = ApiServices();
      emit(LoginLoading());
      try {
        final response = await apiServices.login(
            username: event.username!, password: event.password!);

        LoginResponseModel result =
            LoginResponseModel.fromJson(jsonDecode(response));

        if (result.error != true) {
          emit(LoginDispose());
          emit(LoginSuccess(value: result));
        } else {
          emit(LoginFailed(messages: result.message));
        }
      } catch (e) {
        emit(LoginFailed(messages: e.toString()));
      }
    });
  }
}
