import 'package:final_project_iti/l10n/app_localizations.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/localization/localization_cubit.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/theme/app_cubit.dart';

import '../../../../../../core/routing/route_export.dart';
import 'custom_text_button.dart';
import 'image_setion.dart';
import 'info_section.dart';
import 'setting_item.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late String _selectedTheme; // Default selection
  late String _selectedLanguage;
  @override
  void initState() {
    _selectedTheme = AppCubit.get(context).getTheme().name.toString();
    _selectedLanguage = LocalizationCubit.get(context).getLanguage();
    super.initState();
  }

  void _showThemeSelectorSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateSheet) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select Theme',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text('Dark Mode'),
                    trailing: Radio<String>(
                      value: 'dark',
                      groupValue: _selectedTheme,
                      onChanged: (value) {
                        setState(() {
                          _selectedTheme = value!;
                          AppCubit.get(
                            context,
                          ).selectTheme(ThemeModeState.dark);
                        });
                        setStateSheet(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Light Mode'),
                    trailing: Radio<String>(
                      value: 'light',
                      groupValue: _selectedTheme,
                      onChanged: (value) {
                        setState(() {
                          _selectedTheme = value!;
                          AppCubit.get(
                            context,
                          ).selectTheme(ThemeModeState.light);
                        });
                        setStateSheet(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('System Settings'),
                    trailing: Radio<String>(
                      value: 'system',
                      groupValue: _selectedTheme,
                      onChanged: (value) {
                        setState(() {
                          _selectedTheme = value!;
                          AppCubit.get(
                            context,
                          ).selectTheme(ThemeModeState.system);
                        });
                        setStateSheet(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showSelectedLanguage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateSheet) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select Language',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text('English'),
                    trailing: Radio<String>(
                      value: 'en',
                      groupValue: _selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          _selectedLanguage = value!;
                          LocalizationCubit.get(context).selectLanguage('en');
                        });
                        setStateSheet(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Arabic'),
                    trailing: Radio<String>(
                      value: 'ar',
                      groupValue: _selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          _selectedLanguage = value!;
                          LocalizationCubit.get(context).selectLanguage('ar');
                        });
                        setStateSheet(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Column(
            children: [
              const ImageSection(),
              const SizedBox(height: 20),
              const InfoSection(),
              const SizedBox(height: 32),
              Divider(
                height: 20,
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
              ),

              const SizedBox(height: 15),
              SettingItem(
                title: AppLocalizations.of(context)!.changeLanguage,
                icon: Icons.language,
                onTap: () => _showSelectedLanguage(context),
              ),
              Divider(
                height: 20,
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
              ),
              const SizedBox(height: 15),
              SettingItem(
                title: AppLocalizations.of(context)!.themeSetting,

                icon: Icons.dark_mode,
                onTap: () => _showThemeSelectorSheet(context),
              ),
              Divider(
                height: 20,
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
              ),
              const SizedBox(height: 15),
              SettingItem(
                onTap: () {
                  AppNavigation.pushName(
                    context: context,
                    route: AppRoutes.starredQuestionsView,
                    rootNavigator: true,
                  );
                },
                title: AppLocalizations.of(context)!.starredQuestions,
                icon: Icons.star,
              ),
              Divider(
                height: 20,
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
              ),
              SizedBox(height: 0.06.sh),
              const CustomTextButtom(),
            ],
          ),
        ),
      ),
    );
  }
}
