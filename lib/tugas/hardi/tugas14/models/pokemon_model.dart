class PokemonItemModel {
  final int id;
  final String name;
  final String url;
  final String imageUrl;

  const PokemonItemModel({
    required this.id,
    required this.name,
    required this.url,
    required this.imageUrl,
  });

  factory PokemonItemModel.fromJson(Map<String, dynamic> json) {
    final String rawUrl = json['url'] as String? ?? '';
    final Uri? parsedUri = Uri.tryParse(rawUrl);
    int parsedId = 1;
    if (parsedUri != null) {
      final segments = parsedUri.pathSegments
          .where((s) => s.isNotEmpty)
          .toList();
      if (segments.isNotEmpty) {
        parsedId = int.tryParse(segments.last) ?? 1;
      }
    }

    final rawName = json['name'] as String? ?? '';
    final officialArtworkUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$parsedId.png';

    return PokemonItemModel(
      id: parsedId,
      name: rawName,
      url: rawUrl,
      imageUrl: officialArtworkUrl,
    );
  }
}

class PokemonDetailModel {
  final int id;
  final String name;
  final String imageUrl;
  final double height;
  final double weight;
  final int baseExperience;
  final List<String> types;
  final List<String> abilities;
  final Map<String, int> stats;

  const PokemonDetailModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.types,
    required this.abilities,
    required this.stats,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    final int id = json['id'] as int? ?? 1;
    final String name = json['name'] as String? ?? '';

    String? img;
    if (json['sprites'] != null && json['sprites']['other'] != null) {
      final other = json['sprites']['other'] as Map<String, dynamic>;
      if (other['official-artwork'] != null) {
        img = other['official-artwork']['front_default'] as String?;
      }
    }
    img ??=
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

    final int rawHeight = json['height'] as int? ?? 0;
    final int rawWeight = json['weight'] as int? ?? 0;
    final int baseExp = json['base_experience'] as int? ?? 0;

    final List<String> typeList = [];
    if (json['types'] is List) {
      for (final t in json['types'] as List) {
        if (t is Map && t['type'] != null && t['type']['name'] != null) {
          typeList.add(t['type']['name'].toString());
        }
      }
    }

    final List<String> abilityList = [];
    if (json['abilities'] is List) {
      for (final a in json['abilities'] as List) {
        if (a is Map && a['ability'] != null && a['ability']['name'] != null) {
          abilityList.add(a['ability']['name'].toString());
        }
      }
    }

    final Map<String, int> statMap = {};
    if (json['stats'] is List) {
      for (final s in json['stats'] as List) {
        if (s is Map && s['stat'] != null && s['stat']['name'] != null) {
          final statName = s['stat']['name'].toString();
          final statVal = s['base_stat'] as int? ?? 0;
          statMap[statName] = statVal;
        }
      }
    }

    return PokemonDetailModel(
      id: id,
      name: name,
      imageUrl: img,
      height: rawHeight / 10.0,
      weight: rawWeight / 10.0,
      baseExperience: baseExp,
      types: typeList,
      abilities: abilityList,
      stats: statMap,
    );
  }
}
