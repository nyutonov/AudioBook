import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/audio_model.dart';
import '../../../data/model/book_model.dart';
import '../../../utills/constants/utils.dart';
import '../../components/appbar.dart';
import '../../components/audio_playing_text.dart';
import '../../components/chapter_item.dart';
import 'now_playing_bloc.dart';

class NowPlayingScreen extends StatefulWidget {
  final BookModel? book;
  final String tag;

  const NowPlayingScreen({
    super.key,
    required this.book,
    required this.tag
  });

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  Timer? timer;
  final bloc = NowPlayingBloc();

  @override
  void initState() {
    super.initState();

    bloc.add(Init(widget.book));
    timer = Timer.periodic(
        const Duration(seconds: 1), (timer) {
          bloc.add(ChangeCurrentSecond());
        }
    );
  }

  @override
  void dispose() {
    super.dispose();

    bloc.add(Stop());
    timer?.cancel();

    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBarComponent(
          appBarName: 'Now Playing',
          appBarColor: redColor,
          textColor: Colors.white,
          leadingIcon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          action: const Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ),
        body: Stack(
          children: [
            Positioned(
              left: -50,
              top: -350,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width + 100,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: redColor,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Hero(
                    tag: '${widget.book?.name}${widget.tag}',
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.1,
                      width: MediaQuery.of(context).size.width / 2.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                widget.book?.image ?? ''
                            ),
                            fit: BoxFit.fill
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(4, 4),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    widget.book?.bookName ?? '',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                      fontSize: 14,
                      fontFamily: 'Uni Neue',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.book?.author ?? '',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                      fontSize: 12,
                      fontFamily: 'Uni Neue',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: BlocBuilder<NowPlayingBloc, NowPlayingState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AudioPlayingText(second: state.currentSecond ?? 0),
                            SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 1.0,
                                  trackShape:
                                  const RoundedRectSliderTrackShape(),
                                  activeTrackColor: redColor,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 6.0,
                                    pressedElevation: 8.0,
                                  ),
                                  thumbColor: redColor,
                                  overlayColor: Colors.pink.withOpacity(0.2),
                                  overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 12.0
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    var value = 0.0;

                                    if (state.maxSecond != 0) {
                                      value = ((state.currentSecond ?? 0) / (state.maxSecond ?? 0));
                                    }

                                    if (value < 0) {
                                      value = 0;
                                    }

                                    if (value > 1) {
                                      value = 1;
                                    }

                                    return Slider(
                                      value: value,
                                      onChanged: (value) {
                                        bloc.add(ChangePositionAudio(value));
                                      },
                                    );
                                  }
                                )
                            ),
                            AudioPlayingText(second: ((state.maxSecond ?? 0) == 0) ? 60 : (state.maxSecond ?? 0)),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () { bloc.add(ClickSkipPrevious()); },
                            icon: const Icon(
                              Icons.skip_previous_outlined,
                              size: 32,
                            )
                        ),
                        IconButton(
                            onPressed: () { bloc.add(ClickFastRewind()); },
                            icon: const Icon(
                              Icons.fast_rewind_outlined,
                              size: 32,
                            )
                        ),
                        const Spacer(),
                        BlocBuilder<NowPlayingBloc, NowPlayingState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: 64,
                              height: 64,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                      heroTag: 'button',
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      elevation: 0,
                                      highlightElevation: 0,
                                      splashColor: redColor.withOpacity(0.1),
                                      backgroundColor: Theme.of(context).colorScheme.secondary,
                                      onPressed: () { bloc.add(ClickPauseOrStart()); },
                                      child: Icon(
                                          (state.isPause ?? false) ? Icons.play_arrow : Icons.pause,
                                          color: redColor
                                      )
                                  ),
                                ),
                            );
                          },
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () { bloc.add(ClickFastForward()); },
                            icon: const Icon(
                              Icons.fast_forward_outlined,
                              size: 32,
                            )
                        ),
                        IconButton(
                            onPressed: () { bloc.add(ClickSkipNext()); },
                            icon: const Icon(
                              Icons.skip_next_outlined,
                              size: 32,
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                  initialChildSize: 0.1,
                  minChildSize: 0.1,
                  maxChildSize: 0.5,
                  builder: (context, scrollableController) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      ),
                      child: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        child: BlocBuilder<NowPlayingBloc, NowPlayingState>(
                          builder: (context, state) {
                            return ListView(
                              controller: scrollableController,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height / 50),
                                ImageIcon(
                                  const AssetImage('assets/icons/up.png'),
                                  color: redColor,
                                  size: 15,
                                ),
                                const SizedBox(height: 8),
                                Center(
                                  child: Text(
                                    'CHAPTER',
                                    style: TextStyle(
                                      color: redColor,
                                      fontSize: 16,
                                      fontFamily: 'Uni Neue',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                for (AudioModel audio in state.audios ?? [])
                                  ChapterItem(
                                    name: audio.id ?? '',
                                    isPlay: (audio.id == state.selectedAudio?.id) && (state.isPause == false),
                                    minute: audio.duration ?? 0,
                                    onClick: () => bloc.add(SelectAudio(audio)),
                                  )
                              ],
                            );
                          }
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}