class Book {
  final String title;
  final String author;
  final String image;

  Book(this.title, {this.author, this.image});
}

final books = [
  Book(
    'This Is the Way',
    author: 'Gavin Corbett',
    image: 'images/1.jpg',
  ),
  Book(
    'Her',
    author: 'Spike Jonze',
    image: 'images/2.jpg',
  ),
  Book(
    'Fight Club',
    author: 'David Fincher',
    image: 'images/3.jpg',
  ),
  Book(
    'Enemy',
    author: 'Javier Gullón',
    image: 'images/4.jpg',
  ),
  Book(
    'Manual to Minimalism',
    author: 'Unknown',
    image: 'images/5.jpg',
  ),
  Book(
    'Dirty Harry',
    author: 'Don Siegel',
    image: 'images/6.jpg',
  ),
];
