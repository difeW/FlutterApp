import 'package:flutter/material.dart';
import 'package:gotech_app/router/router_manager.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 179, 60, 0),
          scaffoldBackgroundColor: const Color.fromARGB(255, 244, 243, 242)),
      onGenerateRoute: RouteManager.generateRoute,
      initialRoute: RouteManager.home,
    );
  }
}
