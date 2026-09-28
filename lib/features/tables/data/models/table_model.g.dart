// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTableModelCollection on Isar {
  IsarCollection<TableModel> get tableModels => this.collection();
}

const TableModelSchema = CollectionSchema(
  name: r'TableModel',
  id: 3157658449793411318,
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
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.string,
      enumMap: _TableModeltypeEnumValueMap,
    )
  },
  estimateSize: _tableModelEstimateSize,
  serialize: _tableModelSerialize,
  deserialize: _tableModelDeserialize,
  deserializeProp: _tableModelDeserializeProp,
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
  getId: _tableModelGetId,
  getLinks: _tableModelGetLinks,
  attach: _tableModelAttach,
  version: '3.1.0+1',
);

int _tableModelEstimateSize(
  TableModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _tableModelSerialize(
  TableModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActiveFlag);
  writer.writeLong(offsets[1], object.minimumChargeMinutes);
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.rateMinorUnitsPerHour);
  writer.writeLong(offsets[4], object.roundingIncrementMinutes);
  writer.writeString(offsets[5], object.type.name);
}

TableModel _tableModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TableModel();
  object.id = id;
  object.isActiveFlag = reader.readBool(offsets[0]);
  object.minimumChargeMinutes = reader.readLong(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.rateMinorUnitsPerHour = reader.readLong(offsets[3]);
  object.roundingIncrementMinutes = reader.readLong(offsets[4]);
  object.type =
      _TableModeltypeValueEnumMap[reader.readStringOrNull(offsets[5])] ??
          TableType.billiards;
  return object;
}

P _tableModelDeserializeProp<P>(
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
    case 5:
      return (_TableModeltypeValueEnumMap[reader.readStringOrNull(offset)] ??
          TableType.billiards) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TableModeltypeEnumValueMap = {
  r'billiards': r'billiards',
  r'pingPong': r'pingPong',
  r'airHockey': r'airHockey',
  r'foosball': r'foosball',
  r'other': r'other',
  r'cardTable': r'cardTable',
};
const _TableModeltypeValueEnumMap = {
  r'billiards': TableType.billiards,
  r'pingPong': TableType.pingPong,
  r'airHockey': TableType.airHockey,
  r'foosball': TableType.foosball,
  r'other': TableType.other,
  r'cardTable': TableType.cardTable,
};

Id _tableModelGetId(TableModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tableModelGetLinks(TableModel object) {
  return [];
}

void _tableModelAttach(IsarCollection<dynamic> col, Id id, TableModel object) {
  object.id = id;
}

extension TableModelByIndex on IsarCollection<TableModel> {
  Future<TableModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  TableModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<TableModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<TableModel?> getAllByNameSync(List<String> nameValues) {
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

  Future<Id> putByName(TableModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(TableModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<TableModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<TableModel> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension TableModelQueryWhereSort
    on QueryBuilder<TableModel, TableModel, QWhere> {
  QueryBuilder<TableModel, TableModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterWhere> anyIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isActiveFlag'),
      );
    });
  }
}

extension TableModelQueryWhere
    on QueryBuilder<TableModel, TableModel, QWhereClause> {
  QueryBuilder<TableModel, TableModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TableModel, TableModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<TableModel, TableModel, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterWhereClause> nameNotEqualTo(
      String name) {
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

  QueryBuilder<TableModel, TableModel, QAfterWhereClause> isActiveFlagEqualTo(
      bool isActiveFlag) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isActiveFlag',
        value: [isActiveFlag],
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterWhereClause>
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

extension TableModelQueryFilter
    on QueryBuilder<TableModel, TableModel, QFilterCondition> {
  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
      isActiveFlagEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActiveFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
      minimumChargeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
      rateMinorUnitsPerHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rateMinorUnitsPerHour',
        value: value,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
      roundingIncrementMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition>
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

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeEqualTo(
    TableType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeGreaterThan(
    TableType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeLessThan(
    TableType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeBetween(
    TableType lower,
    TableType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension TableModelQueryObject
    on QueryBuilder<TableModel, TableModel, QFilterCondition> {}

extension TableModelQueryLinks
    on QueryBuilder<TableModel, TableModel, QFilterCondition> {}

extension TableModelQuerySortBy
    on QueryBuilder<TableModel, TableModel, QSortBy> {
  QueryBuilder<TableModel, TableModel, QAfterSortBy> sortByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> sortByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      sortByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      sortByMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      sortByRateMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      sortByRateMinorUnitsPerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      sortByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      sortByRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TableModelQuerySortThenBy
    on QueryBuilder<TableModel, TableModel, QSortThenBy> {
  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      thenByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      thenByMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      thenByRateMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      thenByRateMinorUnitsPerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateMinorUnitsPerHour', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      thenByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy>
      thenByRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.desc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TableModel, TableModel, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TableModelQueryWhereDistinct
    on QueryBuilder<TableModel, TableModel, QDistinct> {
  QueryBuilder<TableModel, TableModel, QDistinct> distinctByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActiveFlag');
    });
  }

  QueryBuilder<TableModel, TableModel, QDistinct>
      distinctByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimumChargeMinutes');
    });
  }

  QueryBuilder<TableModel, TableModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TableModel, TableModel, QDistinct>
      distinctByRateMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rateMinorUnitsPerHour');
    });
  }

  QueryBuilder<TableModel, TableModel, QDistinct>
      distinctByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundingIncrementMinutes');
    });
  }

  QueryBuilder<TableModel, TableModel, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension TableModelQueryProperty
    on QueryBuilder<TableModel, TableModel, QQueryProperty> {
  QueryBuilder<TableModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TableModel, bool, QQueryOperations> isActiveFlagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActiveFlag');
    });
  }

  QueryBuilder<TableModel, int, QQueryOperations>
      minimumChargeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimumChargeMinutes');
    });
  }

  QueryBuilder<TableModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TableModel, int, QQueryOperations>
      rateMinorUnitsPerHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rateMinorUnitsPerHour');
    });
  }

  QueryBuilder<TableModel, int, QQueryOperations>
      roundingIncrementMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundingIncrementMinutes');
    });
  }

  QueryBuilder<TableModel, TableType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
