class RouteNames {
  static const String home = '/';
  static const String details = '/details/:id';
  static const String settings = '/settings';
  static String detailsWithId(String id) => '/details/$id';
}