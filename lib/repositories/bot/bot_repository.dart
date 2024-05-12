import 'package:admin/config/request.dart';
import 'package:admin/repositories/bot/models/Bot.dart';

class BotRepository {
  Future<List<BotEntity>> getBotsList() async {
    final response = await DioClient().dio.get('/bots');
    final data = response.data as List<dynamic>;
    return data.map((item) => BotEntity.fromJson(item)).toList();
  }
}
