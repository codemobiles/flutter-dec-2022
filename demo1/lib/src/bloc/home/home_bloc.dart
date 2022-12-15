import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo1/src/models/product.dart';
import 'package:demo1/src/services/api_service.dart';
import 'package:demo1/src/services/network_service.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    // Add
    on<HomeEventAdd>((event, emit) {
      emit(state.copyWith(count1: state.count1 + 1));
    });

    // Remove
    on<HomeEventRemove>((event, emit) {
      emit(state.copyWith(count1: state.count1 - 1));
    });

    // Reset
    on<HomeEventReset>((event, emit) {
      emit(state.copyWith(count1: 0));
    });

    // Load data
    on<HomeEvent_Fetch>((event, emit) async {
      try{
        emit(state.copyWith(status: FetchStatus.fetching, products: []));
        // final result = await ApiService().feed();
        final result = await NetworkService().getProduct();
        emit(state.copyWith(status: FetchStatus.success, products: result));
      }catch(e){
        emit(state.copyWith(status: FetchStatus.failed, products: []));
      }
    });

    // Toggle display mode (list and grid)
    on<HomeEvent_toggleDisplay>((event, emit) {
      emit(state.copyWith(isGrid: !state.isGrid));
    });
  }
}
