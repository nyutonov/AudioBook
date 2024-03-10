import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/model/audio_model.dart';
import '../../../data/model/book_model.dart';
import '../../../utills/constants/utils.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final _appRepository = appRepository;

  NowPlayingBloc() : super(NowPlayingState(player: AudioPlayer(), maxSecond: 0, currentSecond: 0, isPause: false)) {
    on<Init>((event, emit) async {
      var audios = await _appRepository.getAllAudios(event.book?.name ?? '');

      final audioUrl = await _appRepository.downloadAudio(
          event.book?.name ?? '',
          audios[0].id ?? ''
      );

      await state.player?.setUrl(audioUrl);
      final duration = await state.player?.durationFuture;

      final audio = AudioModel(
          id: audios[0].id,
          url: audioUrl,
          duration: duration?.inSeconds
      );

      emit(state.copyWith(
          book: event.book,
          selectedAudio: audio,
          currentSecond: 0,
          maxSecond: duration?.inSeconds,
          audios: audios
      ));

      await state.player?.play();
    });

    on<ChangePositionAudio>((event, emit) async {
      int value = ((state.maxSecond ?? 0) * event.value).toInt();

      await state.player?.seek(Duration(seconds: value));

      emit(state.copyWith(
          currentSecond: value,
      ));
    });

    on<ClickFastRewind>((event, emit) async {
      if ((state.currentSecond ?? 0) >= 10) {
        await state.player?.seek(Duration(seconds: (state.currentSecond ?? 0) - 10));

        emit(state.copyWith(
            currentSecond: (state.currentSecond ?? 0) - 10
        ));
      } else {
        await state.player?.seek(const Duration(seconds: 0));

        emit(state.copyWith(
            currentSecond: 0
        ));
      }
    });

    on<ClickFastForward>((event, emit) async {
      if ((state.currentSecond ?? 0) + 10 <= (state.maxSecond ?? 0)) {
        await state.player?.seek(Duration(seconds: (state.currentSecond ?? 0) + 10));

        emit(state.copyWith(
            currentSecond: (state.currentSecond ?? 0) + 10
        ));
      } else {
        await state.player?.seek(Duration(seconds: state.maxSecond ?? 0));

        emit(state.copyWith(
          currentSecond: state.maxSecond ?? 0
        ));
      }
    });

    on<ClickPauseOrStart>((event, emit) async {
      if (state.isPause ?? false) {
        emit(state.copyWith(
            isPause: false
        ));

        await state.player?.play();
      } else {
        emit(state.copyWith(
          isPause: true
        ));

        await state.player?.pause();
      }
    });

    on<ChangeCurrentSecond>((event, emit) {
      if (!(state.isPause ?? false) && (state.currentSecond ?? 0) < (state.maxSecond ?? 0)) {
        emit(state.copyWith(
          currentSecond: (state.currentSecond ?? 0) + 1
        ));
      }
    });

    on<SelectAudio>((event, emit) async {
      if (event.audio.id == state.selectedAudio?.id) {
        if (state.isPause == false) {
          emit(state.copyWith(
              isPause: true
          ));

          await state.player?.pause();
        } else {
          emit(state.copyWith(
              isPause: false
          ));

          await state.player?.play();
        }
      } else {
        final audioUrl = await _appRepository.downloadAudio(
            state.book?.name ?? '',
            event.audio.id ?? ''
        );

        await state.player?.setUrl(audioUrl);
        final duration = await state.player?.durationFuture;

        final audio = AudioModel(
            id: event.audio.id,
            url: audioUrl,
            duration: duration?.inSeconds
        );

        emit(state.copyWith(
          selectedAudio: audio,
          isPause: false,
          currentSecond: 0,
          maxSecond: duration?.inSeconds,
        ));

        await state.player?.play();
      }
    });

    on<Stop>((event, emit) async {
      emit(state.copyWith(
        isPause: true
      ));

      await state.player?.stop();
    });

    on<ClickSkipPrevious>((event, emit) {
      // Previous Audio
    });

    on<ClickSkipNext>((event, emit) {
      // Next Audio
    });
  }
}
