import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/observer.dart';
import 'package:movies_app/core/services_locator/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/cubit.dart';
import 'package:movies_app/movies/presentation/controller/states.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

void main() async {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoviesCubit()
        ..getNowPlayingMovies()
        ..getPopularMovies()
        ..gettopRatedMovies(),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {},
        builder: (context, state) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainMoviesScreen(),
        ),
      ),
    );
  }
}
