import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final String imageUrl;
  final List<String> types;
  final List<Stats> stats;

  const Pokemon(
      {required this.id,
      required this.name,
      required this.types,
      required this.imageUrl,
      required this.stats,
      required this.baseExperience,
      required this.height,
      required this.weight});

  @override
  List<Object> get props => [id, name, types, imageUrl, stats];
}

class Stats {
  final String name;
  final int baseValue;

  Stats({required this.name, required this.baseValue});
}
