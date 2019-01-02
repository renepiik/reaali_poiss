class Article {
  final String text;
  final String authorId;
  final String topic;
  final DateTime timestamp;
  final String title;
  final String id;
  final String author = 'René Piik';

  const Article({
    this.id,
    this.text,
    this.authorId,
    this.timestamp,
    this.title,
    this.topic
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Article(
      id: json['id'],
      text: json['body'],
      authorId: json['author_id'],
      title: json['title'],
      timestamp: DateTime.parse(json['timestamp']),
      topic: json['topic'],
    );
  }
}