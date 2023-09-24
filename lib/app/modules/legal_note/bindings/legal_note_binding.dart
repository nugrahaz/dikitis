import 'package:get/get.dart';

import '../controllers/legal_note_controller.dart';

class LegalNoteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LegalNoteController>(() => LegalNoteController());
  }
}
