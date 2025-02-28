import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:uuid/uuid.dart';

class FirestoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser(String email) async {
    try {
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'id': _auth.currentUser!.uid,
        'email': email,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addTask(String title, String subtitle) async {
    try {
      var uuid = const Uuid().v4();
      DateTime date = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('tasks')
          .doc(uuid)
          .set({
        'id': uuid,
        'title': title,
        'subtitle': subtitle,
        'date': '${date.hour}:${date.minute}',
        'isDone': false,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<QuerySnapshot> stream() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('tasks')
        .snapshots();
  }

  List getTask(AsyncSnapshot snapshot)  {
    try { 
      final taskList = snapshot.data!.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>; 
        return Task(
          data['id'] ??'',
          data['time'] ??'',
          data['title'] ?? '',
          data['subtitle'] ??'',
          data['isDone'] ?? false);
      }).toList();
      return taskList;
    }  catch (e) {
      print('error'+e.toString());
        return [];
    }
  }


  Future<bool> isDone(String uuid, bool isDone) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('tasks')
          .doc(uuid)
          .update({'isDone': isDone});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTask(String uuid) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('tasks')
          .doc(uuid)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateTask(String uuid, String title, String subtitle) async {
    try {
      DateTime date = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('tasks')
          .doc(uuid)
          .update({
        'title': title,
        'subtitle': subtitle,
        'time': '${date.hour}:${date.minute}'
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
