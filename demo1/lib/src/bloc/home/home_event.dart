part of 'home_bloc.dart';


class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeEventAdd extends HomeEvent{}
class HomeEventRemove extends HomeEvent{}
class HomeEventReset extends HomeEvent{}

// Fetch Product Event
class HomeEvent_Fetch extends HomeEvent{}
class HomeEvent_toggleDisplay extends HomeEvent{}