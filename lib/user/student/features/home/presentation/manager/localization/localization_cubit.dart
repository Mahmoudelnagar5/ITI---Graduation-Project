import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/localization/localization_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitialState()) {
    _loadLanguage();
  }

  static LocalizationCubit get(context) => BlocProvider.of(context);

  String currentLanguage = "en";

  Future<void> selectLanguage(String language) async {
    currentLanguage = language;

    await CacheHelper().saveData(
      key: CasheKeys.language,
      value: currentLanguage,
    );
    emit(LocalizationChangeState());
  }

  String getLanguage() {
    switch (currentLanguage) {
      case ("ar"):
        return "ar";
      default:
        return "en";
    }
  }

  Future<void> _loadLanguage() async {
    String? savedlanguage = await CacheHelper().getData(
      key: CasheKeys.language,
    );
    if (savedlanguage != null) {
      currentLanguage = savedlanguage;
    }
    emit(LocalizationChangeState());
  }
}
