import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../utills/constants/utils.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _appRepository = appRepository;

  RegisterBloc() : super(RegisterState()) {
    on<SignInGoogle>((event, emit) async {
      await _appRepository.signInGoogle();
    });
  }
}
