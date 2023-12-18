import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("photos");
      //print(response.data.toString());
      return response.data;
    } catch (e) {
      ////print(e.toString());
      return [];
    }
  }
}
