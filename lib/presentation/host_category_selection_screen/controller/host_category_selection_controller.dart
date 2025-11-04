import '../../../core/app_export.dart';
import '../models/host_category_selection_model.dart';

class HostCategorySelectionController extends GetxController {
  Rx<HostCategorySelectionModel?> hostCategorySelectionModel =
      HostCategorySelectionModel().obs;

  @override
  void onInit() {
    super.onInit();
    _initializeCategoryData();
  }

  void _initializeCategoryData() {
    List<CategoryItemModel> categoryList = [
      CategoryItemModel(
        image: ImageConstant.imgRectangle39587.obs,
        title: "Property".obs,
        isSelected: false.obs,
      ),
      CategoryItemModel(
        image: ImageConstant.imgRectangle39588.obs,
        title: "Experiences".obs,
        isSelected: false.obs,
      ),
      CategoryItemModel(
        image: ImageConstant.imgRectangle39591.obs,
        title: "Events".obs,
        isSelected: false.obs,
      ),
      CategoryItemModel(
        image: ImageConstant.imgRectangle39592.obs,
        title: "Celebrations".obs,
        isSelected: false.obs,
      ),
    ];

    hostCategorySelectionModel.value = HostCategorySelectionModel(
      categoryList: categoryList.obs,
    );
  }

  void onCategoryTap(int index) {
    if (hostCategorySelectionModel.value?.categoryList != null) {
      // Reset all selections
      for (int i = 0;
          i < hostCategorySelectionModel.value!.categoryList!.length;
          i++) {
        hostCategorySelectionModel.value!.categoryList![i].isSelected?.value =
            false;
      }

      // Set selected category
      hostCategorySelectionModel.value!.categoryList![index].isSelected?.value =
          true;
      hostCategorySelectionModel.refresh();
    }
  }

  void onNextPressed() {
    bool hasSelection = hostCategorySelectionModel.value?.categoryList?.any(
          (category) => category.isSelected?.value ?? false,
        ) ??
        false;

    if (!hasSelection) {
      Get.snackbar(
        "Selection Required",
        "Please select a category to continue.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appTheme.gray_900,
        colorText: appTheme.whiteCustom,
      );
      return;
    }

    // Navigate to next screen - using placeholder route
    Get.toNamed(AppRoutes.hostOnboardingScreen);
  }
}
