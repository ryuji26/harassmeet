import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harassmeet/firebase_options.dart';
import 'package:harassmeet/providers/user_provider.dart';
import 'package:harassmeet/responsive/responsive_layout.dart';
import 'package:harassmeet/responsive/web_screen_layout.dart';
import 'package:harassmeet/screens/login_screen.dart';
import 'package:harassmeet/utils/colors.dart';
import 'package:provider/provider.dart';
import 'responsive/mobile_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // モバイルorWebを判定してアプリを初期化
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyB2J7bGkpMM6U4lRFM0X0IsBJ9GXQJVwKI',
        appId: '1:103202454304:web:9f437b11d89de38fca3545',
        messagingSenderId: '103202454304',
        projectId: 'new-harassmeet',
        authDomain: 'new-harassmeet.firebaseapp.com',
        storageBucket: 'new-harassmeet.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Harassmeet',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // スナップショットのデータの有無を確認する
              if (snapshot.hasData) {
                // スナップショットにデータがあり、ログインしている場合はWebかモバイルかを確認し、それに応じたレイアウトを表示する
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // スナップショットのconnectionStateがwaitingなら、Circularを表示
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
