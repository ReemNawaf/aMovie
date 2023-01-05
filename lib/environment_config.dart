// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  final movieAPIKey = 'd9addaa0d675af999f09f5df1bde131d';
}

final environmentConfigProvider =
    Provider<EnvironmentConfig>((ref) => EnvironmentConfig());
