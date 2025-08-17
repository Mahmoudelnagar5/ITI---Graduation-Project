import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/role_icon.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key, required this.roleModel, required this.onTap});
  final LoginRoleModel roleModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
            ),
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ListTile(
              leading: RoleIcon(svgAssets: roleModel.svgAssets),
              title: Text(
                roleModel.title,
                style: AppTextStyles.textStyleSemiBold18.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontFamily: AppFontFamily.roboto,
                ),
              ),
              subtitle: Text(
                roleModel.subTitle,
                style: AppTextStyles.textStyleRegular14.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                  fontFamily: AppFontFamily.roboto,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
