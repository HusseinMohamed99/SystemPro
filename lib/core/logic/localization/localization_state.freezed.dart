// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChangeLocalizationState {
  String get localization => throw _privateConstructorUsedError;

  /// Create a copy of ChangeLocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangeLocalizationStateCopyWith<ChangeLocalizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeLocalizationStateCopyWith<$Res> {
  factory $ChangeLocalizationStateCopyWith(
    ChangeLocalizationState value,
    $Res Function(ChangeLocalizationState) then,
  ) = _$ChangeLocalizationStateCopyWithImpl<$Res, ChangeLocalizationState>;
  @useResult
  $Res call({String localization});
}

/// @nodoc
class _$ChangeLocalizationStateCopyWithImpl<
  $Res,
  $Val extends ChangeLocalizationState
>
    implements $ChangeLocalizationStateCopyWith<$Res> {
  _$ChangeLocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeLocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? localization = null}) {
    return _then(
      _value.copyWith(
            localization:
                null == localization
                    ? _value.localization
                    : localization // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChangeLocalizationStateImplCopyWith<$Res>
    implements $ChangeLocalizationStateCopyWith<$Res> {
  factory _$$ChangeLocalizationStateImplCopyWith(
    _$ChangeLocalizationStateImpl value,
    $Res Function(_$ChangeLocalizationStateImpl) then,
  ) = __$$ChangeLocalizationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String localization});
}

/// @nodoc
class __$$ChangeLocalizationStateImplCopyWithImpl<$Res>
    extends
        _$ChangeLocalizationStateCopyWithImpl<
          $Res,
          _$ChangeLocalizationStateImpl
        >
    implements _$$ChangeLocalizationStateImplCopyWith<$Res> {
  __$$ChangeLocalizationStateImplCopyWithImpl(
    _$ChangeLocalizationStateImpl _value,
    $Res Function(_$ChangeLocalizationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChangeLocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? localization = null}) {
    return _then(
      _$ChangeLocalizationStateImpl(
        localization:
            null == localization
                ? _value.localization
                : localization // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ChangeLocalizationStateImpl implements _ChangeLocalizationState {
  const _$ChangeLocalizationStateImpl({required this.localization});

  @override
  final String localization;

  @override
  String toString() {
    return 'ChangeLocalizationState(localization: $localization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLocalizationStateImpl &&
            (identical(other.localization, localization) ||
                other.localization == localization));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localization);

  /// Create a copy of ChangeLocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLocalizationStateImplCopyWith<_$ChangeLocalizationStateImpl>
  get copyWith => __$$ChangeLocalizationStateImplCopyWithImpl<
    _$ChangeLocalizationStateImpl
  >(this, _$identity);
}

abstract class _ChangeLocalizationState implements ChangeLocalizationState {
  const factory _ChangeLocalizationState({required final String localization}) =
      _$ChangeLocalizationStateImpl;

  @override
  String get localization;

  /// Create a copy of ChangeLocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeLocalizationStateImplCopyWith<_$ChangeLocalizationStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
