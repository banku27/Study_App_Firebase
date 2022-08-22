import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperReference = fireStore.collection('questionPapers');

DocumentReference questionReference({
  required String paperId,
  required String questionId,
}) =>
    questionPaperReference.doc(paperId).collection("questions").doc(questionId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();
