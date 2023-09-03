import 'package:assistent_app/data/models/weather/weather_model.dart';

getWeather(WeatherModel weatherModel) {
  return weatherModel.forecasts[0].parts['day_short']!.condition;
}
