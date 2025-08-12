import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/Auth/controller/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  void register() {}

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();

    return super.close();
  }
}
