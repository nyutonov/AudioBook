import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../data/source/remote/firebase/shared_preference_service.dart';
import '../../../utills/constants/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _appRepository = appRepository;

  LoginBloc() : super(LoginState()) {
    on<SignInGoogle>((event, emit) async {
      User? user = await _appRepository.signInGoogle();

      if (user != null) {
        await SharedPreferenceService.setUser(user);
        await SharedPreferenceService.getUser();

        emit(state.copyWith(
          status: Status.SUCCESS
        ));
      } else {
        emit(state.copyWith(
            status: Status.ERROR
        ));
      }
    });
  }
}