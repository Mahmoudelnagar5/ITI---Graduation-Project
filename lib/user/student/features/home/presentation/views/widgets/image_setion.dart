import 'package:final_project_iti/core/routing/route_export.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const CircleAvatar(
        backgroundColor: Colors.brown,
        radius: 50,
        child: Center(child: Icon(Icons.add_a_photo, color: Colors.black)),
      ),
    );
  }
}
