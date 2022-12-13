part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int count1;
  final int count2;

  const HomeState({
    this.count1 = 0,
    this.count2 = 0,
  });

  HomeState copyWith({
    int? count1,
    int? count2,
  }) {
    return HomeState(
      count1: count1 ?? this.count1,
      count2: count2 ?? this.count2,
    );
  }

  @override
  List<Object> get props => [
        count1,
        count2,
      ];
}
