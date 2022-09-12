import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_quiz/services/localdb.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FireDB {
  createNewUser(String name, String email, String photoUrl, String uid) async {
    final User? current_user = _auth.currentUser;

    // if (await getUser()) {
    //   print('USER ALREADY EXISTS');
    // } else {
      try {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(current_user!.uid)
            .set({
          'name': name,
          'email': email,
          'photoUrl': photoUrl,
          'money': '0',
          'rank': 'NA',
        }).then((value) async {
          await LocalDB.saveMoney('0');
          await LocalDB.saveRank('NA');
          await LocalDB.saveLevel('0');
          print('User Registered Successfully');
        });
      } on Exception catch (error) {
        print(error);
      }
    //}
  }
}

// Future getUser() async {
//   final User? current_user = _auth.currentUser;
//   String user = '';
//   try {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(current_user!.uid)
//         .get()
//         .then((value) async {
//       user = value.data().toString();
//       // await LocalDB.saveMoney('0');
//       // await LocalDB.saveRank('NA');
//       // await LocalDB.saveLevel('0');
//     });
//     if (user.toString() == 'null') {
//       return false;
//     } else {
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(current_user.uid)
//           .get()
//           .then((value) async {
//         user = value.data().toString();
//         // await LocalDB.saveMoney(value['money']);
//         // await LocalDB.saveRank(value['rank']);
//         // await LocalDB.saveLevel(value['level']);
//       });
//       return true;
//     }
//   } on Exception catch (errorr) {
//     print(errorr);
//   }
// }
