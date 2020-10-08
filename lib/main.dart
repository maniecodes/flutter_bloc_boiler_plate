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
      debugShowCheckedModeBanner: false,
      title: FlutterBlocLocalizations().appTitle,
      theme: AppTheme.getTheme(),
      localizationsDelegates: [FlutterBlocLocalizationsDelegate()],
      routes: {
        ChurchRoutes.home: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 4.0,
                      width: 18.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      height: 4.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            drawer: Drawer(),
            body: Home(),
          );
        },
      },
    );
  }
}
