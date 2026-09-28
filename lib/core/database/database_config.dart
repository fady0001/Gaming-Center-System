import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/sessions/data/models/session_model.dart';
import '../../features/tables/data/models/table_model.dart';
import '../../features/carts/data/models/cart_models.dart';
import '../../features/computers/data/models/computer_device_model.dart';
import '../../features/menu/data/models/menu_item_model.dart';
import '../../features/playstation/data/models/playstation_device_model.dart';


class DatabaseConfig {
  DatabaseConfig._();

  static Isar? _instance;


  static final List<CollectionSchema<dynamic>> _schemas = [
    SessionModelSchema,
    TableModelSchema,
    MenuItemModelSchema,
    CartModelSchema,
    CartItemModelSchema,
    CartPlayLineModelSchema,
    PlayStationDeviceModelSchema,
    ComputerDeviceModelSchema,

  ];

  static const String databaseName = 'billiard_hall_db';

  static Isar get instance {
    if (_instance == null) {
      throw StateError(
        'قاعدة البيانات لم تُفتح بعد. تأكد من استدعاء DatabaseConfig.open() '
        'داخل main() بعد التحقق من الترخيص وقبل تشغيل أي واجهة.',
      );
    }
    return _instance!;
  }

  static bool get isOpen => _instance != null;

  static Future<Isar> open() async {
    if (_instance != null) return _instance!;

    final dir = await getApplicationSupportDirectory();
    _instance = await Isar.open(
      _schemas,
      directory: dir.path,
      name: databaseName,
      inspector: false, 
    );
    return _instance!;
  }


  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }
}
