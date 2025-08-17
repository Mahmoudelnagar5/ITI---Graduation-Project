import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/theme/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState()) {
    _loadTheme();
  }

  static AppCubit get(context) => BlocProvider.of(context);

  ThemeModeState currentTheme = ThemeModeState.system;

  Future<void> selectTheme(ThemeModeState theme) async {
    currentTheme = theme;

    await CacheHelper().saveData(
      key: CasheKeys.themeMode,
      value: currentTheme.name,
    );
    emit(ThemeState());
  }

  ThemeMode getTheme() {
    switch (currentTheme) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }

  Future<void> _loadTheme() async {
    String? savedTheme = await CacheHelper().getData(key: CasheKeys.themeMode);
    if (savedTheme != null) {
      currentTheme = ThemeModeState.values.firstWhere(
        (element) => element.name == savedTheme,
        orElse: () => ThemeModeState.system,
      );
    }
    emit(ThemeState());
  }
}

enum ThemeModeState { light, dark, system }
// 1. select theme (light,dark,system)
// 2. get theme of ThemeMode type
// 3. load theme