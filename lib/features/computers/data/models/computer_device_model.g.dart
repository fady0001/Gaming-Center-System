// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer_device_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetComputerDeviceModelCollection on Isar {
  IsarCollection<ComputerDeviceModel> get computerDeviceModels =>
      this.collection();
}

const ComputerDeviceModelSchema = CollectionSchema(
  name: r'ComputerDeviceModel',
  id: -6693965395030173048,
  properties: {
    r'isActiveFlag': PropertySchema(
      id: 0,
      name: r'isActiveFlag',
      type: IsarType.bool,
    ),
    r'minimumChargeMinutes': PropertySchema(
      id: 1,
      name: r'minimumChargeMinutes',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'rateMinorUnitsPerHour': PropertySchema(
      id: 3,
      name: r'rateMinorUnitsPerHour',
      type: IsarType.long,
    ),
    r'roundingIncrementMinutes': PropertySchema(
      id: 4,
      name: r'roundingIncrementMinutes',
      type: IsarType.long,
    )
  },
  estimateSize: _computerDeviceModelEstimateSize,
  serialize: _computerDeviceModelSerialize,
  deserialize: _computerDeviceModelDeserialize,
  deserializeProp: _computerDeviceModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'isActiveFlag': IndexSchema(
      id: -2109175865324232462,
      name: r'isActiveFlag',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isActiveFlag',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _computerDeviceModelGetId,
  getLinks: _computerDeviceModelGetLinks,
  attach: _computerDeviceModelAttach,
  version: '3.1.0+1',
);

int _computerDeviceModelEstimateSize(
  ComputerDeviceModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _computerDeviceModelSerialize(
  ComputerDeviceModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActiveFlag);
  writer.writeLong(offsets[1], object.minimumChargeMinutes);
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.rateMinorUnitsPerHour);
  writer.writeLong(offsets[4], object.roundingIncrementMinutes);
}

ComputerDeviceModel _computerDeviceModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ComputerDeviceModel();
  object.id = id;
  object.isActiveFlag = reader.readBool(offsets[0]);
  object.minimumChargeMinutes = reader.readLong(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.rateMinorUnitsPerHour = reader.readLong(offsets[3]);
  object.roundingIncrementMinutes = reader.readLong(offsets[4]);
  return object;
}

P _computerDeviceModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
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

Id _computerDeviceModelGetId(ComputerDeviceModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _computerDeviceModelGetLinks(
    ComputerDeviceModel object) {
  return [];
}

void _computerDeviceModelAttach(
    IsarCollection<dynamic> col, Id id, ComputerDeviceModel object) {
  object.id = id;
}

extension ComputerDeviceModelByIndex on IsarCollection<ComputerDeviceModel> {
  Future<ComputerDeviceModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  ComputerDeviceModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<ComputerDeviceModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<ComputerDeviceModel?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(ComputerDeviceModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(ComputerDeviceModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<ComputerDeviceModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<ComputerDeviceModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension ComputerDeviceModelQueryWhereSort
    on QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QWhere> {
  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhere>
      anyIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isActiveFlag'),
      );
    });
  }
}

extension ComputerDeviceModelQueryWhere
    on QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QWhereClause> {
  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
      isActiveFlagEqualTo(bool isActiveFlag) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isActiveFlag',
        value: [isActiveFlag],
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterWhereClause>
      isActiveFlagNotEqualTo(bool isActiveFlag) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActiveFlag',
              lower: [],
              upper: [isActiveFlag],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActiveFlag',
              lower: [isActiveFlag],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActiveFlag',
              lower: [isActiveFlag],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActiveFlag',
              lower: [],
              upper: [isActiveFlag],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ComputerDeviceModelQueryFilter on QueryBuilder<ComputerDeviceModel,
    ComputerDeviceModel, QFilterCondition> {
  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      isActiveFlagEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActiveFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      minimumChargeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      minimumChargeMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      minimumChargeMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      minimumChargeMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimumChargeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
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

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      rateMinorUnitsPerHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rateMinorUnitsPerHour',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      rateMinorUnitsPerHourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rateMinorUnitsPerHour',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      rateMinorUnitsPerHourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rateMinorUnitsPerHour',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      rateMinorUnitsPerHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rateMinorUnitsPerHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      roundingIncrementMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      roundingIncrementMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      roundingIncrementMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterFilterCondition>
      roundingIncrementMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roundingIncrementMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ComputerDeviceModelQueryObject on QueryBuilder<ComputerDeviceModel,
    ComputerDeviceModel, QFilterCondition> {}

extension ComputerDeviceModelQueryLinks on QueryBuilder<ComputerDeviceModel,
    ComputerDeviceModel, QFilterCondition> {}

extension ComputerDeviceModelQuerySortBy
    on QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QSortBy> {
  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByRateMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByRateMinorUnitsPerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      sortByRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.desc);
    });
  }
}

extension ComputerDeviceModelQuerySortThenBy
    on QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QSortThenBy> {
  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByRateMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByRateMinorUnitsPerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.desc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QAfterSortBy>
      thenByRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.desc);
    });
  }
}

extension ComputerDeviceModelQueryWhereDistinct
    on QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QDistinct> {
  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QDistinct>
      distinctByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActiveFlag');
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QDistinct>
      distinctByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimumChargeMinutes');
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QDistinct>
      distinctByRateMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rateMinorUnitsPerHour');
    });
  }

  QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QDistinct>
      distinctByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundingIncrementMinutes');
    });
  }
}

extension ComputerDeviceModelQueryProperty
    on QueryBuilder<ComputerDeviceModel, ComputerDeviceModel, QQueryProperty> {
  QueryBuilder<ComputerDeviceModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ComputerDeviceModel, bool, QQueryOperations>
      isActiveFlagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActiveFlag');
    });
  }

  QueryBuilder<ComputerDeviceModel, int, QQueryOperations>
      minimumChargeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimumChargeMinutes');
    });
  }

  QueryBuilder<ComputerDeviceModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ComputerDeviceModel, int, QQueryOperations>
      rateMinorUnitsPerHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rateMinorUnitsPerHour');
    });
  }

  QueryBuilder<ComputerDeviceModel, int, QQueryOperations>
      roundingIncrementMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundingIncrementMinutes');
    });
  }
}
