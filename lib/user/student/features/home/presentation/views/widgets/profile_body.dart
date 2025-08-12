import '../../../../../../../core/routing/route_export.dart';
import 'custom_text_button.dart';
import 'image_setion.dart';
import 'info_section.dart';
import 'setting_item.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Column(
          children: [
            const ImageSection(),
            const SizedBox(height: 20),
            const InfoSection(),
            const SizedBox(height: 32),
            const Divider(height: 20, color: Colors.grey, thickness: 1),
            const SizedBox(height: 15),
            const SettingItem(title: 'Edit Profile', icon: Icons.person),
            const Divider(height: 20, color: Color(0xff9CA3AF), thickness: 1),
            const SizedBox(height: 15),
            const SettingItem(title: 'Change Language', icon: Icons.language),
            const Divider(height: 20, color: Color(0xff9CA3AF), thickness: 1),
            const SizedBox(height: 15),
            SettingItem(
              title: 'Theme Settings',
              icon: Icons.dark_mode,
              onTap: () {},
            ),
            const Divider(height: 20, color: Color(0xff9CA3AF), thickness: 1),
            const SizedBox(height: 15),
            const SettingItem(title: 'Starred Questions', icon: Icons.star),
            const Divider(height: 20, color: Color(0xff9CA3AF), thickness: 1),
            SizedBox(height: 0.06.sh),
            const CustomTextButtom(),
          ],
        ),
      ),
    );
  }
}
