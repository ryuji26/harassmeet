import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:harassmeet/data/data.dart';
import 'package:harassmeet/providers/user_provider.dart';
import 'package:harassmeet/repository/post_data_dao.dart';
import 'package:harassmeet/responsive/responsive_layout.dart';
import 'package:harassmeet/responsive/web_screen_layout.dart';
import 'package:harassmeet/screens/login_screen.dart';
import 'package:harassmeet/screens/postScreen.dart';
import 'package:harassmeet/screens/signup_screen.dart';
import 'package:harassmeet/utils/colors.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'responsive/mobile_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   String? data;

//   int _counter = 0;
//   PostDataDao _postDataDao = PostDataDao();
//   late StreamProvider _streamProvider;

//   @override
//   void initState() {
//     _streamProvider = StreamProvider<List<PostData>>((ref) => _postDataDao
//         .getSnapshot()
//         .map((e) => e.docs.map((data) => _convert(data.data())).toList()));
//   }

//   PostData _convert(Object? obj) {
//     if (obj == null) {
//       return PostData(dateTime: DateTime.now(), count: -1);
//     }

//     var map = obj as Map<String, dynamic>;
//     return PostData.fromJson(map);
//   }

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });

//     PostData postData = PostData(dateTime: DateTime.now(), count: _counter);
//     _postDataDao.savePostData(postData);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("掲示板デモ"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                 return PostScreen();
//               }));
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           const Text('You ~~~~~~~~'),
//           Text(
//             '$_counter',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//           Consumer(builder: (context, ref, child) {
//             final provider = ref.watch(_streamProvider);
//             return provider.when(
//                 loading: () => const CircularProgressIndicator(),
//                 error: (error, stack) => Text('Error: $error'),
//                 data: (data) {
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: data.length,
//                       itemBuilder: (context, index) {
//                         PostData postData = data[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             title: Text('${postData.dateTime}'),
//                             trailing: Text('${postData.count}'),
//                             tileColor: Colors.lightBlueAccent,
//                           ),
//                         );
//                       });
//                 });
//           })
//         ]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
