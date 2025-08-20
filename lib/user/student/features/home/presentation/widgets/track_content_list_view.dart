// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import '../../../data/models/track_model.dart';
// import 'track_content_item.dart';

// class TrackContentListView extends StatelessWidget {
//   const TrackContentListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final trackModel =
//         ModalRoute.of(context)?.settings.arguments as TrackModel?;
//     final List<String> contents = trackModel!.contents;
//     return ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       itemCount: contents.length,
//       separatorBuilder: (context, index) => const Gap(16),
//       itemBuilder: (context, index) {
//         return TrackContentItem(
//           content: contents[index],
//           index: (index + 1).toString(),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../data/models/track_model.dart';

class TrackContentListView extends StatelessWidget {
  const TrackContentListView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackModel =
        ModalRoute.of(context)?.settings.arguments as TrackModel?;
    final List<String> contents = trackModel!.contents;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      physics: const BouncingScrollPhysics(),
      itemCount: contents.length,
      itemBuilder: (context, index) {
        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1, // control line position
          isFirst: index == 0,
          isLast: index == contents.length - 1,
          indicatorStyle: IndicatorStyle(
            width: 30,
            height: 30,
            indicator: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          beforeLineStyle: LineStyle(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            thickness: 2,
          ),
          endChild: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(left: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              contents[index],
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        );
      },
    );
  }
}
