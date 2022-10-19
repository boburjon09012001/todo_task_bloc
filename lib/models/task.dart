import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  String title;
  String description;
  String id;
  String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;
  Task(
      {required this.title,
      required this.id,
      required this.description,
      required this.date,
      this.isDone,
      this.isDeleted,
      this.isFavorite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith(
      {String? title,
      String? id,
      String? description,
      String? date,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      date: date ?? this.date,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone, 
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ,
      isDeleted: map['isDeleted'] ,
      isFavorite: map['isFavorite'] ,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        date,
        description,
        isDone,
        isDeleted,
        isFavorite,
      ];
}
