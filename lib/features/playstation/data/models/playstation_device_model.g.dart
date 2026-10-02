// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playstation_device_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayStationDeviceModelCollection on Isar {
  IsarCollection<PlayStationDeviceModel> get playStationDeviceModels =>
      this.collection();
}

const PlayStationDeviceModelSchema = CollectionSchema(
  name: r'PlayStationDeviceModel',
  id: 7156492311808196286,
  properties: {
    r'isActiveFlag': PropertySchema(
      id: 0,
      name: r'isActiveFlag',
      type: IsarType.bool,
    ),
    r'isUnderMaintenance': PropertySchema(
      id: 1,
      name: r'isUnderMaintenance',
      type: IsarType.bool,
    ),
    r'minimumChargeMinutes': PropertySchema(
      id: 2,
      name: r'minimumChargeMinutes',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'rate1MinorUnits': PropertySchema(
      id: 4,
      name: r'rate1MinorUnits',
      type: IsarType.long,
    ),
    r'rate2MinorUnits': PropertySchema(
      id: 5,
      name: r'rate2MinorUnits',
      type: IsarType.long,
    ),
    r'rate3MinorUnits': PropertySchema(
      id: 6,
      name: r'rate3MinorUnits',
      type: IsarType.long,
    ),
    r'rate4MinorUnits': PropertySchema(
      id: 7,
      name: r'rate4MinorUnits',
      type: IsarType.long,
    ),
    r'roundingIncrementMinutes': PropertySchema(
      id: 8,
      name: r'roundingIncrementMinutes',
      type: IsarType.long,
    )
  },
  estimateSize: _playStationDeviceModelEstimateSize,
  serialize: _playStationDeviceModelSerialize,
  deserialize: _playStationDeviceModelDeserialize,
  deserializeProp: _playStationDeviceModelDeserializeProp,
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
  getId: _playStationDeviceModelGetId,
  getLinks: _playStationDeviceModelGetLinks,
  attach: _playStationDeviceModelAttach,
  version: '3.1.0+1',
);

int _playStationDeviceModelEstimateSize(
  PlayStationDeviceModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _playStationDeviceModelSerialize(
  PlayStationDeviceModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActiveFlag);
  writer.writeBool(offsets[1], object.isUnderMaintenance);
  writer.writeLong(offsets[2], object.minimumChargeMinutes);
  writer.writeString(offsets[3], object.name);
  writer.writeLong(offsets[4], object.rate1MinorUnits);
  writer.writeLong(offsets[5], object.rate2MinorUnits);
  writer.writeLong(offsets[6], object.rate3MinorUnits);
  writer.writeLong(offsets[7], object.rate4MinorUnits);
  writer.writeLong(offsets[8], object.roundingIncrementMinutes);
}

PlayStationDeviceModel _playStationDeviceModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayStationDeviceModel();
  object.id = id;
  object.isActiveFlag = reader.readBool(offsets[0]);
  object.isUnderMaintenance = reader.readBool(offsets[1]);
  object.minimumChargeMinutes = reader.readLong(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.rate1MinorUnits = reader.readLong(offsets[4]);
  object.rate2MinorUnits = reader.readLong(offsets[5]);
  object.rate3MinorUnits = reader.readLong(offsets[6]);
  object.rate4MinorUnits = reader.readLong(offsets[7]);
  object.roundingIncrementMinutes = reader.readLong(offsets[8]);
  return object;
}

P _playStationDeviceModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playStationDeviceModelGetId(PlayStationDeviceModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playStationDeviceModelGetLinks(
    PlayStationDeviceModel object) {
  return [];
}

void _playStationDeviceModelAttach(
    IsarCollection<dynamic> col, Id id, PlayStationDeviceModel object) {
  object.id = id;
}

extension PlayStationDeviceModelByIndex
    on IsarCollection<PlayStationDeviceModel> {
  Future<PlayStationDeviceModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  PlayStationDeviceModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<PlayStationDeviceModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<PlayStationDeviceModel?> getAllByNameSync(List<String> nameValues) {
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

  Future<Id> putByName(PlayStationDeviceModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(PlayStationDeviceModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<PlayStationDeviceModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<PlayStationDeviceModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension PlayStationDeviceModelQueryWhereSort
    on QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QWhere> {
  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterWhere>
      anyIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isActiveFlag'),
      );
    });
  }
}

extension PlayStationDeviceModelQueryWhere on QueryBuilder<
    PlayStationDeviceModel, PlayStationDeviceModel, QWhereClause> {
  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> nameNotEqualTo(String name) {
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> isActiveFlagEqualTo(bool isActiveFlag) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isActiveFlag',
        value: [isActiveFlag],
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterWhereClause> isActiveFlagNotEqualTo(bool isActiveFlag) {
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

extension PlayStationDeviceModelQueryFilter on QueryBuilder<
    PlayStationDeviceModel, PlayStationDeviceModel, QFilterCondition> {
  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> isActiveFlagEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActiveFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> isUnderMaintenanceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUnderMaintenance',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> minimumChargeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> minimumChargeMinutesGreaterThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> minimumChargeMinutesLessThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> minimumChargeMinutesBetween(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate1MinorUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate1MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate1MinorUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rate1MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate1MinorUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rate1MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate1MinorUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rate1MinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate2MinorUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate2MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate2MinorUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rate2MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate2MinorUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rate2MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate2MinorUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rate2MinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate3MinorUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate3MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate3MinorUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rate3MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate3MinorUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rate3MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate3MinorUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rate3MinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate4MinorUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate4MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate4MinorUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rate4MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate4MinorUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rate4MinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> rate4MinorUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rate4MinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> roundingIncrementMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> roundingIncrementMinutesGreaterThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> roundingIncrementMinutesLessThan(
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

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel,
      QAfterFilterCondition> roundingIncrementMinutesBetween(
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

extension PlayStationDeviceModelQueryObject on QueryBuilder<
    PlayStationDeviceModel, PlayStationDeviceModel, QFilterCondition> {}

extension PlayStationDeviceModelQueryLinks on QueryBuilder<
    PlayStationDeviceModel, PlayStationDeviceModel, QFilterCondition> {}

extension PlayStationDeviceModelQuerySortBy
    on QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QSortBy> {
  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByIsUnderMaintenance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnderMaintenance', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByIsUnderMaintenanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnderMaintenance', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate1MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate1MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate1MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate1MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate2MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate2MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate2MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate2MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate3MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate3MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate3MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate3MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate4MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate4MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRate4MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate4MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      sortByRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.desc);
    });
  }
}

extension PlayStationDeviceModelQuerySortThenBy on QueryBuilder<
    PlayStationDeviceModel, PlayStationDeviceModel, QSortThenBy> {
  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByIsUnderMaintenance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnderMaintenance', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByIsUnderMaintenanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnderMaintenance', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate1MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate1MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate1MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate1MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate2MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate2MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate2MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate2MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate3MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate3MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate3MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate3MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate4MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate4MinorUnits', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRate4MinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate4MinorUnits', Sort.desc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QAfterSortBy>
      thenByRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingIncrementMinutes', Sort.desc);
    });
  }
}

extension PlayStationDeviceModelQueryWhereDistinct
    on QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct> {
  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActiveFlag');
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByIsUnderMaintenance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUnderMaintenance');
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimumChargeMinutes');
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByRate1MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate1MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByRate2MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate2MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByRate3MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate3MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByRate4MinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate4MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, PlayStationDeviceModel, QDistinct>
      distinctByRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundingIncrementMinutes');
    });
  }
}

extension PlayStationDeviceModelQueryProperty on QueryBuilder<
    PlayStationDeviceModel, PlayStationDeviceModel, QQueryProperty> {
  QueryBuilder<PlayStationDeviceModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlayStationDeviceModel, bool, QQueryOperations>
      isActiveFlagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActiveFlag');
    });
  }

  QueryBuilder<PlayStationDeviceModel, bool, QQueryOperations>
      isUnderMaintenanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUnderMaintenance');
    });
  }

  QueryBuilder<PlayStationDeviceModel, int, QQueryOperations>
      minimumChargeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimumChargeMinutes');
    });
  }

  QueryBuilder<PlayStationDeviceModel, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PlayStationDeviceModel, int, QQueryOperations>
      rate1MinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate1MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, int, QQueryOperations>
      rate2MinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate2MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, int, QQueryOperations>
      rate3MinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate3MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, int, QQueryOperations>
      rate4MinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate4MinorUnits');
    });
  }

  QueryBuilder<PlayStationDeviceModel, int, QQueryOperations>
      roundingIncrementMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundingIncrementMinutes');
    });
  }
}
