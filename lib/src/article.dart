class Article {
  final String body;
  final String authorId;
  final String topic;
  final DateTime timestamp;
  final String title;
  final String id;
  final String author = 'René Piik';
  final String likes;

  const Article({
    this.id,
    this.body,
    this.authorId,
    this.timestamp,
    this.title,
    this.topic,
    this.likes
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Article(
      id: json['id'],
      body: json['body'],
      authorId: json['author_id'],
      title: json['title'],
      timestamp: DateTime.parse(json['timestamp']),
      topic: json['topic'],
      likes: 57.toString(),
    );
  }
}