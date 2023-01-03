import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:pokedex/src/features/home_page/data/data_sources/remote_data_source.dart';
import 'package:pokedex/src/features/home_page/data/repositories/home_repository_impl.dart';

void main() {
  group('pokeApi Test', () {
    test('get first pokemon', () async {
      final mockHTTPClient = MockClient((request) async {
        final response = {
          "count": 1154,
          "next": "https://pokeapi.co/api/v2/pokemon/?offset=10&limit=10",
          "previous": null,
          "results": [
            {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"}
          ]
        };
        return Response(jsonEncode(response), 200);
      });

      RemoteDataSource rds = RemoteDataSource(mockHTTPClient);
      HomeRepositoryImpl repo = HomeRepositoryImpl(remoteDataSource: rds);
      final response2 = await repo.addPokemons(0);
      response2.fold((fail) {
        expect(true, false, reason: 'generic backend error');
      }, (data) {
        expect(data[0].name, 'bulbasaur');
      });
    });
  });
}
