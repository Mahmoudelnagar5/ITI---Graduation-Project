import 'package:final_project_iti/core/routing/route_export.dart';


class SetNewPasswordPage extends StatelessWidget {
  const SetNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 24.sp),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: 16.h),
            Text(
              "Set a new password",
              style: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Create a new password. Ensure it differs from previous ones for security",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 24.h),

            /// New Password
            PasswordTextFormField(
              controller: passwordController,
              hintText: "Enter New Password",
            ),

            SizedBox(height: 16.h),

            /// Confirm Password
            PasswordTextFormField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
            ),

            SizedBox(height: 24.h),

            /// Update Button
            const AppBotton(child: Text('Update Password')),
          ],
        ),
      ),
    );
  }
}
