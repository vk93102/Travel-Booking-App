import '../../../core/app_export.dart';

/// This class is used in the [host_onboarding_screen] screen.
class HostOnboardingModel {
  Rx<String>? title;
  Rx<String>? description;
  Rx<String>? buttonText;
  Rx<String>? backgroundImage;

  HostOnboardingModel({
    this.title,
    this.description,
    this.buttonText,
    this.backgroundImage,
  }) {
    title = title ?? Rx("Become a Host");
    description = description ??
        Rx("Lorem ipsum dolor sit amet conse ctetur. Vestibulum diam augue sed malesua.");
    buttonText = buttonText ?? Rx("Get Started");
    backgroundImage = backgroundImage ?? Rx(ImageConstant.imgImage);
  }
}
