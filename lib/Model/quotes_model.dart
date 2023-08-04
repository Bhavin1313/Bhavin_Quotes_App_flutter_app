class Quotes {
  String quote;
  String author;

  Quotes({required this.author, required this.quote});

  factory Quotes.fromMap({required Map Data}) {
    return Quotes(author: Data['author'], quote: Data['quote']);
  }
}
