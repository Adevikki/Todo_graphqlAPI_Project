import 'dart:convert';

class NewTask {
  final String id;
  final String developerId;
  final String description;
  final String createdAt;
  bool isCompleted;
  final String title;
  final String updatedAt;

  NewTask({
    required this.id,
    required this.developerId,
    required this.description,
    required this.createdAt,
    required this.isCompleted,
    required this.title,
    required this.updatedAt,
  });

  NewTask copyWith({
    String? id,
    String? developerId,
    String? description,
    String? createdAt,
    bool? isCompleted,
    String? title,
    String? updatedAt,
  }) {
    return NewTask(
      id: id ?? this.id,
      developerId: developerId ?? this.developerId,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'developer_id': developerId,
      'description': description,
      'createdAt': createdAt,
      'isCompleted': isCompleted,
      'title': title,
      'updatedAt': updatedAt,
    };
  }

  factory NewTask.fromMap(Map<String, dynamic> map) {
    return NewTask(
      id: map['id'] ?? '',
      developerId: map['developer_id'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['createdAt'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      title: map['title'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewTask.fromJson(String source) =>
      NewTask.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewTask(id: $id, developerId: $developerId, description: $description, createdAt: $createdAt, isCompleted: $isCompleted, title: $title, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewTask &&
        other.id == id &&
        other.developerId == developerId &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.isCompleted == isCompleted &&
        other.title == title &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        developerId.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        isCompleted.hashCode ^
        title.hashCode ^
        updatedAt.hashCode;
  }
}
