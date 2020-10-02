import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_bloc.dart';
import 'package:flutter_bloc_boiler_plate/repositories/hymns_repository.dart';
import 'package:flutter_bloc_boiler_plate/resources/hymns_api_provider.dart';
import 'package:flutter_bloc_boiler_plate/resources/songs_api_provider.dart';
import 'package:flutter_bloc_boiler_plate/screens/home.dart';
import 'package:flutter_bloc_boiler_plate/utils/utils.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final HymnsApiProvider hymnsRepository = HymnsApiProvider();
  final SongsApiProvider songsRepository = SongsApiProvider();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HymnsBloc>(
        create: (context) =>
            HymnsBloc(hymnsRepository: hymnsRepository)..add(HymnsLoaded()),
      ),
      BlocProvider<SongsBloc>(
        create: (context) => SongsBloc(songsRepository: songsRepository),
      )
    ],
    child: MyApp(hymnsRepository: hymnsRepository),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, @required HymnsRepository hymnsRepository})
      : assert(hymnsRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
      statusBarBrightness:
          AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          AppTheme.isLightTheme ? Colors.white : Colors.black,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness:
          AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
    ));
    return MaterialApp(
      title: FlutterBlocLocalizations().appTitle,
      theme: AppTheme.getTheme(),
      localizationsDelegates: [FlutterBlocLocalizationsDelegate()],
      routes: {
        ChurchRoutes.home: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(FlutterBlocLocalizations.of(context).appTitle),
            ),
            drawer: Drawer(),
            body: Home(),
          );
        },
      },
    );
  }
}
