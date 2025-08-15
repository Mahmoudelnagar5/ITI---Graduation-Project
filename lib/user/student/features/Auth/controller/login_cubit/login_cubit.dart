import 'package:final_project_iti/core/routing/route_export.dart';

import '../../data/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final role = await loginRepo.login(email, password);
      emit(LoginSuccess(role: role));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
