import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SleepDataRecord extends FirestoreRecord {
  SleepDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Beginning" field.
  DateTime? _beginning;
  DateTime? get beginning => _beginning;
  bool hasBeginning() => _beginning != null;

  // "End" field.
  DateTime? _end;
  DateTime? get end => _end;
  bool hasEnd() => _end != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Sleep" field.
  int? _sleep;
  int get sleep => _sleep ?? 0;
  bool hasSleep() => _sleep != null;

  // "Rested" field.
  double? _rested;
  double get rested => _rested ?? 0.0;
  bool hasRested() => _rested != null;

  void _initializeFields() {
    _beginning = snapshotData['Beginning'] as DateTime?;
    _end = snapshotData['End'] as DateTime?;
    _date = snapshotData['Date'] as DateTime?;
    _sleep = castToType<int>(snapshotData['Sleep']);
    _rested = castToType<double>(snapshotData['Rested']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SleepData');

  static Stream<SleepDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SleepDataRecord.fromSnapshot(s));

  static Future<SleepDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SleepDataRecord.fromSnapshot(s));

  static SleepDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SleepDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SleepDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SleepDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SleepDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SleepDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSleepDataRecordData({
  DateTime? beginning,
  DateTime? end,
  DateTime? date,
  int? sleep,
  double? rested,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Beginning': beginning,
      'End': end,
      'Date': date,
      'Sleep': sleep,
      'Rested': rested,
    }.withoutNulls,
  );

  return firestoreData;
}

class SleepDataRecordDocumentEquality implements Equality<SleepDataRecord> {
  const SleepDataRecordDocumentEquality();

  @override
  bool equals(SleepDataRecord? e1, SleepDataRecord? e2) {
    return e1?.beginning == e2?.beginning &&
        e1?.end == e2?.end &&
        e1?.date == e2?.date &&
        e1?.sleep == e2?.sleep &&
        e1?.rested == e2?.rested;
  }

  @override
  int hash(SleepDataRecord? e) => const ListEquality()
      .hash([e?.beginning, e?.end, e?.date, e?.sleep, e?.rested]);

  @override
  bool isValidKey(Object? o) => o is SleepDataRecord;
}
