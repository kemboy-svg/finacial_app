import 'package:flutter/widgets.dart';
import 'package:gcib_bank/bootstrap.dart';
import 'package:data_storage/data_storage.dart';
// void main() => runApp(const App());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataApi = DataStorage(localDB: await SharedPreferences.getInstance());

  bootstrap(dataApi: dataApi);
}