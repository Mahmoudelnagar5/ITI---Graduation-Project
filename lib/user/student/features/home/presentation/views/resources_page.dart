import 'package:final_project_iti/core/routing/route_export.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  final GlobalKey<CardsListState> _cardListKey = GlobalKey<CardsListState>();

  final tracks = [
    'All',
    'Flutter',
    'AI',
    'DevOps',
    'Web Dev',
    'Security',
    'Network',
    'Data Science',
    'Game Dev',
    'UI/UX',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context)!.itiLearningResources,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: Padding(
          padding: AppTextStyles.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                hintText: AppLocalizations.of(context)!.searchLearningMaterials,
                onSearchChanged: (query) {
                  _cardListKey.currentState?.onSearchChanged(query);
                },
              ),
              SizedBox(height: 14.h),

              // Selectable scrollable row
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: tracks.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8.w),
                  itemBuilder: (context, index) {
                    final isActive = index == selectedIndex;
                    return GestureDetector(
                      onTap: () async {
                        _cardListKey.currentState?.onSearchChanged(
                          tracks[index],
                        );
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Text(
                          tracks[index],
                          style: TextStyle(
                            color: isActive
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.7),
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),

              Expanded(child: CardsList(key: _cardListKey)),
            ],
          ),
        ),
      ),
    );
  }
}
