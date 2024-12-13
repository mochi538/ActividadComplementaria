import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class VideoPlatform {
  Map<String, int> videos = {};
  int suscriptores;

  VideoPlatform({this.suscriptores = 0});

 
  void uploadVideo(String title, int duration) {
    if (videos.containsKey(title)) {
      print("El video ya existe.");
    } else {
      videos[title] = duration;
      print("Video subido exitosamente.");
    }
  }


  void removeVideo(String title) {
    if (videos.containsKey(title)) {
      videos.remove(title);
      print("Video eliminado.");
    } else {
      print("El video no se encuentra en TutuMusic");
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final VideoPlatform plataforma = VideoPlatform(suscriptores: 1000);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  void addVideo() {
    String title = titleController.text;
    int? duration = int.tryParse(durationController.text);
    if (title.isNotEmpty && duration != null) {
      setState(() {
        plataforma.uploadVideo(title, duration);
        titleController.clear();
        durationController.clear();
      });
    }
  }

  void removeVideo(String title) {
    setState(() {
      plataforma.removeVideo(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Plataforma TutuMusic")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Título del Video"),
              ),
              TextField(
                controller: durationController,
                decoration: const InputDecoration(labelText: "Duración (min)"),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: addVideo,
                child: const Text("Subir Video"),
              ),
              const SizedBox(height: 20),
              const Text("Videos Subidos"),
              Expanded(
                child: ListView(
                  children: plataforma.videos.entries.map((entry) {
                    return ListTile(
                      title: Text("Título: \${entry.key}"),
                      subtitle: Text("Duración: \${entry.value} minutos"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeVideo(entry.key),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





