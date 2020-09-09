import 'package:book_time/data/repositories/SQL.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';

class FactoryAll{

  BookInterface bookSource;

  FactoryAll(int sourceType) {
    if (sourceType == 1) {
      this.bookSource = new SQL();
    }
  }
}
