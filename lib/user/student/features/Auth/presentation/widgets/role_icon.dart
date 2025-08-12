import 'package:final_project_iti/core/routing/route_export.dart';

class RoleIcon extends StatelessWidget {
  const RoleIcon({super.key, required this.svgAssets});
  final String svgAssets;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      radius: 48,
      child: SvgPicture.asset(svgAssets, width: 30),
    );
  }
}
