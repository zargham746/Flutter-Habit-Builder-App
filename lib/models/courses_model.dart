class CoursesModel {
  final String courseName;
  final int totalLessons;
  final String totalTime;
  final String imageUrl;
  final bool isSaved;

  CoursesModel({
    required this.courseName,
    required this.totalLessons,
    required this.totalTime,
    required this.imageUrl,
    required this.isSaved,
  });
}
