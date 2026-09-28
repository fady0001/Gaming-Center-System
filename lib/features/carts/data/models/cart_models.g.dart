// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCartModelCollection on Isar {
  IsarCollection<CartModel> get cartModels => this.collection();
}

const CartModelSchema = CollectionSchema(
  name: r'CartModel',
  id: 4823356337332804255,
  properties: {
    r'closedAt': PropertySchema(
      id: 0,
      name: r'closedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerName': PropertySchema(
      id: 2,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'finalTotalMinorUnits': PropertySchema(
      id: 3,
      name: r'finalTotalMinorUnits',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.string,
      enumMap: _CartModelstatusEnumValueMap,
    )
  },
  estimateSize: _cartModelEstimateSize,
  serialize: _cartModelSerialize,
  deserialize: _cartModelDeserialize,
  deserializeProp: _cartModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cartModelGetId,
  getLinks: _cartModelGetLinks,
  attach: _cartModelAttach,
  version: '3.1.0+1',
);

int _cartModelEstimateSize(
  CartModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _cartModelSerialize(
  CartModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.closedAt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.customerName);
  writer.writeLong(offsets[3], object.finalTotalMinorUnits);
  writer.writeString(offsets[4], object.status.name);
}

CartModel _cartModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CartModel();
  object.closedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.customerName = reader.readString(offsets[2]);
  object.finalTotalMinorUnits = reader.readLongOrNull(offsets[3]);
  object.id = id;
  object.status =
      _CartModelstatusValueEnumMap[reader.readStringOrNull(offsets[4])] ??
          CartStatus.open;
  return object;
}

P _cartModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (_CartModelstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          CartStatus.open) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CartModelstatusEnumValueMap = {
  r'open': r'open',
  r'closed': r'closed',
};
const _CartModelstatusValueEnumMap = {
  r'open': CartStatus.open,
  r'closed': CartStatus.closed,
};

Id _cartModelGetId(CartModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cartModelGetLinks(CartModel object) {
  return [];
}

void _cartModelAttach(IsarCollection<dynamic> col, Id id, CartModel object) {
  object.id = id;
}

extension CartModelQueryWhereSort
    on QueryBuilder<CartModel, CartModel, QWhere> {
  QueryBuilder<CartModel, CartModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CartModelQueryWhere
    on QueryBuilder<CartModel, CartModel, QWhereClause> {
  QueryBuilder<CartModel, CartModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartModelQueryFilter
    on QueryBuilder<CartModel, CartModel, QFilterCondition> {
  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> closedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedAt',
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      closedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedAt',
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> closedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> closedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> closedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> closedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> customerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      customerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      customerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> customerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> customerNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      finalTotalMinorUnitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalTotalMinorUnits',
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      finalTotalMinorUnitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalTotalMinorUnits',
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      finalTotalMinorUnitsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalTotalMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      finalTotalMinorUnitsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalTotalMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      finalTotalMinorUnitsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalTotalMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition>
      finalTotalMinorUnitsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalTotalMinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusEqualTo(
    CartStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusGreaterThan(
    CartStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusLessThan(
    CartStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusBetween(
    CartStatus lower,
    CartStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension CartModelQueryObject
    on QueryBuilder<CartModel, CartModel, QFilterCondition> {}

extension CartModelQueryLinks
    on QueryBuilder<CartModel, CartModel, QFilterCondition> {}

extension CartModelQuerySortBy on QueryBuilder<CartModel, CartModel, QSortBy> {
  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy>
      sortByFinalTotalMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotalMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy>
      sortByFinalTotalMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotalMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CartModelQuerySortThenBy
    on QueryBuilder<CartModel, CartModel, QSortThenBy> {
  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy>
      thenByFinalTotalMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotalMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy>
      thenByFinalTotalMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotalMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CartModel, CartModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CartModelQueryWhereDistinct
    on QueryBuilder<CartModel, CartModel, QDistinct> {
  QueryBuilder<CartModel, CartModel, QDistinct> distinctByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedAt');
    });
  }

  QueryBuilder<CartModel, CartModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CartModel, CartModel, QDistinct> distinctByCustomerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartModel, CartModel, QDistinct>
      distinctByFinalTotalMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalTotalMinorUnits');
    });
  }

  QueryBuilder<CartModel, CartModel, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension CartModelQueryProperty
    on QueryBuilder<CartModel, CartModel, QQueryProperty> {
  QueryBuilder<CartModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CartModel, DateTime?, QQueryOperations> closedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedAt');
    });
  }

  QueryBuilder<CartModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CartModel, String, QQueryOperations> customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<CartModel, int?, QQueryOperations>
      finalTotalMinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalTotalMinorUnits');
    });
  }

  QueryBuilder<CartModel, CartStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCartItemModelCollection on Isar {
  IsarCollection<CartItemModel> get cartItemModels => this.collection();
}

const CartItemModelSchema = CollectionSchema(
  name: r'CartItemModel',
  id: 7298597921153205552,
  properties: {
    r'cartId': PropertySchema(
      id: 0,
      name: r'cartId',
      type: IsarType.long,
    ),
    r'menuItemId': PropertySchema(
      id: 1,
      name: r'menuItemId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 3,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'unitPriceMinorUnits': PropertySchema(
      id: 4,
      name: r'unitPriceMinorUnits',
      type: IsarType.long,
    )
  },
  estimateSize: _cartItemModelEstimateSize,
  serialize: _cartItemModelSerialize,
  deserialize: _cartItemModelDeserialize,
  deserializeProp: _cartItemModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'cartId': IndexSchema(
      id: 5525719335954350174,
      name: r'cartId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'cartId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cartItemModelGetId,
  getLinks: _cartItemModelGetLinks,
  attach: _cartItemModelAttach,
  version: '3.1.0+1',
);

int _cartItemModelEstimateSize(
  CartItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _cartItemModelSerialize(
  CartItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cartId);
  writer.writeLong(offsets[1], object.menuItemId);
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.quantity);
  writer.writeLong(offsets[4], object.unitPriceMinorUnits);
}

CartItemModel _cartItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CartItemModel();
  object.cartId = reader.readLong(offsets[0]);
  object.id = id;
  object.menuItemId = reader.readLong(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.quantity = reader.readLong(offsets[3]);
  object.unitPriceMinorUnits = reader.readLong(offsets[4]);
  return object;
}

P _cartItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cartItemModelGetId(CartItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cartItemModelGetLinks(CartItemModel object) {
  return [];
}

void _cartItemModelAttach(
    IsarCollection<dynamic> col, Id id, CartItemModel object) {
  object.id = id;
}

extension CartItemModelQueryWhereSort
    on QueryBuilder<CartItemModel, CartItemModel, QWhere> {
  QueryBuilder<CartItemModel, CartItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhere> anyCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'cartId'),
      );
    });
  }
}

extension CartItemModelQueryWhere
    on QueryBuilder<CartItemModel, CartItemModel, QWhereClause> {
  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> cartIdEqualTo(
      int cartId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cartId',
        value: [cartId],
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause>
      cartIdNotEqualTo(int cartId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [],
              upper: [cartId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [cartId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [cartId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [],
              upper: [cartId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause>
      cartIdGreaterThan(
    int cartId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cartId',
        lower: [cartId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> cartIdLessThan(
    int cartId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cartId',
        lower: [],
        upper: [cartId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterWhereClause> cartIdBetween(
    int lowerCartId,
    int upperCartId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cartId',
        lower: [lowerCartId],
        includeLower: includeLower,
        upper: [upperCartId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartItemModelQueryFilter
    on QueryBuilder<CartItemModel, CartItemModel, QFilterCondition> {
  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      cartIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      cartIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      cartIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      cartIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cartId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      menuItemIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'menuItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      menuItemIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'menuItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      menuItemIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'menuItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      menuItemIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'menuItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      unitPriceMinorUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPriceMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      unitPriceMinorUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPriceMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      unitPriceMinorUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPriceMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterFilterCondition>
      unitPriceMinorUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPriceMinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartItemModelQueryObject
    on QueryBuilder<CartItemModel, CartItemModel, QFilterCondition> {}

extension CartItemModelQueryLinks
    on QueryBuilder<CartItemModel, CartItemModel, QFilterCondition> {}

extension CartItemModelQuerySortBy
    on QueryBuilder<CartItemModel, CartItemModel, QSortBy> {
  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> sortByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> sortByCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> sortByMenuItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuItemId', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      sortByMenuItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuItemId', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      sortByUnitPriceMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      sortByUnitPriceMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceMinorUnits', Sort.desc);
    });
  }
}

extension CartItemModelQuerySortThenBy
    on QueryBuilder<CartItemModel, CartItemModel, QSortThenBy> {
  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenByCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenByMenuItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuItemId', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      thenByMenuItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuItemId', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      thenByUnitPriceMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QAfterSortBy>
      thenByUnitPriceMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceMinorUnits', Sort.desc);
    });
  }
}

extension CartItemModelQueryWhereDistinct
    on QueryBuilder<CartItemModel, CartItemModel, QDistinct> {
  QueryBuilder<CartItemModel, CartItemModel, QDistinct> distinctByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cartId');
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QDistinct> distinctByMenuItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'menuItemId');
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<CartItemModel, CartItemModel, QDistinct>
      distinctByUnitPriceMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPriceMinorUnits');
    });
  }
}

extension CartItemModelQueryProperty
    on QueryBuilder<CartItemModel, CartItemModel, QQueryProperty> {
  QueryBuilder<CartItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CartItemModel, int, QQueryOperations> cartIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cartId');
    });
  }

  QueryBuilder<CartItemModel, int, QQueryOperations> menuItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'menuItemId');
    });
  }

  QueryBuilder<CartItemModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CartItemModel, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<CartItemModel, int, QQueryOperations>
      unitPriceMinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPriceMinorUnits');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCartPlayLineModelCollection on Isar {
  IsarCollection<CartPlayLineModel> get cartPlayLineModels => this.collection();
}

const CartPlayLineModelSchema = CollectionSchema(
  name: r'CartPlayLineModel',
  id: 7831543927762762252,
  properties: {
    r'billedMinutes': PropertySchema(
      id: 0,
      name: r'billedMinutes',
      type: IsarType.long,
    ),
    r'cartId': PropertySchema(
      id: 1,
      name: r'cartId',
      type: IsarType.long,
    ),
    r'chargeMinorUnits': PropertySchema(
      id: 2,
      name: r'chargeMinorUnits',
      type: IsarType.long,
    ),
    r'plannedMinutes': PropertySchema(
      id: 3,
      name: r'plannedMinutes',
      type: IsarType.long,
    ),
    r'playerCount': PropertySchema(
      id: 4,
      name: r'playerCount',
      type: IsarType.long,
    ),
    r'resourceId': PropertySchema(
      id: 5,
      name: r'resourceId',
      type: IsarType.long,
    ),
    r'resourceName': PropertySchema(
      id: 6,
      name: r'resourceName',
      type: IsarType.string,
    ),
    r'resourceType': PropertySchema(
      id: 7,
      name: r'resourceType',
      type: IsarType.string,
      enumMap: _CartPlayLineModelresourceTypeEnumValueMap,
    ),
    r'sessionId': PropertySchema(
      id: 8,
      name: r'sessionId',
      type: IsarType.long,
    ),
    r'startedAt': PropertySchema(
      id: 9,
      name: r'startedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _cartPlayLineModelEstimateSize,
  serialize: _cartPlayLineModelSerialize,
  deserialize: _cartPlayLineModelDeserialize,
  deserializeProp: _cartPlayLineModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'cartId': IndexSchema(
      id: 5525719335954350174,
      name: r'cartId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'cartId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cartPlayLineModelGetId,
  getLinks: _cartPlayLineModelGetLinks,
  attach: _cartPlayLineModelAttach,
  version: '3.1.0+1',
);

int _cartPlayLineModelEstimateSize(
  CartPlayLineModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.resourceName.length * 3;
  {
    final value = object.resourceType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _cartPlayLineModelSerialize(
  CartPlayLineModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.billedMinutes);
  writer.writeLong(offsets[1], object.cartId);
  writer.writeLong(offsets[2], object.chargeMinorUnits);
  writer.writeLong(offsets[3], object.plannedMinutes);
  writer.writeLong(offsets[4], object.playerCount);
  writer.writeLong(offsets[5], object.resourceId);
  writer.writeString(offsets[6], object.resourceName);
  writer.writeString(offsets[7], object.resourceType?.name);
  writer.writeLong(offsets[8], object.sessionId);
  writer.writeDateTime(offsets[9], object.startedAt);
}

CartPlayLineModel _cartPlayLineModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CartPlayLineModel();
  object.billedMinutes = reader.readLongOrNull(offsets[0]);
  object.cartId = reader.readLong(offsets[1]);
  object.chargeMinorUnits = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.plannedMinutes = reader.readLongOrNull(offsets[3]);
  object.playerCount = reader.readLongOrNull(offsets[4]);
  object.resourceId = reader.readLong(offsets[5]);
  object.resourceName = reader.readString(offsets[6]);
  object.resourceType = _CartPlayLineModelresourceTypeValueEnumMap[
      reader.readStringOrNull(offsets[7])];
  object.sessionId = reader.readLong(offsets[8]);
  object.startedAt = reader.readDateTime(offsets[9]);
  return object;
}

P _cartPlayLineModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_CartPlayLineModelresourceTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CartPlayLineModelresourceTypeEnumValueMap = {
  r'billiardTable': r'billiardTable',
  r'playstationDevice': r'playstationDevice',
  r'cybercafeDevice': r'cybercafeDevice',
};
const _CartPlayLineModelresourceTypeValueEnumMap = {
  r'billiardTable': SessionResourceType.billiardTable,
  r'playstationDevice': SessionResourceType.playstationDevice,
  r'cybercafeDevice': SessionResourceType.cybercafeDevice,
};

Id _cartPlayLineModelGetId(CartPlayLineModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cartPlayLineModelGetLinks(
    CartPlayLineModel object) {
  return [];
}

void _cartPlayLineModelAttach(
    IsarCollection<dynamic> col, Id id, CartPlayLineModel object) {
  object.id = id;
}

extension CartPlayLineModelQueryWhereSort
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QWhere> {
  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhere> anyCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'cartId'),
      );
    });
  }
}

extension CartPlayLineModelQueryWhere
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QWhereClause> {
  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      cartIdEqualTo(int cartId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cartId',
        value: [cartId],
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      cartIdNotEqualTo(int cartId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [],
              upper: [cartId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [cartId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [cartId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cartId',
              lower: [],
              upper: [cartId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      cartIdGreaterThan(
    int cartId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cartId',
        lower: [cartId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      cartIdLessThan(
    int cartId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cartId',
        lower: [],
        upper: [cartId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterWhereClause>
      cartIdBetween(
    int lowerCartId,
    int upperCartId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cartId',
        lower: [lowerCartId],
        includeLower: includeLower,
        upper: [upperCartId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartPlayLineModelQueryFilter
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QFilterCondition> {
  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      billedMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'billedMinutes',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      billedMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'billedMinutes',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      billedMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billedMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      billedMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billedMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      billedMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billedMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      billedMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billedMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      cartIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      cartIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      cartIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      cartIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cartId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      chargeMinorUnitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chargeMinorUnits',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      chargeMinorUnitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chargeMinorUnits',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      chargeMinorUnitsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chargeMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      chargeMinorUnitsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chargeMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      chargeMinorUnitsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chargeMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      chargeMinorUnitsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chargeMinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      plannedMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedMinutes',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      plannedMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedMinutes',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      plannedMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      plannedMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      plannedMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      plannedMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      playerCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerCount',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      playerCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerCount',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      playerCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      playerCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      playerCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      playerCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resourceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resourceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'resourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'resourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resourceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resourceType',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resourceType',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeEqualTo(
    SessionResourceType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeGreaterThan(
    SessionResourceType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeLessThan(
    SessionResourceType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeBetween(
    SessionResourceType? lower,
    SessionResourceType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resourceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resourceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      resourceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      sessionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      sessionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      sessionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      sessionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      startedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterFilterCondition>
      startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartPlayLineModelQueryObject
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QFilterCondition> {}

extension CartPlayLineModelQueryLinks
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QFilterCondition> {}

extension CartPlayLineModelQuerySortBy
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QSortBy> {
  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByBilledMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billedMinutes', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByBilledMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billedMinutes', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByChargeMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chargeMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByChargeMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chargeMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByPlannedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByPlannedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByPlayerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerCount', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByPlayerCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerCount', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByResourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByResourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByResourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByResourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByResourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }
}

extension CartPlayLineModelQuerySortThenBy
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QSortThenBy> {
  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByBilledMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billedMinutes', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByBilledMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billedMinutes', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByChargeMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chargeMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByChargeMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chargeMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByPlannedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByPlannedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByPlayerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerCount', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByPlayerCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerCount', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByResourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByResourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByResourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByResourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByResourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }
}

extension CartPlayLineModelQueryWhereDistinct
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct> {
  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByBilledMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billedMinutes');
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cartId');
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByChargeMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chargeMinorUnits');
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByPlannedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedMinutes');
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByPlayerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerCount');
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceId');
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByResourceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByResourceType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId');
    });
  }

  QueryBuilder<CartPlayLineModel, CartPlayLineModel, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }
}

extension CartPlayLineModelQueryProperty
    on QueryBuilder<CartPlayLineModel, CartPlayLineModel, QQueryProperty> {
  QueryBuilder<CartPlayLineModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CartPlayLineModel, int?, QQueryOperations>
      billedMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billedMinutes');
    });
  }

  QueryBuilder<CartPlayLineModel, int, QQueryOperations> cartIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cartId');
    });
  }

  QueryBuilder<CartPlayLineModel, int?, QQueryOperations>
      chargeMinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chargeMinorUnits');
    });
  }

  QueryBuilder<CartPlayLineModel, int?, QQueryOperations>
      plannedMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedMinutes');
    });
  }

  QueryBuilder<CartPlayLineModel, int?, QQueryOperations>
      playerCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerCount');
    });
  }

  QueryBuilder<CartPlayLineModel, int, QQueryOperations> resourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceId');
    });
  }

  QueryBuilder<CartPlayLineModel, String, QQueryOperations>
      resourceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceName');
    });
  }

  QueryBuilder<CartPlayLineModel, SessionResourceType?, QQueryOperations>
      resourceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceType');
    });
  }

  QueryBuilder<CartPlayLineModel, int, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<CartPlayLineModel, DateTime, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }
}
