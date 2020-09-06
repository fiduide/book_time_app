import 'file:///C:/Users/doria/Desktop/book_time/lib/domain/repositories/BookInterface.dart';
import 'file:///C:/Users/doria/Desktop/book_time/lib/data/repositories/SQL.dart';


class FactoryAll{

  BookInterface adapterSource;

  FactoryAll(int sourcetype) {
    if (sourcetype == 1) {
      this.adapterSource = new SQL();
    }
  }
}
