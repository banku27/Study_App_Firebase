import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app_firebase/firebase_ref/references.dart';
import 'package:study_app_firebase/widgets/dialogs/dialog_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } on Exception catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  saveUser(GoogleSignInAccount account) {
    userReference.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(onTap: () {
        Get.back();
        //Navigate to login page
      }),
      barrierDismissible: false,
    );
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
