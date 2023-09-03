// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      now: json['now'] as int,
      nowDt: json['now_dt'] as String,
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      geoObject: GeoObject.fromJson(json['geo_object'] as Map<String, dynamic>),
      yesterday: Yesterday.fromJson(json['yesterday'] as Map<String, dynamic>),
      fact: Fact.fromJson(json['fact'] as Map<String, dynamic>),
      forecasts: (json['forecasts'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
      biomet: json['biomet'] == null
          ? null
          : Biomet.fromJson(json['biomet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'now': instance.now,
      'now_dt': instance.nowDt,
      'info': instance.info,
      'geo_object': instance.geoObject,
      'yesterday': instance.yesterday,
      'fact': instance.fact,
      'forecasts': instance.forecasts,
      'hours': instance.hours,
      'biomet': instance.biomet,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      n: json['n'] as bool,
      geoid: json['geoid'] as int,
      url: json['url'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      tzInfo: TimeZoneInfo.fromJson(json['tzinfo'] as Map<String, dynamic>),
      defPressureMm: json['def_pressure_mm'] as int,
      defPressurePa: json['def_pressure_pa'] as int,
      slug: json['slug'] as String,
      zoom: json['zoom'] as int,
      nr: json['nr'] as bool,
      ns: json['ns'] as bool,
      nsr: json['nsr'] as bool,
      p: json['p'] as bool,
      f: json['f'] as bool,
      h: json['_h'] as bool,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'n': instance.n,
      'geoid': instance.geoid,
      'url': instance.url,
      'lat': instance.lat,
      'lon': instance.lon,
      'tzinfo': instance.tzInfo,
      'def_pressure_mm': instance.defPressureMm,
      'def_pressure_pa': instance.defPressurePa,
      'slug': instance.slug,
      'zoom': instance.zoom,
      'nr': instance.nr,
      'ns': instance.ns,
      'nsr': instance.nsr,
      'p': instance.p,
      'f': instance.f,
      '_h': instance.h,
    };

TimeZoneInfo _$TimeZoneInfoFromJson(Map<String, dynamic> json) => TimeZoneInfo(
      name: json['name'] as String,
      abbr: json['abbr'] as String,
      dst: json['dst'] as bool,
      offset: json['offset'] as int,
    );

Map<String, dynamic> _$TimeZoneInfoToJson(TimeZoneInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'abbr': instance.abbr,
      'dst': instance.dst,
      'offset': instance.offset,
    };

GeoObject _$GeoObjectFromJson(Map<String, dynamic> json) => GeoObject(
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      locality: Locality.fromJson(json['locality'] as Map<String, dynamic>),
      province: Province.fromJson(json['province'] as Map<String, dynamic>),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeoObjectToJson(GeoObject instance) => <String, dynamic>{
      'district': instance.district,
      'locality': instance.locality,
      'province': instance.province,
      'country': instance.country,
    };

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Locality _$LocalityFromJson(Map<String, dynamic> json) => Locality(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$LocalityToJson(Locality instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Yesterday _$YesterdayFromJson(Map<String, dynamic> json) => Yesterday(
      temp: json['temp'] as int,
    );

Map<String, dynamic> _$YesterdayToJson(Yesterday instance) => <String, dynamic>{
      'temp': instance.temp,
    };

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      temp: json['temp'] as int,
      feelsLike: json['feels_like'] as int,
      icon: json['icon'] as String,
      condition: json['condition'] as String,
      isThunder: json['is_thunder'] as bool,
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDir: json['wind_dir'] as String,
      pressureMm: json['pressure_mm'] as int,
      humidity: json['humidity'] as int,
      season: json['season'] as String,
      uvIndex: json['uv_index'] as int,
      windGust: (json['wind_gust'] as num).toDouble(),
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'icon': instance.icon,
      'condition': instance.condition,
      'is_thunder': instance.isThunder,
      'wind_speed': instance.windSpeed,
      'wind_dir': instance.windDir,
      'pressure_mm': instance.pressureMm,
      'humidity': instance.humidity,
      'season': instance.season,
      'uv_index': instance.uvIndex,
      'wind_gust': instance.windGust,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      date: json['date'] as String,
      dateTs: json['date_ts'] as int,
      week: json['week'] as int,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      riseBegin: json['rise_begin'] as String,
      setEnd: json['set_end'] as String,
      moonCode: json['moon_code'] as int,
      moonText: json['moon_text'] as String,
      parts: (json['parts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Part.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'date': instance.date,
      'date_ts': instance.dateTs,
      'week': instance.week,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'rise_begin': instance.riseBegin,
      'set_end': instance.setEnd,
      'moon_code': instance.moonCode,
      'moon_text': instance.moonText,
      'parts': instance.parts,
    };

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      tempMin: json['temp_min'] as int?,
      tempAvg: json['temp_avg'] as int?,
      tempMax: json['temp_max'] as int?,
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windGust: (json['wind_gust'] as num).toDouble(),
      windDir: json['wind_dir'] as String,
      pressureMm: json['pressure_mm'] as int,
      humidity: json['humidity'] as int,
      feelsLike: json['feels_like'] as int,
      condition: json['condition'] as String,
      uvIndex: json['uv_index'] as int?,
    );

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'temp_min': instance.tempMin,
      'temp_avg': instance.tempAvg,
      'temp_max': instance.tempMax,
      'wind_speed': instance.windSpeed,
      'wind_gust': instance.windGust,
      'wind_dir': instance.windDir,
      'pressure_mm': instance.pressureMm,
      'humidity': instance.humidity,
      'feels_like': instance.feelsLike,
      'condition': instance.condition,
      'uv_index': instance.uvIndex,
    };

Hour _$HourFromJson(Map<String, dynamic> json) => Hour(
      hour: json['hour'] as int,
      temp: json['temp'] as int,
      feelsLike: json['feels_like'] as int,
      icon: json['icon'] as String,
      condition: json['condition'] as String,
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDir: json['wind_dir'] as String,
      pressureMm: json['pressure_mm'] as int,
      pressurePa: json['pressure_pa'] as int,
      humidity: json['humidity'] as int,
      precMm: (json['prec_mm'] as num).toDouble(),
      precProb: json['prec_prob'] as int,
      precType: json['prec_type'] as int,
      precStrength: (json['prec_strength'] as num).toDouble(),
      uvIndex: json['uv_index'] as int,
    );

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'hour': instance.hour,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'icon': instance.icon,
      'condition': instance.condition,
      'wind_speed': instance.windSpeed,
      'wind_dir': instance.windDir,
      'pressure_mm': instance.pressureMm,
      'pressure_pa': instance.pressurePa,
      'humidity': instance.humidity,
      'prec_mm': instance.precMm,
      'prec_prob': instance.precProb,
      'prec_type': instance.precType,
      'prec_strength': instance.precStrength,
      'uv_index': instance.uvIndex,
    };

Biomet _$BiometFromJson(Map<String, dynamic> json) => Biomet(
      indexSoilMoisture: json['index_soil_moisture'] as int,
      indexSoilTemp: json['index_soil_temp'] as int,
      indexPrec: json['index_prec'] as int,
    );

Map<String, dynamic> _$BiometToJson(Biomet instance) => <String, dynamic>{
      'index_soil_moisture': instance.indexSoilMoisture,
      'index_soil_temp': instance.indexSoilTemp,
      'index_prec': instance.indexPrec,
    };
