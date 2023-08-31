// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homescreen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomescreenEvent {
  String get category => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) getproductlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? getproductlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? getproductlist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(getproductlist value) getproductlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(getproductlist value)? getproductlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(getproductlist value)? getproductlist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomescreenEventCopyWith<HomescreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomescreenEventCopyWith<$Res> {
  factory $HomescreenEventCopyWith(
          HomescreenEvent value, $Res Function(HomescreenEvent) then) =
      _$HomescreenEventCopyWithImpl<$Res, HomescreenEvent>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class _$HomescreenEventCopyWithImpl<$Res, $Val extends HomescreenEvent>
    implements $HomescreenEventCopyWith<$Res> {
  _$HomescreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$getproductlistCopyWith<$Res>
    implements $HomescreenEventCopyWith<$Res> {
  factory _$$getproductlistCopyWith(
          _$getproductlist value, $Res Function(_$getproductlist) then) =
      __$$getproductlistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$getproductlistCopyWithImpl<$Res>
    extends _$HomescreenEventCopyWithImpl<$Res, _$getproductlist>
    implements _$$getproductlistCopyWith<$Res> {
  __$$getproductlistCopyWithImpl(
      _$getproductlist _value, $Res Function(_$getproductlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$getproductlist(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getproductlist with DiagnosticableTreeMixin implements getproductlist {
  const _$getproductlist({required this.category});

  @override
  final String category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomescreenEvent.getproductlist(category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomescreenEvent.getproductlist'))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getproductlist &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getproductlistCopyWith<_$getproductlist> get copyWith =>
      __$$getproductlistCopyWithImpl<_$getproductlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) getproductlist,
  }) {
    return getproductlist(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? getproductlist,
  }) {
    return getproductlist?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? getproductlist,
    required TResult orElse(),
  }) {
    if (getproductlist != null) {
      return getproductlist(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(getproductlist value) getproductlist,
  }) {
    return getproductlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(getproductlist value)? getproductlist,
  }) {
    return getproductlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(getproductlist value)? getproductlist,
    required TResult orElse(),
  }) {
    if (getproductlist != null) {
      return getproductlist(this);
    }
    return orElse();
  }
}

abstract class getproductlist implements HomescreenEvent {
  const factory getproductlist({required final String category,}) =
      _$getproductlist;

  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$getproductlistCopyWith<_$getproductlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomescreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> productlist, bool isLoading)
        displayproduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> productlist, bool isLoading)?
        displayproduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> productlist, bool isLoading)? displayproduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(displayproduct value) displayproduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(displayproduct value)? displayproduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(displayproduct value)? displayproduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomescreenStateCopyWith<$Res> {
  factory $HomescreenStateCopyWith(
          HomescreenState value, $Res Function(HomescreenState) then) =
      _$HomescreenStateCopyWithImpl<$Res, HomescreenState>;
}

/// @nodoc
class _$HomescreenStateCopyWithImpl<$Res, $Val extends HomescreenState>
    implements $HomescreenStateCopyWith<$Res> {
  _$HomescreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomescreenStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomescreenState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomescreenState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> productlist, bool isLoading)
        displayproduct,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> productlist, bool isLoading)?
        displayproduct,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> productlist, bool isLoading)? displayproduct,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(displayproduct value) displayproduct,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(displayproduct value)? displayproduct,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(displayproduct value)? displayproduct,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomescreenState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$displayproductCopyWith<$Res> {
  factory _$$displayproductCopyWith(
          _$displayproduct value, $Res Function(_$displayproduct) then) =
      __$$displayproductCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> productlist, bool isLoading});
}

/// @nodoc
class __$$displayproductCopyWithImpl<$Res>
    extends _$HomescreenStateCopyWithImpl<$Res, _$displayproduct>
    implements _$$displayproductCopyWith<$Res> {
  __$$displayproductCopyWithImpl(
      _$displayproduct _value, $Res Function(_$displayproduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productlist = null,
    Object? isLoading = null,
  }) {
    return _then(_$displayproduct(
      productlist: null == productlist
          ? _value._productlist
          : productlist // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$displayproduct with DiagnosticableTreeMixin implements displayproduct {
  const _$displayproduct(
      {required final List<Product> productlist, required this.isLoading})
      : _productlist = productlist;

  final List<Product> _productlist;
  @override
  List<Product> get productlist {
    if (_productlist is EqualUnmodifiableListView) return _productlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productlist);
  }

  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomescreenState.displayproduct(productlist: $productlist, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomescreenState.displayproduct'))
      ..add(DiagnosticsProperty('productlist', productlist))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$displayproduct &&
            const DeepCollectionEquality()
                .equals(other._productlist, _productlist) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productlist), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$displayproductCopyWith<_$displayproduct> get copyWith =>
      __$$displayproductCopyWithImpl<_$displayproduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> productlist, bool isLoading)
        displayproduct,
  }) {
    return displayproduct(productlist, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> productlist, bool isLoading)?
        displayproduct,
  }) {
    return displayproduct?.call(productlist, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> productlist, bool isLoading)? displayproduct,
    required TResult orElse(),
  }) {
    if (displayproduct != null) {
      return displayproduct(productlist, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(displayproduct value) displayproduct,
  }) {
    return displayproduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(displayproduct value)? displayproduct,
  }) {
    return displayproduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(displayproduct value)? displayproduct,
    required TResult orElse(),
  }) {
    if (displayproduct != null) {
      return displayproduct(this);
    }
    return orElse();
  }
}

abstract class displayproduct implements HomescreenState {
  const factory displayproduct(
      {required final List<Product> productlist,
      required final bool isLoading}) = _$displayproduct;

  List<Product> get productlist;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$displayproductCopyWith<_$displayproduct> get copyWith =>
      throw _privateConstructorUsedError;
}
