import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instanceFor(app: Firebase.app("my app")).signOut();
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text('Home'),
        body: Center(
            child: ElevatedButton(
                onPressed: () => {
                      () async {
                        try {
                          final image = await ImagePicker()
                              .pickVideo(source: ImageSource.gallery);
                          if (image == null) return;
                          final imageTemp = File(image.path);
                          print(imageTemp);
                        } on PlatformException catch (e) {
                          print('Failed to pick video: $e');
                        }
                      }
                    },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(400, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 146, 68, 130)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: const Text('Pick a Video'))));
      ),
    );
  }
}
