import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LoginRepo {
  Future<String> login(String email, String password);
}

class LoginRepoImpl implements LoginRepo {
  @override
  Future<String> login(String email, String password) async {
    try {
      final query = await FirebaseFirestore.instance
          .collection('roles')
          .where('email', isEqualTo: email)
          .get();

      if (query.docs.isEmpty) {
        throw Exception("No account found");
      }

      final userData = query.docs.first.data();

      if (userData['password'] != password) {
        throw Exception("Wrong password");
      }

      if (userData['email'] != email) {
        throw Exception("Wrong email");
      }

      return userData['role'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
