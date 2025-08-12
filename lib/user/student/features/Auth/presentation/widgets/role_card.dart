import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/Auth/data/login_role_model.dart';
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
            side: const BorderSide(color: Color.fromARGB(45, 102, 102, 102)),
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ListTile(
              leading: RoleIcon(svgAssets: roleModel.svgAssets),
              title: Text(
                roleModel.title,
                style: AppTextStyles.textStyleSemiBold18.copyWith(
                  color: AppColors.accountype,
                  fontFamily: AppFontFamily.roboto,
                ),
              ),
              subtitle: Text(
                roleModel.subTitle,
                style: AppTextStyles.textStyleRegular14.copyWith(
                  color: AppColors.acountsubtitle,
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
