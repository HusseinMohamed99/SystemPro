import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

/// Represents pagination info for API responses,
/// typically used for infinite scroll or cursor-based pagination.
@JsonSerializable()
class Pagination {
  const Pagination({this.nextCursor, this.prevCursor, this.hasMore = false});

  /// Factory to create [Pagination] from JSON response.
  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  /// Convert this object to a JSON map.
  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  /// Cursor pointing to the next page of results.
  @JsonKey(name: 'next_cursor')
  final int? nextCursor;

  /// Cursor pointing to the previous page of results.
  @JsonKey(name: 'prev_cursor')
  final int? prevCursor;

  /// Whether more results are available after the current page.
  @JsonKey(name: 'has_more')
  final bool hasMore;
}
