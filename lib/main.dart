import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comicvine/src/presentation/screens/MainScreen.dart';
import 'package:comicvine/src/presentation/screens/DetailsScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/bloc/comicvine_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        // Create the ComicVineBloc
        ComicVineBloc comicVineBloc = ComicVineBloc();
        // Add the FetchDataEvent to the ComicVineBloc
        comicVineBloc.add(FetchDataEvent());
        // Return the ComicVineBloc
        return comicVineBloc;
      },
      child: const MyApp(),
    ),
  );
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MainScreen(goRouter: _router);
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: 'details',
      //     builder: (BuildContext context, GoRouterState state) {
      //       return DetailsScreen(goRouter: _router, title: "Détails", imageUrl: "https://comicvine.gamespot.com/a/uploads/scale_small/0/4/46617-3824-55260-1-wonder-woman.jpg");
      //     },
      //   ),
      // ],
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