import 'package:assistent_app/data/models/weather/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherAPI {
  final Dio _dio = Dio();

  Future<WeatherModel> getWeather({
    required double longitude,
    required double latitude,
  }) async {
    final response = await _dio.get(
      "https://api.weather.yandex.ru/v2/forecast?lat=$latitude&lon=$longitude&extra=true",
      data: {},
      options: Options(
        headers: {"X-Yandex-API-Key": "04cb5554-58af-47f9-afbc-ce5981bdcf58"},
      ),
    );
    if (response.statusCode == 200) {
      final json = response.data;
      final weatherModel = WeatherModel.fromJson(json);
      return weatherModel;
    } else {
      throw Exception('Error, status code: ${response.statusCode}');
    }
  }
}
