import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/pixabay_provider.dart';

TextEditingController controller = TextEditingController();

class PixabayScreen extends StatelessWidget {
  const PixabayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final providerF = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
        ),
        actions: [
          IconButton(
            onPressed: (){
              providerF.fetchData(controller.text);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: provider.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
        itemCount: provider.data['hits'].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Card(
            child: Image.network(
                fit: BoxFit.cover,
                '${provider.data['hits'][index]['largeImageURL']}')),
      ),
    );
  }
}
