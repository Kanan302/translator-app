enum Routes {
  splash(path: '/splash'),
  login(path: '/login'),
  register(path: '/register');

  const Routes ({required this.path});
  final String path;
}
