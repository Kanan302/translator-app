enum Routes {
  splash(path: '/splash'),
  login(path: '/login');

  const Routes ({required this.path});
  final String path;
}
