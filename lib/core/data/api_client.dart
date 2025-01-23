import 'package:cloud_firestore/cloud_firestore.dart';

class ApiClient{
  ApiClient();
  QuerySnapshot? response;
 Future<QuerySnapshot> getMedicines() async{
   try {
     response = await FirebaseFirestore.instance.collection('medicines').get();

     return response!;
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
  Future<QuerySnapshot> getKasaya() async{
    try {
      return await FirebaseFirestore.instance.collection('kasaya').get();
    } catch (e) {
      throw e;
    }
  }
}