import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PropertyAmenitiesSelectionScreen] screen with GetX.

class PropertyAmenitiesSelectionModel {
  Rx<String>? headerTitle;
  Rx<String>? headerSubtitle;
  Rx<String>? standoutSectionTitle;
  Rx<String>? safetySectionTitle;

  PropertyAmenitiesSelectionModel({
    this.headerTitle,
    this.headerSubtitle,
    this.standoutSectionTitle,
    this.safetySectionTitle,
  }) {
    headerTitle =
        headerTitle ?? Rx("Tell us the essentials about your property");
    headerSubtitle = headerSubtitle ??
        Rx("Amenities can be updated anytime, even after your listing goes live.");
    standoutSectionTitle = standoutSectionTitle ?? Rx("Any standout amenities");
    safetySectionTitle = safetySectionTitle ?? Rx("Safety items");
  }
}
