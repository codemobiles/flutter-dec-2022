part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({required this.currentPosition});

  final LatLng currentPosition;

  MapState copyWith(LatLng newPosition){
    return MapState(currentPosition: newPosition);
}

  @override
  List<Object> get props => [currentPosition];
}
