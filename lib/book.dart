class Book {
  final String title;
  final String author;
  final String image;
  final int id;

  Book(this.title, {this.author, this.image, this.id});
}

final books = [
  Book(
    'This Is the Way',
    author: 'Gavin Corbett',
    image: 'images/1.jpg',
    id: 1,
  ),
  Book(
    'Her',
    author: 'Spike Jonze',
    image: 'images/2.jpg',
    id: 2,
  ),
  Book(
    'Fight Club',
    author: 'David Fincher',
    image: 'images/3.jpg',
    id: 3,
  ),
  Book(
    'Enemy',
    author: 'Javier Gullón',
    image: 'images/4.jpg',
    id: 4,
  ),
  Book(
    'Manual to Minimalism',
    author: 'Unknown',
    image: 'images/5.jpg',
    id: 5,
  ),
  Book(
    'Dirty Harry',
    author: 'Don Siegel',
    image: 'images/6.jpg',
    id: 6,
  ),
];
