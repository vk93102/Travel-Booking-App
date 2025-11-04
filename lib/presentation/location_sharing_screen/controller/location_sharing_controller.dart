import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_export.dart';
import '../models/location_sharing_model.dart';

class LocationSharingController extends GetxController {
  final locationSharingModel = Rx<LocationSharingModel?>(null);
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    locationSharingModel.value = LocationSharingModel();
    _initializeLocation();
  }

  @override
  void onClose() {
    mapController?.dispose();
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onMapTapped(LatLng tappedPoint) {
    locationSharingModel.value?.currentLocation!.value = tappedPoint;
    _updateMarker(tappedPoint);
    _updateAddress(tappedPoint);
  }

  void _updateMarker(LatLng position) {
    final marker = Marker(
        markerId: MarkerId('selected_location'),
        position: position,
        infoWindow: InfoWindow(
            title: 'Selected Location',
            snippet: locationSharingModel.value?.selectedAddress!.value ??
                'Tap to select location'));

    locationSharingModel.value?.markers!.value = [marker];
    locationSharingModel.refresh();
  }

  void _updateAddress(LatLng position) {
    // In a real app, you would use geocoding to get the actual address
    locationSharingModel.value?.selectedAddress!.value =
        'Selected location: ${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}';
  }

  void _initializeLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar('Location Service',
            'Location services are disabled. Please enable them.',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Location Permission', 'Location permissions are denied',
              snackPosition: SnackPosition.BOTTOM);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar('Location Permission',
            'Location permissions are permanently denied',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);

      locationSharingModel.value?.currentLocation!.value = currentLatLng;
      _updateMarker(currentLatLng);

      // Move camera to current location
      if (mapController != null) {
        mapController!.animateCamera(CameraUpdate.newLatLng(currentLatLng));
      }
    } catch (e) {
      // Use default Dubai Marina location if location access fails
      LatLng defaultLocation = LatLng(25.0760, 55.1090);
      locationSharingModel.value?.currentLocation!.value = defaultLocation;
      _updateMarker(defaultLocation);
    }
  }

  void onNextPressed() {
    if (locationSharingModel.value?.currentLocation!.value == null) {
      Get.snackbar('Location Required', 'Please select a location on the map',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Navigate to next screen - PropertyDetailsSetupScreen
    Get.toNamed(AppRoutes.propertyDetailsSetupScreen);
  }
}
