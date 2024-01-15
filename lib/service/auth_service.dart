import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_app/helper/helper_function.dart';
import 'package:hostel_app/service/database_service.dart';

// class AuthService {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   Future registerUserWithEmailandPassword(
//       String fullname, String email, String password) async {
//     try {
//       if (fullname != null && email != null && password != null) {
//         User user = (await firebaseAuth.createUserWithEmailAndPassword(
//                 email: email, password: password))
//             .user!;
//         await DatabaseService(uid: user.uid).saveUserData(fullname, email);
//         return true;
//       }
//     } on FirebaseAuthException catch (e) {
//       // print(e);
//       return e.message;
//     }
//   }

//   Future signOut() async {
//     try {
//       await HelperFunction.saveUserEmailSF("");
//       await HelperFunction.saveUserLoggedInStatus(false);
//       await HelperFunction.saveUserNameSF("");
//       await firebaseAuth.signOut();
//     } catch (e) {
//       return null;
//     }
//   }

//   Future loginWithEmailandPassword(String email, String password) async {
//     try {
//       if (email != null && password != null) {
//         User user = (await firebaseAuth.signInWithEmailAndPassword(
//                 email: email, password: password))
//             .user!;
//         // await DatabaseService(user.uid).updateUserData(email);
//         return true;
//       }
//     } on FirebaseAuthException catch (e) {
//       // print(e);
//       return e.message;
//     }
//   }
// }
