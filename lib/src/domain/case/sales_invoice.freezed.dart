// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesInvoice _$SalesInvoiceFromJson(Map<String, dynamic> json) {
  return _SalesInvoice.fromJson(json);
}

/// @nodoc
mixin _$SalesInvoice {
  int get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;

  /// Serializes this SalesInvoice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesInvoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesInvoiceCopyWith<SalesInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesInvoiceCopyWith<$Res> {
  factory $SalesInvoiceCopyWith(
          SalesInvoice value, $Res Function(SalesInvoice) then) =
      _$SalesInvoiceCopyWithImpl<$Res, SalesInvoice>;
  @useResult
  $Res call({int id, int amount, int totalAmount, bool isPaid});
}

/// @nodoc
class _$SalesInvoiceCopyWithImpl<$Res, $Val extends SalesInvoice>
    implements $SalesInvoiceCopyWith<$Res> {
  _$SalesInvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesInvoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? totalAmount = null,
    Object? isPaid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesInvoiceImplCopyWith<$Res>
    implements $SalesInvoiceCopyWith<$Res> {
  factory _$$SalesInvoiceImplCopyWith(
          _$SalesInvoiceImpl value, $Res Function(_$SalesInvoiceImpl) then) =
      __$$SalesInvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int amount, int totalAmount, bool isPaid});
}

/// @nodoc
class __$$SalesInvoiceImplCopyWithImpl<$Res>
    extends _$SalesInvoiceCopyWithImpl<$Res, _$SalesInvoiceImpl>
    implements _$$SalesInvoiceImplCopyWith<$Res> {
  __$$SalesInvoiceImplCopyWithImpl(
      _$SalesInvoiceImpl _value, $Res Function(_$SalesInvoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesInvoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? totalAmount = null,
    Object? isPaid = null,
  }) {
    return _then(_$SalesInvoiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesInvoiceImpl with DiagnosticableTreeMixin implements _SalesInvoice {
  const _$SalesInvoiceImpl(
      {required this.id,
      required this.amount,
      required this.totalAmount,
      required this.isPaid});

  factory _$SalesInvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesInvoiceImplFromJson(json);

  @override
  final int id;
  @override
  final int amount;
  @override
  final int totalAmount;
  @override
  final bool isPaid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SalesInvoice(id: $id, amount: $amount, totalAmount: $totalAmount, isPaid: $isPaid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SalesInvoice'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('isPaid', isPaid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesInvoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, totalAmount, isPaid);

  /// Create a copy of SalesInvoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesInvoiceImplCopyWith<_$SalesInvoiceImpl> get copyWith =>
      __$$SalesInvoiceImplCopyWithImpl<_$SalesInvoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesInvoiceImplToJson(
      this,
    );
  }
}

abstract class _SalesInvoice implements SalesInvoice {
  const factory _SalesInvoice(
      {required final int id,
      required final int amount,
      required final int totalAmount,
      required final bool isPaid}) = _$SalesInvoiceImpl;

  factory _SalesInvoice.fromJson(Map<String, dynamic> json) =
      _$SalesInvoiceImpl.fromJson;

  @override
  int get id;
  @override
  int get amount;
  @override
  int get totalAmount;
  @override
  bool get isPaid;

  /// Create a copy of SalesInvoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesInvoiceImplCopyWith<_$SalesInvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
