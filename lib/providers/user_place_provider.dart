import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:riverpod/riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title, File image) {
    final newPlace= Place(title: title, image: image);
    state = [newPlace,...state];
  }

  void removePlace(Place place) {
    state = state.where((m) => m.id != place.id).toList();
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) => UserPlacesNotifier());
