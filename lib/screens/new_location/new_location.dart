import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_weather_project/models/location.dart';
import 'package:flutter_weather_project/screens/new_location/new_location_error_message.dart';
import 'package:flutter_weather_project/screens/new_location/new_location_tile.dart';
import 'package:flutter_weather_project/services/geolocation_service.dart';

class NewLocationForm extends StatefulWidget {
  const NewLocationForm({super.key});

  @override
  State<NewLocationForm> createState() => _NewLocationFormState();
}

class _NewLocationFormState extends State<NewLocationForm> {
  final TextEditingController _textController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  Timer? _debounce;

  bool _isError = false;

  List<Location> _foundLocations = [];

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _textController.dispose();
    super.dispose();
  }

  void _onChangeText(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    if (value.isEmpty) return;
    setState(() {
      _isError = false;
    });
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      final res = await GeolocationService.getLocationSearchResult(value);
      setState(() {
        if (res == null) {
          _isError = true;
        } else {
          _foundLocations = res;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(hintText: "Search..."),
                    onChanged: (String value) => _onChangeText(value),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child:
                        _isError
                            ? const NewLocationErrorMessage()
                            : ListView.builder(
                              shrinkWrap: true,
                              itemCount: _foundLocations.length,
                              itemBuilder:
                                  (context, index) => NewLocationTile(
                                    location: _foundLocations[index],
                                  ),
                            ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
