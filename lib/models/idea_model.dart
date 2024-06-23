class IdeaModel {
  final int id;
  final String title;
  final String createdAt;
  final String? icon;
  final String? slug;
  final String? coverURL;
  final String? logoURL;
  final String? repoURL;

  IdeaModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.createdAt,
    required this.slug,
    this.coverURL,
    this.repoURL,
    this.logoURL,
  });

  factory IdeaModel.fromJson(Map<String, dynamic> json) {
    var i = IdeaModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      slug: json['slug'],
      repoURL: json['repo_url'],
      logoURL: json['logo_url'],
      coverURL: json['cover_url'],
      createdAt: json['created_at_string'],
    );

    return i;
  }
}
