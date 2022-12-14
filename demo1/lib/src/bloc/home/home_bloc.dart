import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo1/src/models/product.dart';
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
    on<HomeEvent_Fetch>((event, emit) {});

    // Toggle display mode (list and grid)
    on<HomeEvent_toggleDisplay>((event, emit) {});
  }
}
