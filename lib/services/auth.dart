import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_page/models/userId.dart';
import 'package:login_page/screens/login.dart';

class authService{

      final FirebaseAuth _auth = FirebaseAuth.instance;

      //creating user obj from FireBaseUser
      userClass _userFBU(FirebaseUser anon_user) {
        return anon_user != null ? userClass(userID: anon_user.uid) : null;
      }

      Stream<userClass> get uid {
         return _auth.onAuthStateChanged
         //.map((FirebaseUser user) => _userFBU(anon_user));
         .map(_userFBU);
       }    

      Future login_anon() async {
          try {
            AuthResult anon_result = await _auth.signInAnonymously();
            FirebaseUser anon_user = anon_result.user;
            return _userFBU(anon_user);
          } 
          catch(e) {
            print(e.toString());
            return null;  
          }

      }

      Future logOutClass() async {
        try{
          return await _auth.signOut();
        }
        catch(e){
          print(e.toString());
          return null;
        }
      }

      Future createUserID(String email, String password) async {
        try{
          AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          FirebaseUser user = result.user;
          return _userFBU(user);
        }catch(e){
          print(e.toString());
          return null;
        }
      }

      Future loginEmailID(String email, String password) async {
        try{
          AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
          FirebaseUser user = result.user;
          return _userFBU(user);
        }catch(e){
          print(e.toString());
          return null;
        }
      }

}