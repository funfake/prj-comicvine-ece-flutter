import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:comicvine/src/presentation/screens/MainScreen.dart';
import 'package:comicvine/src/presentation/screens/DetailsScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/bloc/issues_bloc.dart';
import 'package:comicvine/src/data/bloc/movies_bloc.dart';
import 'package:comicvine/src/data/bloc/series_bloc.dart';

void main() {
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<IssuesBloc>(
            create: (context) => IssuesBloc()..add(FetchIssuesEvent()),
          ),
          BlocProvider<MoviesBloc>(
            create: (context) => MoviesBloc()..add(FetchMoviesEvent()),
          ),
          BlocProvider<SeriesBloc>(
            create: (context) => SeriesBloc()..add(FetchSeriesEvent()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MainScreen(goRouter: _router);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ComicVine',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          background: Color(0xFF15232E),
          onBackground: Colors.white,
          primary: Color(0xFFFF8100),
          secondary: Color(0xFF778BA8),
          surface: Color(0xFF15232E),
          onSurface: Colors.white, // set default text color
          onPrimary: Color(0xFF12273C),
          onSecondary: Color(0xFF778BA8),
          error: Colors.red,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}