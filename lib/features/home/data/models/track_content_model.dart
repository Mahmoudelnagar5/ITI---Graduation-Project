class TrackContentModel {
  final String title;
  final String description;

  TrackContentModel({required this.title, required this.description});
  static List<TrackContentModel> trackContents = [
    TrackContentModel(
      title: 'Introduction to Dart',
      description:
          'Basic syntax, variables, and control flow \n Data types and functions',
    ),
    TrackContentModel(
      title: 'Object-Oriented Programming',
      description:
          'Classes, objects, inheritance, and polymorphism \n Encapsulation and abstraction',
    ),
    TrackContentModel(
      title: 'Flutter Basics',
      description:
          'Widget tree and basic layouts \n Material Design components',
    ),
    TrackContentModel(
      title: 'State Management',
      description:
          'setState and state lifecycle \n Advanced state management solutions',
    ),
    TrackContentModel(
      title: 'Networking and APIs',
      description: 'HTTP requests and responses \n Parsing JSON data',
    ),
    TrackContentModel(
      title: 'Testing and Debugging',
      description:
          'Unit testing and integration testing \n Debugging techniques',
    ),
  ];
}
