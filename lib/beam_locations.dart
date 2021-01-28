import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'book.dart';
import 'book_page.dart';
import 'main.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> get pages => [HomePage.beamLocation];

  @override
  String get pathBlueprint => HomePage.path;
}

class BooksLocation extends BeamLocation {
  BooksLocation() : super();

  BooksLocation.withParameters({
    Map<String, String> path,
    Map<String, String> query,
  }) : super.withParameters(path: path, query: query);

  @override
  List<BeamPage> get pages {
    return [
      // Represents a stack of pages
      // Effect: Add the back button for book page
      HomePage.beamLocation,
      if (pathParameters.containsKey('id'))
        BeamPage(
          key: ValueKey('book-${pathParameters['id']}'),
          page: BookPage(
            book: books.firstWhere((book) {
              return book.id.toString() == pathParameters['id'];
            }),
          ),
        ),
    ];
  }

  @override
  String get pathBlueprint => BookPage.path;
}
