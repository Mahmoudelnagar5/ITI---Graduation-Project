import 'package:url_launcher/url_launcher.dart';

import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/Auth/data/models/developer_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamMembersPage extends StatelessWidget {
  const TeamMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Development Team",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xFF2c3e50),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ourTeam.length,
          itemBuilder: (context, index) {
            final member = ourTeam[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _buildMemberCard(context, member),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMemberCard(BuildContext context, DeveloperModel member) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).colorScheme.primary,

                  child: Text(
                    member.avatar,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Name and Role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        member.role,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Social Links at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(
                  icon: FontAwesomeIcons.github,
                  color: const Color(0xFF24292e),
                  onPressed: () => _launchURL(member.github),
                  tooltip: "GitHub",
                ),
                const SizedBox(width: 50),
                _buildSocialIcon(
                  icon: FontAwesomeIcons.linkedin,
                  color: const Color(0xFF0A66C2),
                  onPressed: () => _launchURL(member.linkedin),
                  tooltip: "LinkedIn",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FaIcon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
