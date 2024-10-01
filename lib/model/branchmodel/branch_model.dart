
import '../commitmodel/commit_model.dart';

class Branch {
  final String name;
  final Commit commit;

  Branch({
    required this.name,
    required this.commit,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      name: json['name'],
      commit: Commit.fromJson(json['commit']),
    );
  }
}
