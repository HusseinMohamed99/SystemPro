import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Home/data/model/realestate/amenities.dart';
import 'package:system_pro/features/Home/data/model/realestate/company.dart';
import 'package:system_pro/features/Home/data/model/realestate/employee.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing_image.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketer.dart';
import 'package:system_pro/features/Home/data/model/realestate/subcategory.dart';

part 'listing.g.dart';

/// Represents a real estate listing, including all related metadata and relationships.
@JsonSerializable()
class Listing {
  /// Main constructor for Listing model.
  Listing({
    this.id,
    this.employeeId,
    this.companyId,
    this.marketerId,
    this.categoryId,
    this.subcategoryId,
    this.title,
    this.description,
    this.category,
    this.price,
    this.downPayment,
    this.location,
    this.picture,
    this.pictureUrl,
    this.rooms,
    this.bathrooms,
    this.floors,
    this.area,
    this.sellingStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.rejectionReason,
    this.releaseDate,
    this.employee,
    this.company,
    this.marketer,
    this.images,
    this.amenities,
    this.subcategory,
    this.listingType,
    this.isFavorite = false, // Default value added
  });

  /// Factory to create a Listing instance from JSON.
  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);

  /// Convert Listing object to JSON.
  Map<String, dynamic> toJson() => _$ListingToJson(this);

  final int? id;
  @JsonKey(name: 'employee_id')
  final int? employeeId;
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'marketer_id')
  final int? marketerId;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'subcategory_id')
  final int? subcategoryId;

  /// Listing title shown to users.
  final String? title;

  /// Description of the property.
  final String? description;

  /// Category name (e.g. villa, apartment).
  final String? category;

  /// Price of the listing (string for formatting).
  final String? price;

  /// Down payment if available.
  @JsonKey(name: 'down_payment')
  final String? downPayment;

  /// Property location in text.
  final String? location;

  /// Primary image or placeholder.
  final String? picture;

  /// Full image URL for web/API.
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;

  /// Number of rooms in the property.
  final int? rooms;

  /// Number of bathrooms.
  final int? bathrooms;

  /// Number of floors in the property.
  final int? floors;

  /// Property area in m² or ft².
  final String? area;

  /// Sale status (0: available, 1: sold, etc.).
  @JsonKey(name: 'selling_status')
  final int? sellingStatus;

  /// Approval or review status.
  final String? status;

  /// When the listing was created.
  @JsonKey(name: 'created_at')
  final String? createdAt;

  /// Last update timestamp.
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  /// Listing type: rent, sale, etc.
  @JsonKey(name: 'listing_type')
  final String? listingType;

  /// Reason if the listing was rejected.
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;

  /// Date when listing is published.
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  /// Employee who added the listing.
  final Employee? employee;

  /// Associated company.
  final Company? company;

  /// Marketer linked to listing.
  final Marketer? marketer;

  /// Related subcategory info.
  final Subcategory? subcategory;

  /// List of amenities included.
  final List<Amenities>? amenities;

  /// All listing images (gallery).
  final List<ListingImage>? images;

  /// Whether the listing is marked as favorite by the user.
  @JsonKey(name: 'is_favorite')
  bool isFavorite;
  Listing copyWith({
    int? id,
    int? employeeId,
    int? companyId,
    int? marketerId,
    int? categoryId,
    int? subcategoryId,
    String? title,
    String? description,
    String? category,
    String? price,
    String? downPayment,
    String? location,
    String? picture,
    String? pictureUrl,
    int? rooms,
    int? bathrooms,
    int? floors,
    String? area,
    int? sellingStatus,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? listingType,
    String? rejectionReason,
    String? releaseDate,
    Employee? employee,
    Company? company,
    Marketer? marketer,
    Subcategory? subcategory,
    List<Amenities>? amenities,
    List<ListingImage>? images,
    bool? isFavorite,
  }) {
    return Listing(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      companyId: companyId ?? this.companyId,
      marketerId: marketerId ?? this.marketerId,
      categoryId: categoryId ?? this.categoryId,
      subcategoryId: subcategoryId ?? this.subcategoryId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      downPayment: downPayment ?? this.downPayment,
      location: location ?? this.location,
      picture: picture ?? this.picture,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      rooms: rooms ?? this.rooms,
      bathrooms: bathrooms ?? this.bathrooms,
      floors: floors ?? this.floors,
      area: area ?? this.area,
      sellingStatus: sellingStatus ?? this.sellingStatus,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      listingType: listingType ?? this.listingType,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      releaseDate: releaseDate ?? this.releaseDate,
      employee: employee ?? this.employee,
      company: company ?? this.company,
      marketer: marketer ?? this.marketer,
      subcategory: subcategory ?? this.subcategory,
      amenities: amenities ?? this.amenities,
      images: images ?? this.images,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

}
