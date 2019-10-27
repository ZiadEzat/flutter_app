class Post {

  final int total_count;
  final bool incomplete_results;
  final List<dynamic> items;

  Post({this.total_count, this.incomplete_results, this.items});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      total_count: json['total_count'],
      incomplete_results: json['incomplete_results'],
      items: json['items'],
    );
  }
}
