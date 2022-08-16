// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return _PostData.fromJson(json);
}

/// @nodoc
mixin _$PostData {
  DateTime get dateTime => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDataCopyWith<PostData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDataCopyWith<$Res> {
  factory $PostDataCopyWith(PostData value, $Res Function(PostData) then) =
      _$PostDataCopyWithImpl<$Res>;
  $Res call({DateTime dateTime, int count});
}

/// @nodoc
class _$PostDataCopyWithImpl<$Res> implements $PostDataCopyWith<$Res> {
  _$PostDataCopyWithImpl(this._value, this._then);

  final PostData _value;
  // ignore: unused_field
  final $Res Function(PostData) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PostDataCopyWith<$Res> implements $PostDataCopyWith<$Res> {
  factory _$$_PostDataCopyWith(
          _$_PostData value, $Res Function(_$_PostData) then) =
      __$$_PostDataCopyWithImpl<$Res>;
  @override
  $Res call({DateTime dateTime, int count});
}

/// @nodoc
class __$$_PostDataCopyWithImpl<$Res> extends _$PostDataCopyWithImpl<$Res>
    implements _$$_PostDataCopyWith<$Res> {
  __$$_PostDataCopyWithImpl(
      _$_PostData _value, $Res Function(_$_PostData) _then)
      : super(_value, (v) => _then(v as _$_PostData));

  @override
  _$_PostData get _value => super._value as _$_PostData;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_PostData(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostData with DiagnosticableTreeMixin implements _PostData {
  const _$_PostData({required this.dateTime, required this.count});

  factory _$_PostData.fromJson(Map<String, dynamic> json) =>
      _$$_PostDataFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostData(dateTime: $dateTime, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostData'))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostData &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_PostDataCopyWith<_$_PostData> get copyWith =>
      __$$_PostDataCopyWithImpl<_$_PostData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDataToJson(
      this,
    );
  }
}

abstract class _PostData implements PostData {
  const factory _PostData(
      {required final DateTime dateTime,
      required final int count}) = _$_PostData;

  factory _PostData.fromJson(Map<String, dynamic> json) = _$_PostData.fromJson;

  @override
  DateTime get dateTime;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_PostDataCopyWith<_$_PostData> get copyWith =>
      throw _privateConstructorUsedError;
}
