class SourceRouteArguments {
  const SourceRouteArguments({required this.id, required this.type});
  final int id;
  final String type;

  bool get isCompany => type == 'company';
  bool get isMarketer => type == 'marketer';
}
