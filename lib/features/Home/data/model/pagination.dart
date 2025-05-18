import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  Pagination({this.nextCursor, this.prevCursor, this.hasMore});
  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  @JsonKey(name: 'next_cursor')
  final int? nextCursor;

  @JsonKey(name: 'prev_cursor')
  final int? prevCursor;

  @JsonKey(name: 'has_more')
  final bool? hasMore;
}
