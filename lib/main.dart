import 'package:dynamic_calculate_average/calculate_average.dart';
import 'package:dynamic_calculate_average/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




void main()
{

runApp(MyApp());
}

//  Future<void> main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primarySwatch: Constants.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Material App',
      home: CalculateAveragePage()
    );
  }
}