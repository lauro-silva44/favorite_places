import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_place_provider.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

class AddNewPlaceScreen extends ConsumerStatefulWidget {
  const AddNewPlaceScreen({super.key});

  @override
  ConsumerState<AddNewPlaceScreen> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends ConsumerState<AddNewPlaceScreen> {
  final TextEditingController _placeName = TextEditingController();
  File? _selectedImage;
  void _onSave() {
    final enteredTitle = _placeName.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userPlaceProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _placeName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              controller: _placeName,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onImagePick: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const LocationInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _onSave,
              label: const Text('Add Place'),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
