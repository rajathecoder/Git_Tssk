
class Repository {
  final String name;
  final String fullName;
  final String ownerLogin;
  final String ownerAvatarUrl;
  final String updatedAt;

  Repository({
    required this.name,
    required this.fullName,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
    required this.updatedAt,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'],
      fullName: json['full_name'],
      ownerLogin: json['owner']['login'],
      ownerAvatarUrl: json['owner']['avatar_url'],
      updatedAt: json['updated_at'],
    );
  }
}
