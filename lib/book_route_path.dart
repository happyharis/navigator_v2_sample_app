class BookRoutePath {
  final String tab;
  final int id;
  final bool isUnknown;

  BookRoutePath.home()
      : tab = 'books',
        id = null,
        isUnknown = false;

  BookRoutePath.details(this.id)
      : tab = 'books',
        isUnknown = false;

  BookRoutePath.audioBooks()
      : tab = 'audiobooks',
        id = null,
        isUnknown = false;

  BookRoutePath.unknown()
      : tab = null,
        id = null,
        isUnknown = true;

  bool get isHomePage => tab == 'books' && id == null;
  bool get isAudioBookPage => tab == 'audiobooks';
  bool get isDetailsPage => id != null;
}
