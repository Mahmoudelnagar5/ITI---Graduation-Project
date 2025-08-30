import '../../../../../../core/routing/route_export.dart';
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Select Theme',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Select Language',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
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
      height: 20.h,
      color: Theme.of(context).colorScheme.outline,
      thickness: 1.h,
    );

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
          child: Column(
            children: [
              const ImageSection(),
              SizedBox(height: 20.h),
              const InfoSection(),
              SizedBox(height: 32.h),
              divider,
              SizedBox(height: 15.h),
              SettingItem(
                title: AppLocalizations.of(context)!.changeLanguage,
                icon: Icons.language,
                onTap: () => _showLanguageSelectorSheet(context),
              ),
              divider,
              SizedBox(height: 15.h),
              SettingItem(
                title: AppLocalizations.of(context)!.themeSetting,
                icon: Icons.dark_mode,
                onTap: () => _showThemeSelectorSheet(context),
              ),
              divider,
              SizedBox(height: 15.h),
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
              //Removed Logout Button To Future Consideration if needed
              //const CustomTextButtom(),
            ],
          ),
        ),
      ),
    );
  }
}
