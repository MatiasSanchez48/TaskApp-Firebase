// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MTask _$MTaskFromJson(Map<String, dynamic> json) {
  return _MTask.fromJson(json);
}

/// @nodoc
mixin _$MTask {
  String get name => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get state => throw _privateConstructorUsedError;
  String get authorUid => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this MTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MTaskCopyWith<MTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MTaskCopyWith<$Res> {
  factory $MTaskCopyWith(MTask value, $Res Function(MTask) then) =
      _$MTaskCopyWithImpl<$Res, MTask>;
  @useResult
  $Res call(
      {String name,
      String title,
      String description,
      String email,
      String color,
      String photoUrl,
      DateTime createdAt,
      DateTime updatedAt,
      int state,
      String authorUid,
      String? uid,
      DateTime? deletedAt});
}

/// @nodoc
class _$MTaskCopyWithImpl<$Res, $Val extends MTask>
    implements $MTaskCopyWith<$Res> {
  _$MTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? description = null,
    Object? email = null,
    Object? color = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? state = null,
    Object? authorUid = null,
    Object? uid = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      authorUid: null == authorUid
          ? _value.authorUid
          : authorUid // ignore: cast_nullable_to_non_nullable
              as String,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MTaskImplCopyWith<$Res> implements $MTaskCopyWith<$Res> {
  factory _$$MTaskImplCopyWith(
          _$MTaskImpl value, $Res Function(_$MTaskImpl) then) =
      __$$MTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String title,
      String description,
      String email,
      String color,
      String photoUrl,
      DateTime createdAt,
      DateTime updatedAt,
      int state,
      String authorUid,
      String? uid,
      DateTime? deletedAt});
}

/// @nodoc
class __$$MTaskImplCopyWithImpl<$Res>
    extends _$MTaskCopyWithImpl<$Res, _$MTaskImpl>
    implements _$$MTaskImplCopyWith<$Res> {
  __$$MTaskImplCopyWithImpl(
      _$MTaskImpl _value, $Res Function(_$MTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of MTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? description = null,
    Object? email = null,
    Object? color = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? state = null,
    Object? authorUid = null,
    Object? uid = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$MTaskImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      authorUid: null == authorUid
          ? _value.authorUid
          : authorUid // ignore: cast_nullable_to_non_nullable
              as String,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MTaskImpl with DiagnosticableTreeMixin implements _MTask {
  const _$MTaskImpl(
      {required this.name,
      required this.title,
      required this.description,
      required this.email,
      required this.color,
      required this.photoUrl,
      required this.createdAt,
      required this.updatedAt,
      required this.state,
      required this.authorUid,
      this.uid,
      this.deletedAt});

  factory _$MTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$MTaskImplFromJson(json);

  @override
  final String name;
  @override
  final String title;
  @override
  final String description;
  @override
  final String email;
  @override
  final String color;
  @override
  final String photoUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int state;
  @override
  final String authorUid;
  @override
  final String? uid;
  @override
  final DateTime? deletedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MTask(name: $name, title: $title, description: $description, email: $email, color: $color, photoUrl: $photoUrl, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, authorUid: $authorUid, uid: $uid, deletedAt: $deletedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MTask'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('authorUid', authorUid))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('deletedAt', deletedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MTaskImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.authorUid, authorUid) ||
                other.authorUid == authorUid) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, title, description, email,
      color, photoUrl, createdAt, updatedAt, state, authorUid, uid, deletedAt);

  /// Create a copy of MTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MTaskImplCopyWith<_$MTaskImpl> get copyWith =>
      __$$MTaskImplCopyWithImpl<_$MTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MTaskImplToJson(
      this,
    );
  }
}

abstract class _MTask implements MTask {
  const factory _MTask(
      {required final String name,
      required final String title,
      required final String description,
      required final String email,
      required final String color,
      required final String photoUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int state,
      required final String authorUid,
      final String? uid,
      final DateTime? deletedAt}) = _$MTaskImpl;

  factory _MTask.fromJson(Map<String, dynamic> json) = _$MTaskImpl.fromJson;

  @override
  String get name;
  @override
  String get title;
  @override
  String get description;
  @override
  String get email;
  @override
  String get color;
  @override
  String get photoUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get state;
  @override
  String get authorUid;
  @override
  String? get uid;
  @override
  DateTime? get deletedAt;

  /// Create a copy of MTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MTaskImplCopyWith<_$MTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
