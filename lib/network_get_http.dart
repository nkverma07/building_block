import 'package:building_block/network_get_http_class.dart';
import 'package:flutter/material.dart';
class THisApp extends StatelessWidget {
  const THisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: GetNetwork(),
    );
  }
}

class GetNetwork extends StatefulWidget {
  const GetNetwork({super.key});

  @override
  State<GetNetwork> createState() => _GetNetworkState();
}

class _GetNetworkState extends State<GetNetwork> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blue,
        title: const Text(
          'N E T W O R K  D A T A',
          style: TextStyle(color: Color.fromARGB(60, 255, 255, 255),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
        return Text(snapshot.data!.title.toUpperCase());
            } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
            }
        
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
