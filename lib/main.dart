import 'package:ebook_app/utils/constants.dart';
import 'package:ebook_app/utils/custom_http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  CustomHttpClient customHttpClient =
      CustomHttpClient(testBaseUrl, Client(), _secureStorage);

  if (await _secureStorage.read(key: 'somekey') == null) {
    /// Replace the variable used for storing the login state with 'somekey' string here...
    //Not logged in
    runApp(
      MyApp(
        initialRoute: homeScreen,
      ),
    );
  } else {
    //If logged in
    runApp(
      MyApp(
        initialRoute: homeScreen,
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Controllers will be disposed in this block
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark(),
        initialRoute: widget.initialRoute,
        routes: {
          homeScreen: (_) {
            return MyHomePage();
          }
        },
      ),
    );
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       visualDensity: VisualDensity.adaptivePlatformDensity,
    //     ),
    //     darkTheme: ThemeData.dark(),
    //     initialRoute: widget.initialRoute,
    //     routes: {
    //       homeScreen: (_) {
    //         return
    //             // MultiProvider(
    //             //   providers: [
    //             //     // ChangeNotifierProvider.value(value: _homeController)   // Add the controller for the respective screens here
    //             //   ],
    //             // child:
    //             MyHomePage(); // just for now being ... to be changed later with the respective child for the provider
    //         // );
    //       }
    //     },
    //   ),
    //   home: MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coming soon"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[Text("MyHomePageScreen")],
      ),
    );
  }
}
