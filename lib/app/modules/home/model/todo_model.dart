import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  factory TodoModel({
    final String? title,
    final String? description,
    final DateTime? date,
    @Default(true) final bool completed,
  }) = _TodoModel;

  factory TodoModel.fromJson(final Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
