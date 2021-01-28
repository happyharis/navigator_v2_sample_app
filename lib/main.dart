import 'package:flutter/material.dart';
import 'package:navigator_v2_sample_app/book.dart';
import 'package:navigator_v2_sample_app/book_page.dart';
import 'package:navigator_v2_sample_app/fake_widgets.dart';

import 'beamer_example.dart';

void main() {
  runApp(BeamerApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
          BooksGridView()
        ]),
      ),
    );
  }
}

class BooksGridView extends StatelessWidget {
  const BooksGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        childAspectRatio: 48 / 78,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(books.length, (index) {
          final book = books[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return BookPage(book: book);
                  },
                ),
              );
            },
            child: Card(
              child: Image.asset(
                book.image,
                fit: BoxFit.fill,
              ),
            ),
          );
        }),
      ),
    );
  }
}
