import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  final movieAPIKey = dotenv.env['API_KEY'];
}

final environmentConfigProvider =
    Provider<EnvironmentConfig>((ref) => EnvironmentConfig());
