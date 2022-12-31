import 'package:pokedex/generated/json/base/json_convert_content.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_model_entity.dart';

PokemonModelEntity $PokemonModelEntityFromJson(Map<String, dynamic> json) {
  final PokemonModelEntity pokemonModelEntity = PokemonModelEntity();
  final int? baseExperience = jsonConvert.convert<int>(json['base_experience']);
  if (baseExperience != null) {
    pokemonModelEntity.baseExperience = baseExperience;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    pokemonModelEntity.height = height;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pokemonModelEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pokemonModelEntity.name = name;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    pokemonModelEntity.weight = weight;
  }
  final List<PokemonModelTypes>? types =
      jsonConvert.convertListNotNull<PokemonModelTypes>(json['types']);
  if (types != null) {
    pokemonModelEntity.types = types;
  }
  final List<PokemonModelStats>? stats =
      jsonConvert.convertListNotNull<PokemonModelStats>(json['stats']);
  if (stats != null) {
    pokemonModelEntity.stats = stats;
  }
  return pokemonModelEntity;
}

Map<String, dynamic> $PokemonModelEntityToJson(PokemonModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['base_experience'] = entity.baseExperience;
  data['height'] = entity.height;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['weight'] = entity.weight;
  data['types'] = entity.types.map((v) => v.toJson()).toList();
  data['stats'] = entity.stats.map((v) => v.toJson()).toList();
  return data;
}

PokemonModelTypes $PokemonModelTypesFromJson(Map<String, dynamic> json) {
  final PokemonModelTypes pokemonModelTypes = PokemonModelTypes();
  final int? slot = jsonConvert.convert<int>(json['slot']);
  if (slot != null) {
    pokemonModelTypes.slot = slot;
  }
  final PokemonModelTypesType? type =
      jsonConvert.convert<PokemonModelTypesType>(json['type']);
  if (type != null) {
    pokemonModelTypes.type = type;
  }
  return pokemonModelTypes;
}

Map<String, dynamic> $PokemonModelTypesToJson(PokemonModelTypes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['slot'] = entity.slot;
  data['type'] = entity.type.toJson();
  return data;
}

PokemonModelTypesType $PokemonModelTypesTypeFromJson(
    Map<String, dynamic> json) {
  final PokemonModelTypesType pokemonModelTypesType = PokemonModelTypesType();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pokemonModelTypesType.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pokemonModelTypesType.url = url;
  }
  return pokemonModelTypesType;
}

Map<String, dynamic> $PokemonModelTypesTypeToJson(
    PokemonModelTypesType entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

PokemonModelStats $PokemonModelStatsFromJson(Map<String, dynamic> json) {
  final PokemonModelStats pokemonModelStats = PokemonModelStats();
  final int? baseStat = jsonConvert.convert<int>(json['base_stat']);
  if (baseStat != null) {
    pokemonModelStats.baseStat = baseStat;
  }
  final int? effort = jsonConvert.convert<int>(json['effort']);
  if (effort != null) {
    pokemonModelStats.effort = effort;
  }
  final PokemonModelStatsStat? stat =
      jsonConvert.convert<PokemonModelStatsStat>(json['stat']);
  if (stat != null) {
    pokemonModelStats.stat = stat;
  }
  return pokemonModelStats;
}

Map<String, dynamic> $PokemonModelStatsToJson(PokemonModelStats entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['base_stat'] = entity.baseStat;
  data['effort'] = entity.effort;
  data['stat'] = entity.stat.toJson();
  return data;
}

PokemonModelStatsStat $PokemonModelStatsStatFromJson(
    Map<String, dynamic> json) {
  final PokemonModelStatsStat pokemonModelStatsStat = PokemonModelStatsStat();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pokemonModelStatsStat.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pokemonModelStatsStat.url = url;
  }
  return pokemonModelStatsStat;
}

Map<String, dynamic> $PokemonModelStatsStatToJson(
    PokemonModelStatsStat entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}
