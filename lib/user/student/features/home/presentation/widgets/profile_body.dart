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
  late String _selectedTheme;
  late String _selectedLanguage;

  @override
  void initState() {
    final appCubit = AppCubit.get(context);
    _selectedTheme = appCubit.getTheme().name;
    _selectedLanguage = appCubit.getLanguage();
    super.initState();
  }

  void _showThemeSelectorSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
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
              const Text(
                'Select Theme',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildThemeOption(
                context,
                'Dark Mode',
                'dark',
                ThemeModeState.dark,
              ),
              _buildThemeOption(
                context,
                'Light Mode',
                'light',
                ThemeModeState.light,
              ),
              _buildThemeOption(
                context,
                'System Settings',
                'system',
                ThemeModeState.system,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String title,
    String value,
    ThemeModeState themeMode,
  ) {
    return ListTile(
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedTheme,
        onChanged: (val) {
          if (val == null) return;
          setState(() => _selectedTheme = val);
          AppCubit.get(context).selectTheme(themeMode);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showLanguageSelectorSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
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
              const Text(
                'Select Language',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildLanguageOption(context, 'English', 'en'),
              _buildLanguageOption(context, 'Arabic', 'ar'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String title,
    String value,
  ) {
    return ListTile(
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedLanguage,
        onChanged: (val) {
          if (val == null) return;
          setState(() => _selectedLanguage = val);
          AppCubit.get(context).selectLanguage(val);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      height: 20,
      color: Theme.of(context).colorScheme.outline,
      thickness: 1,
    );

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
              divider,
              const SizedBox(height: 15),
              SettingItem(
                title: AppLocalizations.of(context)!.changeLanguage,
                icon: Icons.language,
                onTap: () => _showLanguageSelectorSheet(context),
              ),
              divider,
              const SizedBox(height: 15),
              SettingItem(
                title: AppLocalizations.of(context)!.themeSetting,
                icon: Icons.dark_mode,
                onTap: () => _showThemeSelectorSheet(context),
              ),
              divider,
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
              divider,
              SizedBox(height: 0.06.sh),
              const CustomTextButtom(),
            ],
          ),
        ),
      ),
    );
  }
}
