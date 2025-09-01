class DeveloperModel {
  final String name;
  final String role;
  final String linkedin;
  final String github;
  final String avatar;

  DeveloperModel({
    required this.name,
    required this.role,
    required this.linkedin,
    required this.github,
    required this.avatar,
  });
}

final List<DeveloperModel> ourTeam = [
  DeveloperModel(
    name: "Mahmoud Elnagar",
    role: "Flutter Developer",
    linkedin: "https://www.linkedin.com/in/mahmoud-elnagar-11040a259/",
    github: "https://github.com/Mahmoudelnagar5",
    avatar: "ME",
  ),
  DeveloperModel(
    name: "Moaz Ayman",
    role: "Flutter Developer",
    linkedin: "https://www.linkedin.com/in/moaz-ayman-a59230296/",
    github: "https://github.com/moaz-abdeltawab92",
    avatar: "MA",
  ),
  DeveloperModel(
    name: "Yousef Mahmoud",
    role: "Flutter Developer",
    linkedin:
        "https://www.linkedin.com/in/youssef-mahmoud-eid-attia-067433272?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
    github: "https://github.com/Youssef-Ma7moud-Eid",
    avatar: "YM",
  ),
  DeveloperModel(
    name: "Yousef Ahmed",
    role: "Flutter Developer",
    linkedin: "https://www.linkedin.com/in/1youssef-ahmed/",
    github: "https://github.com/yousefa7med",
    avatar: "YA",
  ),
];
