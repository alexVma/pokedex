import 'package:pokedex/generated/json/base/json_convert_content.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_model_entity.dart';

PokemonModelEntity $PokemonModelEntityFromJson(Map<String, dynamic> json) {
	final PokemonModelEntity pokemonModelEntity = PokemonModelEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		pokemonModelEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		pokemonModelEntity.name = name;
	}
	final List<PokemonModelTypes>? types = jsonConvert.convertListNotNull<PokemonModelTypes>(json['types']);
	if (types != null) {
		pokemonModelEntity.types = types;
	}
	return pokemonModelEntity;
}

Map<String, dynamic> $PokemonModelEntityToJson(PokemonModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['types'] =  entity.types.map((v) => v.toJson()).toList();
	return data;
}

PokemonModelTypes $PokemonModelTypesFromJson(Map<String, dynamic> json) {
	final PokemonModelTypes pokemonModelTypes = PokemonModelTypes();
	final int? slot = jsonConvert.convert<int>(json['slot']);
	if (slot != null) {
		pokemonModelTypes.slot = slot;
	}
	final PokemonModelTypesType? type = jsonConvert.convert<PokemonModelTypesType>(json['type']);
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

PokemonModelTypesType $PokemonModelTypesTypeFromJson(Map<String, dynamic> json) {
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

Map<String, dynamic> $PokemonModelTypesTypeToJson(PokemonModelTypesType entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['url'] = entity.url;
	return data;
}