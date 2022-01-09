import 'dart:convert';

class Chair {
  int? id;
  String title;
  String picture;
  String description;
  String createDate;
  int status;
  Chair({
    this.id,
    required this.title,
    required this.picture,
    required this.description,
    required this.createDate,
    required this.status,
  });

  Chair copyWith({
    String? title,
    String? picture,
    String? description,
    String? createDate,
    int? status,
  }) {
    return Chair(
      id: id,
      title: title ?? this.title,
      picture: picture ?? this.picture,
      description: description ?? this.description,
      createDate: createDate ?? this.createDate,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'description': description,
      'createDate': createDate,
      'status': status,
    };
  }

  factory Chair.fromMap(Map<String, dynamic> map) {
    return Chair(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      picture: map['picture'] ?? '',
      description: map['description'] ?? '',
      createDate: map['createDate'] ?? '',
      status: map['status']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chair.fromJson(String source) => Chair.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Chiar(id: $id, title: $title, picture: $picture, description: $description, createDate: $createDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chair &&
        other.id == id &&
        other.title == title &&
        other.picture == picture &&
        other.description == description &&
        other.createDate == createDate &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        picture.hashCode ^
        description.hashCode ^
        createDate.hashCode ^
        status.hashCode;
  }
}
