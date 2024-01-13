import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        Album(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<Album> createAlbum(String title) async {
  final response =
      await http.post(Uri.parse("https://jsonplaceholder.typicode.com/albums"),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      
    }),
      );

  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception("Data Not Found");
  }
}

class SendData extends StatelessWidget {
  const SendData({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SendDataHome(),
    );
  }
}

class SendDataHome extends StatefulWidget {
  const SendDataHome({super.key});

  @override
  State<SendDataHome> createState() => _SendDataomeState();
}

class _SendDataomeState extends State<SendDataHome> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(150, 100, 200, 300),
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(150, 100, 200, 300),
        title: const Text("S E N D  D A T A"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                futureAlbum = createAlbum(_controller.text.toString());
              });
            },
            child: const Text('Create Data'))
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
