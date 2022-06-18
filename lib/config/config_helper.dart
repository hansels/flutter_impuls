import '../../helpers/graphql_helper.dart';

class ConfigHelper extends GraphQLHelper {
  Future<String> config(String key) async {
    String _query = '''
      query {
        config(key: "$key")
      }
    ''';

    return await query(
      "config",
      (r) => r as String,
      _query,
    );
  }
}
