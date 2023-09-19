import 'package:favorite_places/providers/user_place_provider.dart';
import 'package:favorite_places/screens/add_new_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlace = ref.watch(userPlaceProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddNewPlaceScreen(),
                ),
              ),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PlacesList(
            placeList: userPlace,
          ),
        ));
  }
}
