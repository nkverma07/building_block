import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'network data',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ableroof.com%2Fblog%2Favoid-window-gimmicks%2F&psig=AOvVaw1wFAaozPhrpyK8ZUwCe_I4&ust=1704537138930000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMDtofCFxoMDFQAAAAAdAAAAABAD');
        },
      ),
    );
  }
}
