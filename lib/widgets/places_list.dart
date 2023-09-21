import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.placeList});
  final List<Place> placeList;
  @override
  Widget build(BuildContext context) {
    if (placeList.isEmpty) {
      return Center(
        child: Text(
          'No place add yet!',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: placeList.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(
            placeList[index].image,
          ),
        ),
        title: Text(
          placeList[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          placeList[index].location.address,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => PlaceDetailScreen(
              place: placeList[index],
            ),
          ),
        ),
      ),
    );
  }
}
