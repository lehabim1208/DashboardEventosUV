import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "site" field.
  String? _site;
  String get site => _site ?? '';
  bool hasSite() => _site != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "date_start" field.
  DateTime? _dateStart;
  DateTime? get dateStart => _dateStart;
  bool hasDateStart() => _dateStart != null;

  // "date_end" field.
  DateTime? _dateEnd;
  DateTime? get dateEnd => _dateEnd;
  bool hasDateEnd() => _dateEnd != null;

  // "modality" field.
  String? _modality;
  String get modality => _modality ?? '';
  bool hasModality() => _modality != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "extra_data" field.
  String? _extraData;
  String get extraData => _extraData ?? '';
  bool hasExtraData() => _extraData != null;

  // "create_by" field.
  String? _createBy;
  String get createBy => _createBy ?? '';
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _site = snapshotData['site'] as String?;
    _type = snapshotData['type'] as String?;
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _price = snapshotData['price'] as String?;
    _dateStart = snapshotData['date_start'] as DateTime?;
    _dateEnd = snapshotData['date_end'] as DateTime?;
    _modality = snapshotData['modality'] as String?;
    _contact = snapshotData['contact'] as String?;
    _extraData = snapshotData['extra_data'] as String?;
    _createBy = snapshotData['create_by'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? title,
  String? description,
  String? image,
  String? site,
  String? type,
  DateTime? startTime,
  DateTime? endTime,
  String? price,
  DateTime? dateStart,
  DateTime? dateEnd,
  String? modality,
  String? contact,
  String? extraData,
  String? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'site': site,
      'type': type,
      'start_time': startTime,
      'end_time': endTime,
      'price': price,
      'date_start': dateStart,
      'date_end': dateEnd,
      'modality': modality,
      'contact': contact,
      'extra_data': extraData,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.site == e2?.site &&
        e1?.type == e2?.type &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.price == e2?.price &&
        e1?.dateStart == e2?.dateStart &&
        e1?.dateEnd == e2?.dateEnd &&
        e1?.modality == e2?.modality &&
        e1?.contact == e2?.contact &&
        e1?.extraData == e2?.extraData &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.image,
        e?.site,
        e?.type,
        e?.startTime,
        e?.endTime,
        e?.price,
        e?.dateStart,
        e?.dateEnd,
        e?.modality,
        e?.contact,
        e?.extraData,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
