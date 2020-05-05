import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  final String uid;
  DBService({ this.uid });

  //collection Ref
  final CollectionReference userData = Firestore.instance.collection('userDB');

  Future updateUserDB(String userName, int userMobile, String userEmail, String userAddress ) async {
    return await userData.document(uid).setData({
      'Name' : userName,
      'Mobile' : userMobile,
      'Email' : userEmail,
      'Address' : userAddress,
    }
    );
  }
}