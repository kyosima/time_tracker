import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker/model/job.dart';
import 'package:time_tracker/services/api_path.dart';

abstract class Database {
  Future<void> createJob(Job job);
  void readJob();
}

class FireStoreDatabase implements Database {
  FireStoreDatabase({@required this.uid}) : assert(uid != null);

  final String uid;
  Future<void> createJob(Job job) =>
      _setData(path: APIpath.job(uid, 'job_abc'), data: job.toMap());

  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final reference = await FirebaseFirestore.instance.doc(path);
    print('$path : $data');
    reference.set(data);
  }

  void readJob() {
    final path = APIpath.rjob(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshot = reference.snapshots();
    snapshot.listen((snapshot) {
      snapshot.docs.forEach((snapshot) {
        return [print(snapshot.data()), print(uid)];
      });
    });
  }
}
