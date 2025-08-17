import '../../../../../../../../core/routing/route_export.dart';
import '../../../../data/admin_repo/admin_repo.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this.adminRepo) : super(AdminInitial());
  final AdminRepo adminRepo;
  static AdminCubit get(context) => BlocProvider.of(context);

  Future<void> addQuestion(String title, String desc, String answer) async {
    try {
      emit(AdminLoading());
      await adminRepo.addQuestion(title: title, desc: desc, answer: answer);
      emit(AdminSuccess());
    } catch (e) {
      emit(AdminFailure(e.toString()));
    }
  }
}
