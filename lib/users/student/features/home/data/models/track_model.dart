import 'package:final_project_iti/core/routing/route_export.dart';

class TrackModel {
  final String title;
  final String image;
  final String description;

  TrackModel({
    required this.title,
    required this.image,
    required this.description,
  });
  static List<TrackModel> tracks = [
    TrackModel(
      title: 'Flutter Development',
      image: Assets.imagesFlutter,
      description:
          'Complete Flutter development program covering mobile app development fundamentals to advanced concepts.',
    ),
    TrackModel(
      title: 'Web Development',
      image: Assets.imagesWeb,
      description:
          'Comprehensive web development track covering frontend and backend technologies.',
    ),
    TrackModel(
      title: 'Data Science',
      image: Assets.imagesDataScience,
      description:
          'Learn data analysis, machine learning, and statistical modeling.',
    ),
    TrackModel(
      title: 'UI/UX Design',
      image: Assets.imagesUiUx,
      description:
          'Master user interface design principles and user experience methodologies.',
    ),
    TrackModel(
      title: 'Cyber Security',
      image: Assets.imagesSecurity,
      description:
          'Essential security concepts and practical defense strategies.',
    ),
  ];
}
