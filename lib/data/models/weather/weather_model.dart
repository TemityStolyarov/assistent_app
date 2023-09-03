import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final int now;
  @JsonKey(name: 'now_dt')
  final String nowDt;
  final Info info;
  @JsonKey(name: 'geo_object')
  final GeoObject geoObject;
  final Yesterday yesterday;
  final Fact fact;
  final List<Forecast> forecasts;
  final List<Hour>? hours;
  final Biomet? biomet;

  WeatherModel({
    required this.now,
    required this.nowDt,
    required this.info,
    required this.geoObject,
    required this.yesterday,
    required this.fact,
    required this.forecasts,
    required this.hours,
    required this.biomet,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Info {
  final bool n;
  final int geoid;
  final String url;
  final double lat;
  final double lon;
  @JsonKey(name: 'tzinfo')
  final TimeZoneInfo tzInfo;
  @JsonKey(name: 'def_pressure_mm')
  final int defPressureMm;
  @JsonKey(name: 'def_pressure_pa')
  final int defPressurePa;
  final String slug;
  final int zoom;
  final bool nr;
  final bool ns;
  final bool nsr;
  final bool p;
  final bool f;
  @JsonKey(name: '_h')
  final bool h;

  Info({
    required this.n,
    required this.geoid,
    required this.url,
    required this.lat,
    required this.lon,
    required this.tzInfo,
    required this.defPressureMm,
    required this.defPressurePa,
    required this.slug,
    required this.zoom,
    required this.nr,
    required this.ns,
    required this.nsr,
    required this.p,
    required this.f,
    required this.h,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class TimeZoneInfo {
  final String name;
  final String abbr;
  final bool dst;
  final int offset;

  TimeZoneInfo({
    required this.name,
    required this.abbr,
    required this.dst,
    required this.offset,
  });

  factory TimeZoneInfo.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TimeZoneInfoToJson(this);
}

@JsonSerializable()
class GeoObject {
  final District? district;
  final Locality locality;
  final Province province;
  final Country country;

  GeoObject({
    required this.district,
    required this.locality,
    required this.province,
    required this.country,
  });

  factory GeoObject.fromJson(Map<String, dynamic> json) =>
      _$GeoObjectFromJson(json);

  Map<String, dynamic> toJson() => _$GeoObjectToJson(this);
}

@JsonSerializable()
class District {
  final int id;
  final String name;

  District({
    required this.id,
    required this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}

@JsonSerializable()
class Locality {
  final int id;
  final String name;

  Locality({
    required this.id,
    required this.name,
  });

  factory Locality.fromJson(Map<String, dynamic> json) =>
      _$LocalityFromJson(json);

  Map<String, dynamic> toJson() => _$LocalityToJson(this);
}

@JsonSerializable()
class Province {
  final int id;
  final String name;

  Province({
    required this.id,
    required this.name,
  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}

@JsonSerializable()
class Country {
  final int id;
  final String name;

  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Yesterday {
  final int temp;

  Yesterday({
    required this.temp,
  });

  factory Yesterday.fromJson(Map<String, dynamic> json) =>
      _$YesterdayFromJson(json);

  Map<String, dynamic> toJson() => _$YesterdayToJson(this);
}

@JsonSerializable()
class Fact {
  final int temp;
  @JsonKey(name: 'feels_like')
  final int feelsLike;
  final String icon;
  final String condition;
  @JsonKey(name: 'is_thunder')
  final bool isThunder;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @JsonKey(name: 'pressure_mm')
  final int pressureMm;
  final int humidity;
  final String season;
  @JsonKey(name: 'uv_index')
  final int uvIndex;
  @JsonKey(name: 'wind_gust')
  final double windGust;

  Fact({
    required this.temp,
    required this.feelsLike,
    required this.icon,
    required this.condition,
    required this.isThunder,
    required this.windSpeed,
    required this.windDir,
    required this.pressureMm,
    required this.humidity,
    required this.season,
    required this.uvIndex,
    required this.windGust,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}

@JsonSerializable()
class Forecast {
  final String date;
  @JsonKey(name: 'date_ts')
  final int dateTs;
  final int week;
  final String sunrise;
  final String sunset;
  @JsonKey(name: 'rise_begin')
  final String riseBegin;
  @JsonKey(name: 'set_end')
  final String setEnd;
  @JsonKey(name: 'moon_code')
  final int moonCode;
  @JsonKey(name: 'moon_text')
  final String moonText;
  @JsonKey(name: 'parts')
  final Map<String, Part> parts;

  Forecast({
    required this.date,
    required this.dateTs,
    required this.week,
    required this.sunrise,
    required this.sunset,
    required this.riseBegin,
    required this.setEnd,
    required this.moonCode,
    required this.moonText,
    required this.parts,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class Part {
  @JsonKey(name: 'temp_min')
  final int? tempMin;
  @JsonKey(name: 'temp_avg')
  final int? tempAvg;
  @JsonKey(name: 'temp_max')
  final int? tempMax;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_gust')
  final double windGust;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @JsonKey(name: 'pressure_mm')
  final int pressureMm;
  final int humidity;
  @JsonKey(name: 'feels_like')
  final int feelsLike;
  final String condition;
  @JsonKey(name: 'uv_index')
  final int? uvIndex;

  Part({
    required this.tempMin,
    required this.tempAvg,
    required this.tempMax,
    required this.windSpeed,
    required this.windGust,
    required this.windDir,
    required this.pressureMm,
    required this.humidity,
    required this.feelsLike,
    required this.condition,
    required this.uvIndex,
});

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}

@JsonSerializable()
class Hour {
  final int hour;
  final int temp;
  @JsonKey(name: 'feels_like')
  final int feelsLike;
  final String icon;
  final String condition;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @JsonKey(name: 'pressure_mm')
  final int pressureMm;
  @JsonKey(name: 'pressure_pa')
  final int pressurePa;
  final int humidity;
  @JsonKey(name: 'prec_mm')
  final double precMm;
  @JsonKey(name: 'prec_prob')
  final int precProb;
  @JsonKey(name: 'prec_type')
  final int precType;
  @JsonKey(name: 'prec_strength')
  final double precStrength;
  @JsonKey(name: 'uv_index')
  final int uvIndex;

  Hour({
    required this.hour,
    required this.temp,
    required this.feelsLike,
    required this.icon,
    required this.condition,
    required this.windSpeed,
    required this.windDir,
    required this.pressureMm,
    required this.pressurePa,
    required this.humidity,
    required this.precMm,
    required this.precProb,
    required this.precType,
    required this.precStrength,
    required this.uvIndex,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}

@JsonSerializable()
class Biomet {
  @JsonKey(name: 'index_soil_moisture')
  final int indexSoilMoisture;
  @JsonKey(name: 'index_soil_temp')
  final int indexSoilTemp;
  @JsonKey(name: 'index_prec')
  final int indexPrec;

  Biomet({
    required this.indexSoilMoisture,
    required this.indexSoilTemp,
    required this.indexPrec,
  });

  factory Biomet.fromJson(Map<String, dynamic> json) => _$BiometFromJson(json);

  Map<String, dynamic> toJson() => _$BiometToJson(this);
}
