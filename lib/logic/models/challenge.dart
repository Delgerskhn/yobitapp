class Challenge {
  final String title;
  final String content;
  final DateTime endDate;
  final String imgUrl;

  const Challenge(
      {required this.title,
      required this.content,
      required this.endDate,
      required this.imgUrl});

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
        content: json['content'],
        title: json['title'],
        endDate:
            DateTime.fromMicrosecondsSinceEpoch((json['endDate']['_seconds'])),
        imgUrl: json['imgUrl'].toString());
  }
}
