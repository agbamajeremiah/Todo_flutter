import 'package:crud_firebase/constants/api_constant.dart';
import 'package:crud_firebase/models/weather.dart';
import 'package:crud_firebase/utils/api_request.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  var weatherBox;
  List<String> cities = ['New york', 'London','Istanbul', 'Lagos', 'Paris', 'Berlin', 'Accra',  ]; //'Paris', 'Berlin''London','Istanbul',
  List<Weather> allWeatherData = [];
  void initialise() async {
     weatherBox = await Hive.openBox<Weather>('weatherBox');
    print("this");
    //  await getCurrentWeather(cities[0]);
    await getAllCitiesCurrentWeather();
  }

  Future getAllCitiesCurrentWeather() async {
    if(weatherBox == null){
     weatherBox = await Hive.openBox<Weather>('weatherBox');

    }

    print("yeah!");
    for (int i = 0; i < cities.length; i++) {
      Map<String, dynamic> queryParam = {
        'access_key': API_ACCESS_KEY,
        'query': cities[i]
      };
      final Response response =
          await getResquest(url: 'current', queryParam: queryParam);
      if (response.statusCode == 200) {
        final Weather singleData = Weather.fromJson(response.data);
        
        weatherBox.add(singleData);

        // allWeatherData.add(singleData);
      }
    }
    print(allWeatherData);
  }

  Future getCurrentWeather(String city) async {
    Map<String, dynamic> queryParam = {
      'access_key': API_ACCESS_KEY,
      'query': city
    };
    final Response response =
        await getResquest(url: 'current', queryParam: queryParam);
    if (response.statusCode == 200) {
      final Weather singleData = Weather.fromJson(response.data);
      print(singleData.current);
    }
  }
}
