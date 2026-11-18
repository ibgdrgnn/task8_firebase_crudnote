import 'package:cloud_firestore/cloud_firestore.dart';

class CrudService {
  final CollectionReference<Map<String, dynamic>> items =
      FirebaseFirestore.instance.collection('items');

  // CREATE
  Future<void> addItem(String name, int quantity) {
    return items.add({
      'name': name,
      'quantity': quantity,
      'createdAt': Timestamp.now(),
      'favorite': false,
    });
  }

  // READ
  Stream<QuerySnapshot<Map<String, dynamic>>> getItems() {
    return items.orderBy('createdAt', descending: true).snapshots();
  }

  // UPDATE
  Future<void> updateItem(String id, String name, int quantity) {
    return items.doc(id).update({
      'name': name,
      'quantity': quantity,
    });
  }

  // UPDATE FAVORITE
  Future<void> updateFavorite(String id, bool favorite) {
    return items.doc(id).update({'favorite': favorite});
  }

  // DELETE
  Future<void> deleteItem(String id) {
    return items.doc(id).delete();
  }
}