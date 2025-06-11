// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_theming_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChangeThemingState {
  ThemeData get theme => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;

  /// Create a copy of ChangeThemingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangeThemingStateCopyWith<ChangeThemingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeThemingStateCopyWith<$Res> {
  factory $ChangeThemingStateCopyWith(
    ChangeThemingState value,
    $Res Function(ChangeThemingState) then,
  ) = _$ChangeThemingStateCopyWithImpl<$Res, ChangeThemingState>;
  @useResult
  $Res call({ThemeData theme, bool isDarkMode});
}

/// @nodoc
class _$ChangeThemingStateCopyWithImpl<$Res, $Val extends ChangeThemingState>
    implements $ChangeThemingStateCopyWith<$Res> {
  _$ChangeThemingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeThemingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? theme = null, Object? isDarkMode = null}) {
    return _then(
      _value.copyWith(
            theme:
                null == theme
                    ? _value.theme
                    : theme // ignore: cast_nullable_to_non_nullable
                        as ThemeData,
            isDarkMode:
                null == isDarkMode
                    ? _value.isDarkMode
                    : isDarkMode // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChangeThemingStateImplCopyWith<$Res>
    implements $ChangeThemingStateCopyWith<$Res> {
  factory _$$ChangeThemingStateImplCopyWith(
    _$ChangeThemingStateImpl value,
    $Res Function(_$ChangeThemingStateImpl) then,
  ) = __$$ChangeThemingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeData theme, bool isDarkMode});
}

/// @nodoc
class __$$ChangeThemingStateImplCopyWithImpl<$Res>
    extends _$ChangeThemingStateCopyWithImpl<$Res, _$ChangeThemingStateImpl>
    implements _$$ChangeThemingStateImplCopyWith<$Res> {
  __$$ChangeThemingStateImplCopyWithImpl(
    _$ChangeThemingStateImpl _value,
    $Res Function(_$ChangeThemingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChangeThemingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? theme = null, Object? isDarkMode = null}) {
    return _then(
      _$ChangeThemingStateImpl(
        theme:
            null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                    as ThemeData,
        isDarkMode:
            null == isDarkMode
                ? _value.isDarkMode
                : isDarkMode // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ChangeThemingStateImpl implements _ChangeThemingState {
  const _$ChangeThemingStateImpl({
    required this.theme,
    required this.isDarkMode,
  });

  @override
  final ThemeData theme;
  @override
  final bool isDarkMode;

  @override
  String toString() {
    return 'ChangeThemingState(theme: $theme, isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemingStateImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, isDarkMode);

  /// Create a copy of ChangeThemingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemingStateImplCopyWith<_$ChangeThemingStateImpl> get copyWith =>
      __$$ChangeThemingStateImplCopyWithImpl<_$ChangeThemingStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ChangeThemingState implements ChangeThemingState {
  const factory _ChangeThemingState({
    required final ThemeData theme,
    required final bool isDarkMode,
  }) = _$ChangeThemingStateImpl;

  @override
  ThemeData get theme;
  @override
  bool get isDarkMode;

  /// Create a copy of ChangeThemingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeThemingStateImplCopyWith<_$ChangeThemingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
