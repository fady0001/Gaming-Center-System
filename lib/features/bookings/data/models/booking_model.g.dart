// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookingModelCollection on Isar {
  IsarCollection<BookingModel> get bookingModels => this.collection();
}

const BookingModelSchema = CollectionSchema(
  name: r'BookingModel',
  id: 643181679485769242,
  properties: {
    r'convertedCartId': PropertySchema(
      id: 0,
      name: r'convertedCartId',
      type: IsarType.long,
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
    r'endAt': PropertySchema(
      id: 3,
      name: r'endAt',
      type: IsarType.dateTime,
    ),
    r'phone': PropertySchema(
      id: 4,
      name: r'phone',
      type: IsarType.string,
    ),
    r'reminderShownAt': PropertySchema(
      id: 5,
      name: r'reminderShownAt',
      type: IsarType.dateTime,
    ),
    r'resourceId': PropertySchema(
      id: 6,
      name: r'resourceId',
      type: IsarType.long,
    ),
    r'resourceName': PropertySchema(
      id: 7,
      name: r'resourceName',
      type: IsarType.string,
    ),
    r'resourceType': PropertySchema(
      id: 8,
      name: r'resourceType',
      type: IsarType.string,
      enumMap: _BookingModelresourceTypeEnumValueMap,
    ),
    r'startAt': PropertySchema(
      id: 9,
      name: r'startAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
      enumMap: _BookingModelstatusEnumValueMap,
    )
  },
  estimateSize: _bookingModelEstimateSize,
  serialize: _bookingModelSerialize,
  deserialize: _bookingModelDeserialize,
  deserializeProp: _bookingModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'resourceId': IndexSchema(
      id: 8413634267385686812,
      name: r'resourceId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'resourceId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'startAt': IndexSchema(
      id: 4187465024431158613,
      name: r'startAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookingModelGetId,
  getLinks: _bookingModelGetLinks,
  attach: _bookingModelAttach,
  version: '3.1.0+1',
);

int _bookingModelEstimateSize(
  BookingModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  bytesCount += 3 + object.resourceName.length * 3;
  bytesCount += 3 + object.resourceType.name.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _bookingModelSerialize(
  BookingModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.convertedCartId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.customerName);
  writer.writeDateTime(offsets[3], object.endAt);
  writer.writeString(offsets[4], object.phone);
  writer.writeDateTime(offsets[5], object.reminderShownAt);
  writer.writeLong(offsets[6], object.resourceId);
  writer.writeString(offsets[7], object.resourceName);
  writer.writeString(offsets[8], object.resourceType.name);
  writer.writeDateTime(offsets[9], object.startAt);
  writer.writeString(offsets[10], object.status.name);
}

BookingModel _bookingModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookingModel();
  object.convertedCartId = reader.readLongOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.customerName = reader.readString(offsets[2]);
  object.endAt = reader.readDateTime(offsets[3]);
  object.id = id;
  object.phone = reader.readString(offsets[4]);
  object.reminderShownAt = reader.readDateTimeOrNull(offsets[5]);
  object.resourceId = reader.readLong(offsets[6]);
  object.resourceName = reader.readString(offsets[7]);
  object.resourceType = _BookingModelresourceTypeValueEnumMap[
          reader.readStringOrNull(offsets[8])] ??
      SessionResourceType.billiardTable;
  object.startAt = reader.readDateTime(offsets[9]);
  object.status =
      _BookingModelstatusValueEnumMap[reader.readStringOrNull(offsets[10])] ??
          BookingStatus.scheduled;
  return object;
}

P _bookingModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_BookingModelresourceTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SessionResourceType.billiardTable) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (_BookingModelstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          BookingStatus.scheduled) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BookingModelresourceTypeEnumValueMap = {
  r'billiardTable': r'billiardTable',
  r'playstationDevice': r'playstationDevice',
  r'cybercafeDevice': r'cybercafeDevice',
};
const _BookingModelresourceTypeValueEnumMap = {
  r'billiardTable': SessionResourceType.billiardTable,
  r'playstationDevice': SessionResourceType.playstationDevice,
  r'cybercafeDevice': SessionResourceType.cybercafeDevice,
};
const _BookingModelstatusEnumValueMap = {
  r'scheduled': r'scheduled',
  r'converted': r'converted',
  r'cancelled': r'cancelled',
};
const _BookingModelstatusValueEnumMap = {
  r'scheduled': BookingStatus.scheduled,
  r'converted': BookingStatus.converted,
  r'cancelled': BookingStatus.cancelled,
};

Id _bookingModelGetId(BookingModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookingModelGetLinks(BookingModel object) {
  return [];
}

void _bookingModelAttach(
    IsarCollection<dynamic> col, Id id, BookingModel object) {
  object.id = id;
}

extension BookingModelQueryWhereSort
    on QueryBuilder<BookingModel, BookingModel, QWhere> {
  QueryBuilder<BookingModel, BookingModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhere> anyResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'resourceId'),
      );
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhere> anyStartAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startAt'),
      );
    });
  }
}

extension BookingModelQueryWhere
    on QueryBuilder<BookingModel, BookingModel, QWhereClause> {
  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> resourceIdEqualTo(
      int resourceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'resourceId',
        value: [resourceId],
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause>
      resourceIdNotEqualTo(int resourceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'resourceId',
              lower: [],
              upper: [resourceId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'resourceId',
              lower: [resourceId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'resourceId',
              lower: [resourceId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'resourceId',
              lower: [],
              upper: [resourceId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause>
      resourceIdGreaterThan(
    int resourceId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'resourceId',
        lower: [resourceId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause>
      resourceIdLessThan(
    int resourceId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'resourceId',
        lower: [],
        upper: [resourceId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> resourceIdBetween(
    int lowerResourceId,
    int upperResourceId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'resourceId',
        lower: [lowerResourceId],
        includeLower: includeLower,
        upper: [upperResourceId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> startAtEqualTo(
      DateTime startAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startAt',
        value: [startAt],
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> startAtNotEqualTo(
      DateTime startAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startAt',
              lower: [],
              upper: [startAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startAt',
              lower: [startAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startAt',
              lower: [startAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startAt',
              lower: [],
              upper: [startAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause>
      startAtGreaterThan(
    DateTime startAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startAt',
        lower: [startAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> startAtLessThan(
    DateTime startAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startAt',
        lower: [],
        upper: [startAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterWhereClause> startAtBetween(
    DateTime lowerStartAt,
    DateTime upperStartAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startAt',
        lower: [lowerStartAt],
        includeLower: includeLower,
        upper: [upperStartAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookingModelQueryFilter
    on QueryBuilder<BookingModel, BookingModel, QFilterCondition> {
  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      convertedCartIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'convertedCartId',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      convertedCartIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'convertedCartId',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      convertedCartIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convertedCartId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      convertedCartIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'convertedCartId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      convertedCartIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'convertedCartId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      convertedCartIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'convertedCartId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      customerNameEqualTo(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      customerNameBetween(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> endAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      endAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> endAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> endAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> phoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      phoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> phoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> phoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      reminderShownAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reminderShownAt',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      reminderShownAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reminderShownAt',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      reminderShownAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderShownAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      reminderShownAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reminderShownAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      reminderShownAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reminderShownAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      reminderShownAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reminderShownAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resourceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeEqualTo(
    SessionResourceType value, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeGreaterThan(
    SessionResourceType value, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeLessThan(
    SessionResourceType value, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeBetween(
    SessionResourceType lower,
    SessionResourceType upper, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resourceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      resourceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      startAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      startAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      startAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      startAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> statusEqualTo(
    BookingStatus value, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      statusGreaterThan(
    BookingStatus value, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      statusLessThan(
    BookingStatus value, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> statusBetween(
    BookingStatus lower,
    BookingStatus upper, {
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension BookingModelQueryObject
    on QueryBuilder<BookingModel, BookingModel, QFilterCondition> {}

extension BookingModelQueryLinks
    on QueryBuilder<BookingModel, BookingModel, QFilterCondition> {}

extension BookingModelQuerySortBy
    on QueryBuilder<BookingModel, BookingModel, QSortBy> {
  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByConvertedCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedCartId', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByConvertedCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedCartId', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByEndAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByEndAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByReminderShownAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderShownAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByReminderShownAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderShownAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByResourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByResourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByResourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByResourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      sortByResourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByStartAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByStartAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension BookingModelQuerySortThenBy
    on QueryBuilder<BookingModel, BookingModel, QSortThenBy> {
  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByConvertedCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedCartId', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByConvertedCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedCartId', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByEndAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByEndAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByReminderShownAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderShownAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByReminderShownAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderShownAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByResourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByResourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByResourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceName', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByResourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy>
      thenByResourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByStartAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByStartAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.desc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension BookingModelQueryWhereDistinct
    on QueryBuilder<BookingModel, BookingModel, QDistinct> {
  QueryBuilder<BookingModel, BookingModel, QDistinct>
      distinctByConvertedCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convertedCartId');
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByCustomerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByEndAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endAt');
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct>
      distinctByReminderShownAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderShownAt');
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceId');
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByResourceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByResourceType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByStartAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startAt');
    });
  }

  QueryBuilder<BookingModel, BookingModel, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension BookingModelQueryProperty
    on QueryBuilder<BookingModel, BookingModel, QQueryProperty> {
  QueryBuilder<BookingModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookingModel, int?, QQueryOperations> convertedCartIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convertedCartId');
    });
  }

  QueryBuilder<BookingModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BookingModel, String, QQueryOperations> customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<BookingModel, DateTime, QQueryOperations> endAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endAt');
    });
  }

  QueryBuilder<BookingModel, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<BookingModel, DateTime?, QQueryOperations>
      reminderShownAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderShownAt');
    });
  }

  QueryBuilder<BookingModel, int, QQueryOperations> resourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceId');
    });
  }

  QueryBuilder<BookingModel, String, QQueryOperations> resourceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceName');
    });
  }

  QueryBuilder<BookingModel, SessionResourceType, QQueryOperations>
      resourceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceType');
    });
  }

  QueryBuilder<BookingModel, DateTime, QQueryOperations> startAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startAt');
    });
  }

  QueryBuilder<BookingModel, BookingStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
