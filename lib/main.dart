import 'package:flutter/material.dart';
import 'package:navigator_v2_sample_app/book.dart';
import 'package:navigator_v2_sample_app/book_page.dart';
import 'package:navigator_v2_sample_app/book_route_path.dart';
import 'package:navigator_v2_sample_app/home_page.dart';

import 'audiobook.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routerDelegate = BookRouterDelegate();
  final _routeInformationParser = BookRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Review App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

// Add ChangeNotifier to handle the add and remove listeners of book router
// delegate. Add pop navigator router delegate mixin to handle the pop route to the
// navigator it builds.
class BookRouterDelegate extends RouterDelegate<BookRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;
  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  Book _selectedBook;
  String tab = 'books';
  bool show404 = false;

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }

  void selectedAudioPage() {
    _selectedBook = null;
    print("here-0---");
    tab = 'audiobooks';
    notifyListeners();
  }

  // show the correct path in the url, need to return a book
  // book route path based on current state of the app
  BookRoutePath get currentConfiguration {
    if (show404) return BookRoutePath.unknown();

    if (tab == 'books') {
      if (_selectedBook == null) {
        return BookRoutePath.home();
      } else {
        return BookRoutePath.details(books.indexOf(_selectedBook));
      }
    } else {
      return BookRoutePath.audioBooks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(
            books: books,
            onTapped: _handleBookTapped,
            onTapAB: selectedAudioPage,
          ),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (tab == 'audiobooks')
          AudioBookPage()
        else if (_selectedBook != null)
          BookDetailsPage(book: _selectedBook),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (tab == 'audiobooks') {
          tab = 'books';
          _selectedBook = null;
          show404 = false;
        } else {
          // if tab is on books segment
          _selectedBook = null;
          show404 = false;
        }

        notifyListeners();

        return true;
      },
    );
  }

  // when update of route, updates the app state
  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      show404 = true;
      // have an empty return to end the function
      return;
    }
    if (path.isAudioBookPage) {
      _selectedBook = null;
      show404 = false;
      tab = 'audiobooks';
      return;
    } else {
      tab = 'books';
    }
    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > books.length - 1) {
        show404 = true;
        return;
      }
      _selectedBook = books[path.id];
    } else {
      _selectedBook = null;
    }

    show404 = false;
  }
}

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({
    this.book,
  }) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookPage(book: book);
      },
    );
  }
}

class AudioBookPage extends Page {
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return AudioBook();
      },
    );
  }
}

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  // Converts the given route information into parsed data to pass to a
  // RouterDelegate
  @override
  Future<BookRoutePath> parseRouteInformation(RouteInformation routeInfo) async {
    final uri = Uri.parse(routeInfo.location);

    // Handle '/'
    if (uri.pathSegments.length == 0) return BookRoutePath.home();

    // Handle '/audiobooks'
    if (uri.pathSegments.length == 1 && uri.pathSegments.first == 'audiobooks') {
      return BookRoutePath.audioBooks();
    }

    // Handle 'book/:id'
    if (uri.pathSegments.length == 2) {
      // if (uri.pathSegments.first != 'book') return BookRoutePath.unknown();
      if (uri.pathSegments.first != 'book') return BookRoutePath.unknown();

      final remaining = uri.pathSegments.elementAt(1);
      final id = int.tryParse(remaining);
      if (id == null) return BookRoutePath.unknown();
      return BookRoutePath.details(id);
    }

    // Handle unknown routes
    return BookRoutePath.unknown();
  }

  // which is used for updating browser history for the web application. If you
  // decides to opt in, you must also overrides this method to return a route
  // information.
  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isAudioBookPage) {
      return RouteInformation(location: '/audiobooks');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }

    return null;
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}
