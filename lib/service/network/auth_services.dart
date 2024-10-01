import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<UserCredential> signInWithGithub() async {
    try {
      final GithubAuthProvider githubProvider = GithubAuthProvider();
      UserCredential userCredential = await _auth.signInWithPopup(githubProvider);

      final OAuthCredential? credential = userCredential.credential as OAuthCredential?;
      if (credential == null) {
        throw Exception('Failed to obtain OAuth credential.');
      }

      final String? accessToken = credential.accessToken;
      if (accessToken == null) {
        throw Exception('Failed to obtain GitHub access token.');
      }

      await _secureStorage.write(key: 'github_token', value: accessToken);

      return userCredential;
    } catch (e) {
      throw Exception('GitHub Sign-In Failed: ${e.toString()}');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    await _secureStorage.delete(key: 'github_token');
  }

  // Retrieve the stored GitHub token
  Future<String?> getGitHubToken() async {
    return await _secureStorage.read(key: 'github_token');
  }
}


