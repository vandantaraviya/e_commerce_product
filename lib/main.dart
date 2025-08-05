import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/bottom_nav_bar/presentation/provider/bottom_nav_bar_provider.dart';
import 'features/bottom_nav_bar/presentation/provider/product_provider.dart';
import 'features/bottom_nav_bar/presentation/view/home/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..fetchProducts(),
        ),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 18),
        ),
      ),
      home: HomePage(),
    );
  }
}
