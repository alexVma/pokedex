import 'package:flutter/material.dart';
import 'package:pokedex/simple_bloc_delegate.dart';
import 'package:pokedex/src/common/poke_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:pokedex/src/features/home_page/data/data_sources/remote_data_source.dart';
import 'package:pokedex/src/features/home_page/data/repositories/home_repository_impl.dart';
import 'package:pokedex/src/features/home_page/domain/use_cases/add_pokemons.dart';
import 'package:pokedex/src/features/home_page/presentation/bloc_manager/home_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();

  RemoteDataSource rds = RemoteDataSource('https://pokeapi.co/api/v2');
  HomeRepositoryImpl repo = HomeRepositoryImpl(remoteDataSource: rds);
  AddPokemons ap = AddPokemons(repo);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(addPokemonsUseCase: ap),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter PokeDex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokeBottomNavigationBar(),
    );
  }
}
