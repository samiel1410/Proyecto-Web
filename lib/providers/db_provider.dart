//import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class DBProvider {
  Database database = sqlite3.openInMemory();

  void create() {
    database.execute('''
      CREATE TABLE Insumos(
        id INTEGER PRIMARY KEY,

      )
    ''');
  }

  /*Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'PagosApp.db');
  }*/
}
