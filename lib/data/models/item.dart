class Item {
  /// The item's unique id.
  final int id;

  /// `true` if the item is deleted.
  final bool deleted;

  /// The type of item. One of "job", "story", "comment", "poll", or "pollopt".
  final String type;

  /// The username of the item's author.
  final String by;

  /// Creation date of the item, in Unix Time.
  final int time;

  /// The comment, story or poll text. HTML.
  final String text;

  /// `true` if the item is dead.
  final bool dead;

  /// The ids of the item's comments, in ranked display order.
  final List<int> kids;

  /// The story's score, or the votes for a pollopt.
  final int score;

  /// The title of the story, poll or job. HTML.
  final String title;

  /// The URL of the story.
  final String url;

  /// In the case of stories or polls, the total comment count.
  final int descendants;

  Item({
    required this.id,
    required this.by,
    required this.descendants,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
    required this.deleted,
    required this.text,
    required this.dead,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    by: json["by"],
    descendants: json["descendants"],
    kids: json['kids'].cast<int>(),
    deleted: json["deleted"] ?? false,
    score: json["score"],
    time: json["time"],
    title: json["title"],
    type: json["type"],
    url: json["url"],
    text: json["text"] ?? "",
    dead: json["dead"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "by": by,
    "type": type,
    "descendants": descendants,
    "kids": List<int>.from(kids.map((x) => x)),
    "score": score,
    "time": time,
    "title": title,
    "url": url,
    "deleted": deleted,
    "text": text,
    "dead": dead,
  };
}
