/*

Isolar modelos de domínio (ou entidades) dos detalhes de implementação 
das fontes de dados na camada de dados.

Converter objetos de transferência de dados em entidades validadas 
que são compreendidas pela camada de domínio

(opcionalmente) Executar operações como armazenamento em cache de dados.

----

Conversando com APIs REST

Conversar com bancos de dados locais ou remotos 
(por exemplo, Sembast, Hive, Firestore, etc.)

Conversar com APIs específicas do dispositivo 
(por exemplo, permissões, câmera, localização etc.)

----

Bom local para uso dos construtores .fromJson


*/



/*

import 'package:http/http.dart' as http;

abstract class WeatherRepository {
  Future getWeather({required String city});
}

// import 'package:http/http.dart' as http;

class HttpWeatherRepository implements WeatherRepository {
  // custom class defining all the API details
  final ISomeWeatherAPI api;
  // client for making calls to the API
  final http.Client client;

  HttpWeatherRepository({required this.api, required this.client});

  // implements the method in the abstract class
  @override
  Future getWeather({required String city}) async {
    // send request, parse response, return Weather object or throw error
  }
}


// ----------------------------

//
// Initializing repositories in the app - BLOC sample
//
import 'package:flutter_bloc/flutter_bloc.dart';

RepositoryProvider<WeatherRepository>(
  create: (_) => HttpWeatherRepository(api: SomeWeatherAPI(), client: http.Client()),
  child: MyApp(),
))


//
// The bottom line is the same: once you've initialized your repository, 
// you can access it anywhere else in your app (widgets, blocs, controllers, etc.).
// ----------------------------


*/