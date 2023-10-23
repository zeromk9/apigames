//https://www.freetogame.com/api/games

import 'dart:convert';

class GamesList {
  int id;
  String title;
  String thumbnail;
  String shortDescription;
  String gameUrl;
  Genre genre;
  Platform platform;
  String publisher;
  String developer;
  String releaseDate;
  String freetogameProfileUrl;

  GamesList({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  get gameImage {
    if (thumbnail != null) {
      return thumbnail;
    }
    return 'assets/imgs/nodata.jpg';
  }

  factory GamesList.fromRawJson(String str) =>
      GamesList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GamesList.fromJson(Map<String, dynamic> json) => GamesList(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        shortDescription: json["short_description"],
        gameUrl: json["game_url"],
        genre: genreValues.map[json["genre"]]!,
        platform: platformValues.map[json["platform"]]!,
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: json["release_date"],
        freetogameProfileUrl: json["freetogame_profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "short_description": shortDescription,
        "game_url": gameUrl,
        "genre": genreValues.reverse[genre],
        "platform": platformValues.reverse[platform],
        "publisher": publisher,
        "developer": developer,
        "release_date": releaseDate,
        "freetogame_profile_url": freetogameProfileUrl,
      };
}

enum Genre {
  ACTION_RPG,
  ARPG,
  BATTLE_ROYALE,
  CARD,
  CARD_GAME,
  FANTASY,
  FIGHTING,
  GENRE_MMORPG,
  MMO,
  MMOARPG,
  MMORPG,
  MOBA,
  RACING,
  SHOOTER,
  SOCIAL,
  SPORTS,
  STRATEGY
}

final genreValues = EnumValues({
  "Action RPG": Genre.ACTION_RPG,
  "ARPG": Genre.ARPG,
  "Battle Royale": Genre.BATTLE_ROYALE,
  "Card": Genre.CARD,
  "Card Game": Genre.CARD_GAME,
  "Fantasy": Genre.FANTASY,
  "Fighting": Genre.FIGHTING,
  " MMORPG": Genre.GENRE_MMORPG,
  "MMO": Genre.MMO,
  "MMOARPG": Genre.MMOARPG,
  "MMORPG": Genre.MMORPG,
  "MOBA": Genre.MOBA,
  "Racing": Genre.RACING,
  "Shooter": Genre.SHOOTER,
  "Social": Genre.SOCIAL,
  "Sports": Genre.SPORTS,
  "Strategy": Genre.STRATEGY
});

enum Platform { PC_WINDOWS, PC_WINDOWS_WEB_BROWSER, WEB_BROWSER }

final platformValues = EnumValues({
  "PC (Windows)": Platform.PC_WINDOWS,
  "PC (Windows), Web Browser": Platform.PC_WINDOWS_WEB_BROWSER,
  "Web Browser": Platform.WEB_BROWSER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
