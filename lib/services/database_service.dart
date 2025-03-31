import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  static DatabaseReference getDbRef() {
    return FirebaseDatabase.instance.ref('users');
  }

  static String? getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  static Future<Map<String, dynamic>> getUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('No user is currently signed in');
      }

      String userId = user.uid;
      DatabaseReference dbRef = getDbRef();

      // Wait for the data to be loaded
      DatabaseEvent event = await dbRef.child(userId).once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value == null) {
        throw Exception('User data not found');
      }

      Map<String, dynamic> userData =
          Map<String, dynamic>.from(snapshot.value as Map);
      return userData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {};
    }
  }

  static Future<bool> updateUserData(Map<String, dynamic> updateData) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('No user is currently signed in');
      }

      String userId = user.uid;
      DatabaseReference dbRef = getDbRef();

      // Atualiza apenas os campos especificados em updateData
      await dbRef.child(userId).update(updateData);

      return true; // Indica que a atualização foi bem-sucedida
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user data: $e');
      }
      return false; // Indica que a atualização falhou
    }
  }
}
