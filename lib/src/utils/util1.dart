// Future<void> save() async {
//   await Future.delayed(const Duration(seconds: 2));
// }

// void main(List<String> args) async {
//   // with await
//   print("1");
//   await save();
//   print("2");

//   //with then
//   print("1");
//   save().then(
//     (_) => print("2"),
//   );
// }

// import 'dart:convert';

// class UserModel {
//   final String firstName;
//   final String lastName;
//   final String fullName;

//   UserModel({required this.firstName, required this.lastName})
//       : fullName = "$firstName $lastName";

//   // call default constructor
//   UserModel.fromJson(Map json)
//       : this(
//           firstName: json['last_name'],
//           lastName: json['last_name'],
//         );

//   // standalone constructor
//   UserModel.fromJson(Map json)
//       : firstName = json['first_name'],
//         lastName = json['last_name'],
//         fullName = "${json['first_name']} ${json['last_name']}";

//   // Using factory
//   factory UserModel.fromJsonString(String data) {
//     final user = jsonDecode(data);
//     return UserModel.fromJson(user);
//   }
// }

// extension IntExtension on int {
//   int squared() => this * this;
// }

// void main() {
//   var n = 9;
//   print(n.squared());
// }

// enum ValidationError {
//   requiredField,
//   invalidField,
// }

// extension ValidationErrorExtension on ValidationError {
//   String get description {
//     switch (this) {
//       case ValidationError.requiredField:
//         return "Campo obrigatório";
//       case ValidationError.invalidField:
//         return "Campo inválido";
//       default:
//         return "Erro genérico";
//     }
//   }
// }

// main() {
//   var err = ValidationError.invalidField;
//   print(err.description);
// }

// ///
// ///
// ///
// abstract class HttpAdapter {
//   get();
// }

// class HttpClient implements HttpAdapter {
//   @override
//   get() {
//     return "yes";
//   }
// }

// ///
// ///
// ///
// abstract class WeatherRepository {
//   Future<int> getWeather({required String city});
// }

// class HttpWeatherRepository implements WeatherRepository {
//   final HttpAdapter _http;
//   //
//   HttpWeatherRepository(this._http);

//   // implements the method in the abstract class
//   @override
//   Future<int> getWeather({required String city}) async {
//     // Send request, parse response, return
//     // Weather object or throw error
//     final data = await _http.get();

//     // Do something
//     return data;
//   }
// }

// void main(List<String> args) {
//   final teste = HttpWeatherRepository(HttpClient());

//   print(teste.getWeather(city: "jaragua"));
// }

// -----------------------------------------------

