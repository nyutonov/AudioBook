part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ChangeSwitch extends ProfileEvent {
  final bool value;

  ChangeSwitch(this.value);
}