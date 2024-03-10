part of 'profile_bloc.dart';

class ProfileState {
  bool? switchValue;

  ProfileState({
    this.switchValue
  });

  ProfileState copyWith({
    bool? switchValue
  }) => ProfileState(
    switchValue: switchValue ?? this.switchValue
  );
}