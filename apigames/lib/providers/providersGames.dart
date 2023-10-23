import 'package:apigames/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://www.freetogame.com/api/games

class GamesProvider extends ChangeNotifier {
  final String _baseUrl = 'www.freetogame.com';

  List<GamesList> onDisplayGames = [];

  Future<void> getGameInfo() async {
    String games = 'api/games';
    var url = Uri.https(_baseUrl, games);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Imprimir la respuesta JSON en la consola
        print('Respuesta JSON de la API:');
        print(response.body);

        final gameInfo = Response.fromRawJson(response.body);
        onDisplayGames = gameInfo.info;
        notifyListeners();
      } else {
        // Si la solicitud no fue exitosa, imprimir el código de estado
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (error) {
      // Capturar y manejar cualquier excepción que ocurra durante la solicitud
      print('Error: $error');
    }
  }
}
