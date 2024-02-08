enum Routes {
  splash(path: '/splash'),
  login(path: '/login'),
  register(path: '/register'),
  home(path: '/homepage');

  const Routes ({required this.path});
  final String path;
}
