import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_v2_sample_app/book.dart';

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({Key key, @required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperTextSection(book: book),
            SizedBox(height: 30),
            MidImageSection(image: book.image),
            SizedBox(height: 30),
            BottomTextSection(),
          ],
        ),
      ),
    );
  }
}

class BottomTextSection extends StatelessWidget {
  const BottomTextSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '4.7',
                style: TextStyle(fontSize: 30, color: Colors.blue.shade900),
              ),
              SizedBox(width: 10),
              for (var i = 0; i < 5; i++)
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow.shade700,
                  size: 25,
                ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            '892 rating in Google Play',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Text(
            _bookReview,
            style: GoogleFonts.lora(
              fontSize: 16,
              color: Colors.blue.shade900,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class MidImageSection extends StatelessWidget {
  const MidImageSection({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      minimumSize: Size(50, 50),
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.blue.shade900,
                    ),
                    icon: Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Audio Book',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpperTextSection extends StatelessWidget {
  final Book book;
  const UpperTextSection({
    Key key,
    @required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'History'.toUpperCase(),
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            book.title,
            style: GoogleFonts.lora(fontSize: 29, color: Colors.blue.shade900),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Written by ',
                  style: DefaultTextStyle.of(context).style.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: book.author,
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ],
                ),
              ),
              Text(
                '23 Mar, 2019',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

final _bookReview = '''
An extremely powerful story of a young Southern Negro, from his late high school days through three years of college to his life in Harlem.

His early training prepared him for a life of humility before white men, but through injustices- large and small, he came to realize that he was an "invisible man". People saw in him only a reflection of their preconceived ideas of what he was, denied his individuality, and ultimately did not see him at all. This theme, which has implications far beyond the obvious racial parallel, is skillfully handled. The incidents of the story are wholly absorbing. The boy's dismissal from college because of an innocent mistake, his shocked reaction to the anonymity of the North and to Harlem, his nightmare experiences on a one-day job in a paint factory and in the hospital, his lightning success as the Harlem leader of a communistic organization known as the Brotherhood, his involvement in black versus white and black versus black clashes and his disillusion and understanding of his invisibility- all climax naturally in scenes of violence and riot, followed by a retreat which is both literal and figurative. Parts of this experience may have been told before, but never with such freshness, intensity and power.

This is Ellison's first novel, but he has complete control of his story and his style. Watch it.

''';
