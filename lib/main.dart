import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/app_blocs.dart';
import 'package:ulearning_app/app_events.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/bloc_provider.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app_states.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocproviders.allBlocproviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
               appBarTheme:const AppBarTheme(
                iconTheme: IconThemeData(
                  color: AppColors.primaryText
                ),
                elevation: 0,
                backgroundColor: Colors.white
              )
              ),
              debugShowCheckedModeBanner: false,
             
              home: const Welcome(),
              routes: {
                // '/myhomepage':(context)=>const MyHomePage(title: 'Home',),
                 '/signin':(context)=>const Signin(),
                 '/register':(context) => const Register(),
              },
               
              
              ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocBuilder<AppBlocs, AppStates>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    "${BlocProvider.of<AppBlocs>(context).state.counter}",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: "Herotag1",
              onPressed: (() =>
                  BlocProvider.of<AppBlocs>(context).add(Increment())),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "Herotag2",
              onPressed: (() =>
                  BlocProvider.of<AppBlocs>(context).add(Decrement())),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
