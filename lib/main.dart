import 'package:carclenx_demo/bloc/addproductsbloc/addproductsbloc.dart';
import 'package:carclenx_demo/bloc/fetchproductsbloc/fetchproductsbloc.dart';
import 'package:carclenx_demo/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark, //status bar brigtness
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductsBloc>(
            create: (BuildContext context) => GetProductsBloc()),
             BlocProvider<GetMakeBloc>(
            create: (BuildContext context) => GetMakeBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Kumbh',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0.0,
              centerTitle: true,
              color: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Kumbh',
              )),
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(child: HomeDashBoard()),
      ),
    );
  }
}

