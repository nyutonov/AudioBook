import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/book_model.dart';
import '../screens/now_playing/now_playing_screen.dart';

class BookItem extends StatelessWidget {
  final BookModel? book;
  final String tag;

  const BookItem({
    super.key,
    required this.book,
    required this.tag
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NowPlayingScreen(
                  book: book,
                  tag: tag,
                )
            )
        );
      },
      borderRadius: BorderRadius.circular(5),
      child: Hero(
        tag: '${book?.name}$tag',
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width / 3 - 28,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                book?.image ?? '',
              ),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow (
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(4, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
