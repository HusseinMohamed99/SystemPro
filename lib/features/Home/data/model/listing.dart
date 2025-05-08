import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Home/data/model/amenities.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/data/model/employee.dart';
import 'package:system_pro/features/Home/data/model/listing_image.dart';
import 'package:system_pro/features/Home/data/model/subcategory.dart';

part 'listing.g.dart';

@JsonSerializable()
class Listing {
  Listing({
    this.id,
    this.employeeId,
    this.companyId,
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
    this.images,
    this.amenities,
    this.subcategory,
    this.listingType,
    this.isFavorited = false, // الإضافة هنا لجعلها قابلة للتغيير
  });

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);

  final int? id;
  @JsonKey(name: 'employee_id')
  final int? employeeId;
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'subcategory_id')
  final int? subcategoryId;
  final String? title;
  final String? description;
  final String? category;
  final String? price;
  @JsonKey(name: 'down_payment')
  final String? downPayment;
  final String? location;
  final String? picture;
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;
  final int? rooms;
  final int? bathrooms;
  final int? floors;
  final String? area;
  @JsonKey(name: 'selling_status')
  final int? sellingStatus;
  final String? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'listing_type')
  final String? listingType;
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  final Employee? employee;
  final Company? company;
  final Subcategory? subcategory;
  final List<Amenities>? amenities;
  final List<ListingImage>? images;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isFavorited;
}
