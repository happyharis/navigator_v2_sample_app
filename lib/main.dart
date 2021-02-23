import 'package:flutter/material.dart';
import 'package:navigator_v2_sample_app/book.dart';
import 'package:navigator_v2_sample_app/book_page.dart';
import 'package:navigator_v2_sample_app/fake_widgets.dart';
import 'package:vrouter/vrouter.dart';

import 'book_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: 'VRouter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      routes: [
        VStacked(
          path: '/',
          widget: HomePage(),
        ),
        VStacked(
          path: '/book/:id',
          name: 'book',
          widget: BookPage(),
          aliases: ['/book'],
        ),
        VRouteRedirector(path: ':_(.*)', redirectTo: '/')
      ],
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
              children: List.generate(books.length, (index) {
                final book = books[index];
                return InkWell(
                  onTap: () {
                    VRouterData.of(context).pushNamed(
                      'book',
                      pathParameters: {'id': '$index'},
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
          )
        ]),
      ),
    );
  }
}
