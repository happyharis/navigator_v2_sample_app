import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_v2_sample_app/book_page.dart';

void main() {
  runApp(MyApp());
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
      // home: HomePage(),
      home: BookPage(),
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
          Expanded(
            child: GridView.count(
              childAspectRatio: 48 / 78,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(6, (index) {
                return Card(
                  child: Image.asset(
                    'images/${index + 1}.jpg',
                    fit: BoxFit.fill,
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

class FakeAppBar extends StatelessWidget {
  const FakeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        buildText('All Books'),
        Icon(Icons.search),
      ],
    );
  }
}

class FakeTabBar extends StatelessWidget {
  const FakeTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: Center(child: buildText('Ebooks')),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Center(child: buildText('Audiobooks')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Text buildText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );
}
