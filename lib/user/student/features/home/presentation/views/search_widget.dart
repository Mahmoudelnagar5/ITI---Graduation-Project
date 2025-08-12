import 'package:final_project_iti/core/routing/route_export.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.hintText});
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
              cursorColor: theme.colorScheme.primary,
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
