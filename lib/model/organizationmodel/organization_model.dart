
class Organization {
  final String login;
  final String avatarUrl;
  final String description;

  Organization({
    required this.login,
    required this.avatarUrl,
    required this.description,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      description: json['description'] ?? '',
    );
  }
}
