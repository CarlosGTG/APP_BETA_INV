import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Logger _logger = Logger('FirebaseService');

  // Register user with email and password
  Future<User?> registerUser(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
          'created_at': FieldValue.serverTimestamp(),
        });
      }
      return user;
    } catch (e) {
      _logger.severe('Error in registerUser: $e');
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          _logger.warning('Email already in use');
        } else if (e.code == 'weak-password') {
          _logger.warning('Weak password');
        }
      }
      return null;
    }
  }

  // Login user with email and password
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      _logger.severe('Error in loginUser: $e');
      return null;
    }
  }

  // Logout user
  Future<void> logout() async {
    await _auth.signOut();
    _logger.info('User logged out');
  }

  // Get current user
  User? getCurrentUser() {
    User? user = _auth.currentUser;
    if (user != null) {
      _logger.info('Current user: ${user.email}');
    } else {
      _logger.warning('No user is currently logged in');
    }
    return user;
  }

  // Suppliers CRUD
  Future<void> addSupplier(Map<String, dynamic> supplier) async {
    try {
      await _firestore.collection('suppliers').add(supplier);
      _logger.info('Supplier added: $supplier');
    } catch (e) {
      _logger.severe('Error adding supplier: $e');
    }
  }

  Stream<QuerySnapshot> getSuppliers() {
    return _firestore.collection('suppliers').snapshots();
  }

  Future<void> updateSupplier(String id, Map<String, dynamic> supplier) async {
    try {
      await _firestore.collection('suppliers').doc(id).update(supplier);
      _logger.info('Supplier updated: $id');
    } catch (e) {
      _logger.severe('Error updating supplier: $e');
    }
  }

  Future<void> deleteSupplier(String id) async {
    try {
      await _firestore.collection('suppliers').doc(id).delete();
      _logger.info('Supplier deleted: $id');
    } catch (e) {
      _logger.severe('Error deleting supplier: $e');
    }
  }

  // Items CRUD
  Future<void> addItem(Map<String, dynamic> item) async {
    try {
      await _firestore.collection('items').add(item);
      _logger.info('Item added: $item');
    } catch (e) {
      _logger.severe('Error adding item: $e');
    }
  }

  Stream<QuerySnapshot> getItems() {
    return _firestore.collection('items').snapshots();
  }

  Future<void> updateItem(String id, Map<String, dynamic> item) async {
    try {
      await _firestore.collection('items').doc(id).update(item);
      _logger.info('Item updated: $id');
    } catch (e) {
      _logger.severe('Error updating item: $e');
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _firestore.collection('items').doc(id).delete();
      _logger.info('Item deleted: $id');
    } catch (e) {
      _logger.severe('Error deleting item: $e');
    }
  }

  // Sales CRUD
  Future<void> addSale(Map<String, dynamic> sale) async {
    try {
      await _firestore.collection('sales').add(sale);
      _logger.info('Sale added: $sale');
    } catch (e) {
      _logger.severe('Error adding sale: $e');
    }
  }

  Stream<QuerySnapshot> getSales() {
    return _firestore.collection('sales').snapshots();
  }

  Future<void> updateSale(String id, Map<String, dynamic> sale) async {
    try {
      await _firestore.collection('sales').doc(id).update(sale);
      _logger.info('Sale updated: $id');
    } catch (e) {
      _logger.severe('Error updating sale: $e');
    }
  }

  Future<void> deleteSale(String id) async {
    try {
      await _firestore.collection('sales').doc(id).delete();
      _logger.info('Sale deleted: $id');
    } catch (e) {
      _logger.severe('Error deleting sale: $e');
    }
  }

  // Purchases CRUD
  Future<void> addPurchase(Map<String, dynamic> purchase) async {
    try {
      await _firestore.collection('purchases').add(purchase);
      _logger.info('Purchase added: $purchase');
    } catch (e) {
      _logger.severe('Error adding purchase: $e');
    }
  }

  Stream<QuerySnapshot> getPurchases() {
    return _firestore.collection('purchases').snapshots();
  }

  Future<void> updatePurchase(String id, Map<String, dynamic> purchase) async {
    try {
      await _firestore.collection('purchases').doc(id).update(purchase);
      _logger.info('Purchase updated: $id');
    } catch (e) {
      _logger.severe('Error updating purchase: $e');
    }
  }

  Future<void> deletePurchase(String id) async {
    try {
      await _firestore.collection('purchases').doc(id).delete();
      _logger.info('Purchase deleted: $id');
    } catch (e) {
      _logger.severe('Error deleting purchase: $e');
    }
  }

  // Get item by name, or create if not exists
  Future<DocumentReference> getOrCreateItem(Map<String, dynamic> itemData) async {
    try {
      final query = await _firestore
          .collection('items')
          .where('name', isEqualTo: itemData['name'])
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        _logger.info('Item found: ${itemData['name']}');
        return query.docs.first.reference;
      } else {
        _logger.info('Item not found, creating new item: ${itemData['name']}');
        return await _firestore.collection('items').add(itemData);
      }
    } catch (e) {
      _logger.severe('Error in getOrCreateItem: $e');
      rethrow;
    }
  }
}