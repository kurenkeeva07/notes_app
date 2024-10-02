import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  @override
  List<Object?> get props => [
    id,
    title,
    content,
  ];
}