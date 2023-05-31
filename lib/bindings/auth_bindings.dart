import 'package:get/get.dart';
import 'package:shelf_life/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    // Get.put<GuardsandMemberController>(GuardsandMemberController());
    //Get.put<IncidentCallController>(IncidentCallController());
  }
}
