import 'package:flutterexample/widgets/table_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "TableModelEntity") {
      return TableModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}