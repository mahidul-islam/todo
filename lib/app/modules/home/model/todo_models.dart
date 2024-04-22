import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/app/modules/home/model/todo_model.dart';

part 'todo_models.freezed.dart';
part 'todo_models.g.dart';

@freezed
class TodoModels with _$TodoModels {
  factory TodoModels({
    List<TodoModel>? todos,
    // @Default(true) bool update,
  }) = _TodoModels;

  factory TodoModels.fromJson(final Map<String, dynamic> json) =>
      _$TodoModelsFromJson(json);
}
