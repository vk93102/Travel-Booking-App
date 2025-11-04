import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PropertyAddressFormScreen] screen with GetX.

class PropertyAddressFormModel {
  Rx<String>? buildingName;
  Rx<String>? houseNumber;
  Rx<String>? streetName;
  Rx<String>? area;
  Rx<String>? landmark;
  Rx<String>? city;
  Rx<String>? selectedEmirate;
  Rx<String>? selectedCountry;
  Rx<String>? zipCode;

  PropertyAddressFormModel({
    this.buildingName,
    this.houseNumber,
    this.streetName,
    this.area,
    this.landmark,
    this.city,
    this.selectedEmirate,
    this.selectedCountry,
    this.zipCode,
  }) {
    buildingName = buildingName ?? Rx('18');
    houseNumber = houseNumber ?? Rx('Serenity Luxe Villa');
    streetName = streetName ?? Rx('Street No: 07');
    area = area ?? Rx('Al Barsha 1');
    landmark = landmark ?? Rx('Behind Mall of the Emirates');
    city = city ?? Rx('Dubai');
    selectedEmirate = selectedEmirate ?? Rx('Dubai');
    selectedCountry = selectedCountry ?? Rx('United Arab Emirates');
    zipCode = zipCode ?? Rx('00000');
  }
}
