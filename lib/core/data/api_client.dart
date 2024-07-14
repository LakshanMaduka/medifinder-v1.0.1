import 'package:cloud_firestore/cloud_firestore.dart';

class ApiClient{
  ApiClient();
 Future<QuerySnapshot> getMedicines() async{
   try {
     return await FirebaseFirestore.instance.collection('medicines').get();
   } catch (e) {
     throw e;
   }
 }
  Future<QuerySnapshot> getPaththu() async{
    try {
      return await FirebaseFirestore.instance.collection('paththu').get();
    } catch (e) {
      throw e;
    }
  }
}