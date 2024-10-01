import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_mobile_app/utils/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_mobile_app/view/screen/home_screen/home_screen.dart';

class GithubLoginScreen extends HookWidget {
  const GithubLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return Scaffold(
      backgroundColor: Style.colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/git.png',
                  scale: 4,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/img.png',
                  scale: 2,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: isLoading.value
                      ? null
                      : () async {
                    isLoading.value = true; // Start loading
                    try {
                      UserCredential userCredential =
                      await signInWithGithub();
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              displayName:
                              userCredential.user!.displayName ??
                                  userCredential.user!.email!
                                      .split('@')[0],
                              photoURL:
                              userCredential.user!.photoURL ?? "",
                              email: userCredential.user!.email!,
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      // Display error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                          Text('Login Failed: ${e.toString()}'),
                        ),
                      );
                    } finally {
                      isLoading.value = false; // Stop loading
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    backgroundColor: Style.colors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: isLoading.value
                      ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Style.colors.white),
                      strokeWidth: 2,
                    ),
                  )
                      : Text(
                    "Sign in with Github",
                    style: TextStyle(
                        fontSize: 14, color: Style.colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // GitHub sign-in method
  Future<UserCredential> signInWithGithub() async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    githubAuthProvider.addScope('read:user');
    githubAuthProvider.addScope('repo');
    return await FirebaseAuth.instance
        .signInWithProvider(githubAuthProvider);
  }
}
