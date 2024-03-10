import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<ChangeSwitch>((event, emit) {
      emit(state.copyWith(
        switchValue: event.value
      ));
    });
  }
}
