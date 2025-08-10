class LoginRoleModel {
  final String title;
  final String subTitle;
  final String svgAssets;
  final void Function()? onTap;

  LoginRoleModel({
    this.onTap,
    required this.title,
    required this.subTitle,
    required this.svgAssets,
  });
}
