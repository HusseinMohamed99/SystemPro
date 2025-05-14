class FilterResultArguments {
  FilterResultArguments({
    required this.category,
    required this.buyRentOption,
    required this.selectedSubcategories,
    this.bedrooms,
    this.bathrooms,
    this.minPrice,
    this.maxPrice,
    this.minSize,
    this.maxSize,
    required this.selectedAmenities,
  });
  final String category;
  final String buyRentOption;
  final List<String> selectedSubcategories;
  final int? bedrooms;
  final int? bathrooms;
  final double? minPrice;
  final double? maxPrice;
  final double? minSize;
  final double? maxSize;
  final List<int> selectedAmenities;
}
