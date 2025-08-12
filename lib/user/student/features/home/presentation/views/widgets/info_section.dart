import '../../../../../../../core/routing/route_export.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Ahmed Mohamed',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff111827),
          ),
        ),
        SizedBox(height: 5),
        Text(
          'ahmed.mohamed@fayoum.edu.eg',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff4B5563),
          ),
        ),
      ],
    );
  }
}
