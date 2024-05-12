import 'package:admin/config/request.dart';
import 'package:admin/repositories/api_key/models/ApiKey.dart';

class ApiKeyRepository {
  Future<List<ApiKeyEntity>> getApiKeysList() async {
    final response = await DioClient().dio.get('/api_keys');
    final data = response.data as List<dynamic>;
    return data.map((item) => ApiKeyEntity.fromJson(item)).toList();
  }
}
