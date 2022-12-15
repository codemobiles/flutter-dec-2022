part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => [];
}

class MapEvent_SubmitLocation extends MapEvent{
  final LatLng position;
  MapEvent_SubmitLocation({required this.position});
}