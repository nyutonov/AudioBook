part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class Init extends HomeEvent {
  final bool isRefresh;

  Init(this.isRefresh);
}