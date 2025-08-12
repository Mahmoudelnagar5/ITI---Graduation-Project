import 'package:final_project_iti/core/routing/route_export.dart';

List<LoginRoleModel> roleList = [
  LoginRoleModel(
    title: 'User',
    subTitle: 'Students and course participants',
    svgAssets: Assets.imagesUserIcon,
  ),
  LoginRoleModel(
    title: 'Admin',
    subTitle: 'Course instructors and staff members',
    svgAssets: Assets.imagesAdminIcon,
  ),
  LoginRoleModel(
    title: 'Super Admin ',
    subTitle: 'System administrators and managers',
    svgAssets: Assets.imagesSuperAdminIcon,
  ),
];

// TODO add onTap to LoginRoleModel
