import 'package:final_project_iti/core/routing/route_export.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key, this.hintText, this.onSearchChanged});
  final String? hintText;
  final Function(String)? onSearchChanged;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    widget.onSearchChanged?.call(query);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 12),

      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
              cursorColor: theme.colorScheme.primary,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                isCollapsed: true,
                hintText: widget.hintText,
                hintStyle: AppTextStyles.textStyleRegular16.copyWith(
                  fontFamily: AppFontFamily.roboto,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            IconButton(
              onPressed: () {
                _searchController.clear();
                _onSearchChanged('');
              },
              icon: Icon(
                Icons.clear,
                size: 20,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
        ],
      ),
    );
  }
}
