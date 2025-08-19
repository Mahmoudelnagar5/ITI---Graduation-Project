import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/data/repositories/home_repository.dart';

class CardsList extends StatefulWidget {
  const CardsList({super.key});

  @override
  State<CardsList> createState() => CardsListState();
}

class CardsListState extends State<CardsList> {
  final HomeRepositoryImpl _repository = HomeRepositoryImpl();
  String searchQuery = '';

  void onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _repository.searchResources(searchQuery),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64.r,
                  color: AppColors.lightHintTextField,
                ),
                Gap(16.h),
                Text(
                  'Error loading tracks',
                  style: AppTextStyles.textStyleMedium14.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                ),
                Gap(8.h),
                Text(
                  snapshot.error.toString(),
                  style: AppTextStyles.textStyleRegular12.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(16.h),
              ],
            ),
          );
        }
        final resources = snapshot.data ?? [];

        if (resources.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inbox_outlined,

                  size: 64.r,
                  color: AppColors.lightHintTextField,
                ),
                Gap(16.h),
                Text(
                  'No resources available',
                  style: AppTextStyles.textStyleMedium14.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                ),
                Gap(8.h),
                Text(
                  'No resources have been added yet.\nCheck back later or contact admin.',
                  style: AppTextStyles.textStyleRegular12.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: resources.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: ResourceCard(
                type: resources[index].type,
                title: resources[index].title,
                subtitle: resources[index].description,
                meta: '${resources[index].type}• 2.5 hours',
                actionLabel: resources[index].type == "Pdf" ? 'View' : 'open',
                actionType: resources[index].type != 'pdf'
                    ? ResourceAction.view
                    : ResourceAction.open,
                urlPath: resources[index].url,
              ),
            );
          },
        );
      },
    );
  }
}
