import 'package:api_integration_crud_operation/controll/homescreencontroller.dart';
import 'package:api_integration_crud_operation/view/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
