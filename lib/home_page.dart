import 'package:flutter/material.dart';
import 'package:navigator_v2_sample_app/book.dart';
import 'package:navigator_v2_sample_app/fake_widgets.dart';

class HomePage extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;
  const HomePage({Key key, @required this.books, @required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(children: [
          SizedBox(height: 20),
          FakeAppBar(),
          SizedBox(height: 20),
          FakeTabBar(),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              childAspectRatio: 48 / 78,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(books.length, (index) {
                final book = books[index];
                return InkWell(
                  onTap: () => onTapped(book),
                  child: Card(
                    child: Image.asset(
                      book.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
            ),
          )
        ]),
      ),
    );
  }
}
