// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sia_fect/core/model/data_response_model.dart';
import 'package:sia_fect/core/model/login_response_model.dart';
import 'package:sia_fect/data/remote/api_services.dart';

part 'nredata_event.dart';
part 'nredata_state.dart';

class NredataBloc extends Bloc<NredataEvent, NredataState> {
  NredataBloc() : super(NredataInitial()) {
    on<FetchNreData>((event, emit) async {
      ApiServices apiServices = ApiServices();
      final storage = const FlutterSecureStorage();
      emit(NredataLoading());

      String? storageData = await storage.read(
          key: 'loginKey', aOptions: AndroidOptions.defaultOptions);

      var decodeData = jsonDecode(storageData!);
      var jsonData = LoginResponseModel.fromJson(jsonDecode(decodeData));

      try {
        final response = await apiServices.loadDataFromNRE(
            nre: jsonData.nre!, nudep: jsonData.nudep.toString());

        DataResponseModel result =
            DataResponseModel.fromJson(jsonDecode(jsonEncode(response)));

        await storage.write(
            key: 'nreValue',
            value: jsonEncode(result),
            aOptions: AndroidOptions.defaultOptions);

        if (response != null) {
          emit(NredataSuccess(value: result));
        } else {
          emit(const NredataFailed(message: "Failed Fetch NRE DATA"));
        }
      } catch (e) {
        emit(NredataFailed(message: "BLOC DATA ERROR $e"));
      }
    });
  }
}
