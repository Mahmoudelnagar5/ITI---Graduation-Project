import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../user/student/features/home/presentation/manager/app/app_cubit.dart';
import '../../user/student/features/home/presentation/manager/app/app_state.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        final isDark = cubit.currentTheme == ThemeModeState.dark;

        return Card(
          child: ListTile(
            leading: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Theme',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              isDark ? 'Dark Mode' : 'Light Mode',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Switch(
              value: isDark,
              onChanged: (value) {
                cubit.selectTheme(
                  value ? ThemeModeState.dark : ThemeModeState.light,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
