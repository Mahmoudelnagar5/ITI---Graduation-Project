import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/user/super_admin/features/add_resource/data/models/resource_model.dart';

class AddResourceRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addResource(ResourceModel resource) async {
    await firestore
        .collection("resources")
        .doc(resource.id)
        .set(resource.toFirestore());
  }
}
