// lib/models/commit.dart

class Commit {
  final String sha;
  final String message;
  final String authorName;
  final String authorAvatarUrl;
  final String date;

  Commit({
    required this.sha,
    required this.message,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.date,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      sha: json['sha'],
      message: json['commit']['message'],
      authorName: json['commit']['author']['name'],
      authorAvatarUrl: json['author'] != null ? json['author']['avatar_url'] : '',
      date: json['commit']['author']['date'],
    );
  }
}
