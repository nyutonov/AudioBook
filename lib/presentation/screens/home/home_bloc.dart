import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/book_model.dart';
import '../../../data/model/category_model.dart';
import '../../../utills/constants/utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _appRepository = appRepository;

  HomeBloc() : super(HomeState()) {
    on<Init>((event, emit) async {
      try {
        emit(state.copyWith(
            status: Status.LOADING
        ));

        var categories = await _appRepository.getAllCategories(event.isRefresh);
        var books = await _appRepository.getAllBooks(event.isRefresh);

        emit(state.copyWith(
          categories: categories,
          books: books,
          status: Status.SUCCESS
        ));
      } catch (e) {
        emit(state.copyWith(
            status: Status.ERROR
        ));
      }
    });
  }
}
