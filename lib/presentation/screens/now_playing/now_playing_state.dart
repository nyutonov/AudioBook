part of 'now_playing_bloc.dart';

class NowPlayingState {
  BookModel? book;
  int? currentSecond;
  int? maxSecond;
  bool? isPause;
  List<AudioModel>? audios;
  AudioModel? selectedAudio;
  AudioPlayer? player;

  NowPlayingState({
    this.book,
    this.currentSecond,
    this.maxSecond,
    this.isPause,
    this.audios,
    this.selectedAudio,
    this.player
  });

  NowPlayingState copyWith({
    BookModel? book,
    int? currentSecond,
    int? maxSecond,
    bool? isPause,
    List<AudioModel>? audios,
    AudioModel? selectedAudio,
    AudioPlayer? player,
  }) => NowPlayingState(
      book: book ?? this.book,
      currentSecond: currentSecond ?? this.currentSecond,
      maxSecond: maxSecond ?? this.maxSecond,
      isPause: isPause ?? this.isPause,
      audios: audios ?? this.audios,
      selectedAudio: selectedAudio ?? this.selectedAudio,
      player: player ?? this.player,
  );
}