import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideahub_mobile/providers/data_provider.dart';
import '../models/idea_model.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(ideaDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ideas"),
      ),
      body: data.when(
        data: (d) {
          List<IdeaModel> ideaList = d.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ideaList.length,
                  itemBuilder: (_, index) {
                    final idea = ideaList[index];
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          '#${idea.id} ${idea.icon} ${idea.title}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(idea.createdAt,
                            style: const TextStyle(color: Colors.white)),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage((idea.logoURL ?? '')),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
