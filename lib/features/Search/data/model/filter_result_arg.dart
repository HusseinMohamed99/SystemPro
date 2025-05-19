class FilterResultArguments {
  FilterResultArguments({
    required this.category,
    required this.listingType,
    this.selectedSubcategories,
    this.bedrooms,
    this.bathrooms,
    this.minPrice,
    this.maxPrice,
    this.minSize,
    this.maxSize,
    this.selectedAmenities,
  });
  final int category;
  final String listingType;
  final int? selectedSubcategories;
  final int? bedrooms;
  final int? bathrooms;
  final num? minPrice;
  final num? maxPrice;
  final num? minSize;
  final num? maxSize;
  final List<int>? selectedAmenities;
}
