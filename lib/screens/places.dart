import 'package:favorite_places/providers/user_place_provider.dart';
import 'package:favorite_places/screens/add_new_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/places_list.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreen();
}

class _PlacesScreen extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;
  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlaceProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder(
              future: _placesFuture,
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : PlacesList(
                          placeList: userPlace,
                        )),
        ));
  }
}
