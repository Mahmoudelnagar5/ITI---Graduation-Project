import '../../../../../../core/routing/route_export.dart';

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
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(icon, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        size: 20,
      ),
    );
  }
}
