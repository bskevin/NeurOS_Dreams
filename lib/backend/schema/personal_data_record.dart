import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalDataRecord extends FirestoreRecord {
  PersonalDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "Age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "Height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "Weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "Sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "email_reference" field.
  DocumentReference? _emailReference;
  DocumentReference? get emailReference => _emailReference;
  bool hasEmailReference() => _emailReference != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _age = castToType<int>(snapshotData['Age']);
    _height = castToType<double>(snapshotData['Height']);
    _weight = castToType<double>(snapshotData['Weight']);
    _sex = snapshotData['Sex'] as String?;
    _emailReference = snapshotData['email_reference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PersonalData');

  static Stream<PersonalDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonalDataRecord.fromSnapshot(s));

  static Future<PersonalDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PersonalDataRecord.fromSnapshot(s));

  static PersonalDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonalDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonalDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonalDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonalDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonalDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonalDataRecordData({
  String? name,
  String? lastName,
  int? age,
  double? height,
  double? weight,
  String? sex,
  DocumentReference? emailReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'LastName': lastName,
      'Age': age,
      'Height': height,
      'Weight': weight,
      'Sex': sex,
      'email_reference': emailReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonalDataRecordDocumentEquality
    implements Equality<PersonalDataRecord> {
  const PersonalDataRecordDocumentEquality();

  @override
  bool equals(PersonalDataRecord? e1, PersonalDataRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.lastName == e2?.lastName &&
        e1?.age == e2?.age &&
        e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        e1?.sex == e2?.sex &&
        e1?.emailReference == e2?.emailReference;
  }

  @override
  int hash(PersonalDataRecord? e) => const ListEquality().hash([
        e?.name,
        e?.lastName,
        e?.age,
        e?.height,
        e?.weight,
        e?.sex,
        e?.emailReference
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonalDataRecord;
}
