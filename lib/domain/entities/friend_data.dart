import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horoskope/domain/entities/geo.dart';

class FriendData {
  final String id;
  final String name;
  final DateTime birthDateTime;
  final Geo birthPlace;

  const FriendData({
    this.id = '-1',
    required this.name,
    required this.birthDateTime,
    required this.birthPlace,
  });

  factory FriendData.fromJson(Map<String, dynamic> json) {
    return FriendData(
      id: json['id'],
      name: json['name'],
      birthDateTime: (json['birth_date_time'] as Timestamp).toDate(),
      birthPlace: Geo(
        latitude: json['birth_latitude'],
        longitude: json['birth_longitude'],
      ),
    );
  }

  factory FriendData.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final snapshotData = snapshot.data();
    if (snapshotData == null) return FriendData.fromJson({});

    final json = {
      'id': snapshot.id,
      for (final entry in snapshotData.entries) entry.key: entry.value,
    };

    return FriendData.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birth_date_time': birthDateTime,
      'birth_latitude': birthPlace.latitude,
      'birth_longitude': birthPlace.longitude,
    };
  }
}
