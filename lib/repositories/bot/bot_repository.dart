import 'package:admin/config/request.dart';
import 'package:admin/repositories/bot/models/Bot.dart';
import 'package:dio/dio.dart';

class BotRepository {
  Future<List<BotEntity>> getBotsList() async {
    final response = await DioClient().dio.get('/bots');
    final data = response.data as List<dynamic>;
    return data.map((item) => BotEntity.fromJson(item)).toList();
  }

  Future<Response<dynamic>> createBot({bot: Map<String, dynamic>}) async {
    print("=== START request");
    final res = await DioClient().dio.post('/bots', data: bot);
    return res;
  }
}
