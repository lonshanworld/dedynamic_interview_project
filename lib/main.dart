import 'package:dedynamicinterviewprojectbylonshan/controllers/cart_provider.dart';
import 'package:dedynamicinterviewprojectbylonshan/controllers/products_provider.dart';
import 'package:dedynamicinterviewprojectbylonshan/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(
          create: (_)=>ProductsProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_)=>CartProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Dedynamic Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
