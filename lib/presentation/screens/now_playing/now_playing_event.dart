part of 'now_playing_bloc.dart';

@immutable
abstract class NowPlayingEvent {}

class ChangePositionAudio extends NowPlayingEvent {
  final double value;

  ChangePositionAudio(this.value);
}

class Init extends NowPlayingEvent {
  final BookModel? book;

  Init(this.book);
}

class ClickFastRewind extends NowPlayingEvent {}

class ClickFastForward extends NowPlayingEvent {}

class ClickSkipPrevious extends NowPlayingEvent {}

class ClickSkipNext extends NowPlayingEvent {}

class ClickPauseOrStart extends NowPlayingEvent {}

class ChangeCurrentSecond extends NowPlayingEvent {}

class Stop extends NowPlayingEvent {}

class SelectAudio extends NowPlayingEvent {
  final AudioModel audio;

  SelectAudio(this.audio);
}