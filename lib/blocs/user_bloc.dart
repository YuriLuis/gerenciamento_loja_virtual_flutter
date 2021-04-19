import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase{

  final _usersController = BehaviorSubject();

  Map<String, Map<String, dynamic>> _users = {};

  Firestore _firestore = Firestore.instance;

  UserBloc(){
    _addUsersListiner();
  }
  @override
  void dispose() {
    _usersController.close();
  }

  void _addUsersListiner() {
    _firestore.collection('users').snapshots().listen((snapshot){
      snapshot.documentChanges.forEach((change) {
        String uid = change.document.documentID;
        switch(change.type){
          case DocumentChangeType.added:
            _users[uid] = change.document.data;

            break;
          case DocumentChangeType.modified:
            _users[uid].addAll(change.document.data);
            break;
          case DocumentChangeType.removed:
            _users.remove(uid);
            break;
        }
      });
    });
  }

}