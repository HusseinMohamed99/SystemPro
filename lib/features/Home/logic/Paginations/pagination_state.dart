class PaginationState {
  int cursor = 0;
  final int limit = 5;
  String direction = 'next';
  bool isLoading = false;
  bool hasMore = true;

  void reset() {
    cursor = 0;
    direction = 'next';
    isLoading = false;
    hasMore = true;
  }
}
