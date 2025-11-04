import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/app_export.dart';

/// This class is used in the [LocationSharingScreen] screen with GetX.

class LocationSharingModel {
  Rx<LatLng>? currentLocation;
  Rx<String>? selectedAddress;
  Rx<List<Marker>>? markers;
  Rx<bool>? isLocationSelected;

  LocationSharingModel({
    this.currentLocation,
    this.selectedAddress,
    this.markers,
    this.isLocationSelected,
  }) {
    currentLocation =
        currentLocation ?? Rx(LatLng(25.0760, 55.1090)); // Dubai Marina default
    selectedAddress = selectedAddress ??
        Rx("Al Marsa Street, Dubai Marina, Dubai, United Arab Emirates");
    markers = markers ?? Rx(<Marker>[]);
    isLocationSelected = isLocationSelected ?? Rx(false);
  }
}
