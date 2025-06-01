// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  nextCursor: (json['next_cursor'] as num?)?.toInt(),
  prevCursor: (json['prev_cursor'] as num?)?.toInt(),
  hasMore: json['has_more'] as bool? ?? false,
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'next_cursor': instance.nextCursor,
      'prev_cursor': instance.prevCursor,
      'has_more': instance.hasMore,
    };
