part of 'widgets.dart';

class DialogHelper {
  //memunculkan dialog
  static void showErrorDialog(
      {String title = 'Error', String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Get.textTheme.headlineMedium,
            ),
            Text(
              description,
              style: Get.textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Okay"))
          ],
        ),
      ),
    ));
  }
}
