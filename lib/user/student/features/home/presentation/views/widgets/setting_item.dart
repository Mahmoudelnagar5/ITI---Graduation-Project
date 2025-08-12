import '../../../../../../../core/routing/route_export.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, this.icon, required this.title, this.onTap});
  final IconData? icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.white,
        child: Icon(icon, color: const Color(0xff9D2235)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xff111827),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xff9CA3AF),
        size: 20,
      ),
    );
  }
}
