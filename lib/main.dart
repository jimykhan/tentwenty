import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tentwenty_task/utils/application_sizing.dart';
import 'package:tentwenty_task/utils/color.dart';
import 'package:tentwenty_task/view_view_model/upcoming_movies/upcoming_movies_view.dart';
import 'package:tentwenty_task/view_view_model/upcoming_movies/upcoming_movies_view_model.dart';
GlobalKey<NavigatorState>? applicationContext = GlobalKey();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: bottomColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ApplicationSizing(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: applicationContext,
      title: 'TenTwenty Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xffF6F6FA),
        appBarTheme: AppBarTheme(
            backgroundColor: bottomColor,
            systemOverlayStyle: SystemUiOverlayStyle.dark
        )
      ),
      home:  UpComingMoviesView(),

    );
  }
}


