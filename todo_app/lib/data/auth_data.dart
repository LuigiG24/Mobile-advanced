import "package:firebase_auth/firebase_auth.dart";
import "package:todo_app/data/firestore_data.dart";


abstract class AuthenticationDataSource {
  Future<void> register(String email, String password, String passwordConfirm);
  Future<void> login(String email, String password);
}

class AuthenticationRemote extends AuthenticationDataSource {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> register(String email, String password, String passwordConfirm) async{
    if (password == passwordConfirm) {
    await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value){
        FirestoreDataSource().createUser(email);
      });
    }
  }
}

