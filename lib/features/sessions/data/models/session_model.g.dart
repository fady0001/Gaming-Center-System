// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSessionModelCollection on Isar {
  IsarCollection<SessionModel> get sessionModels => this.collection();
}

const SessionModelSchema = CollectionSchema(
  name: r'SessionModel',
  id: 3961338372060081682,
  properties: {
    r'cafeteriaChargesMinorUnits': PropertySchema(
      id: 0,
      name: r'cafeteriaChargesMinorUnits',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 1,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'rateSnapshotMinimumChargeMinutes': PropertySchema(
      id: 2,
      name: r'rateSnapshotMinimumChargeMinutes',
      type: IsarType.long,
    ),
    r'rateSnapshotMinorUnitsPerHour': PropertySchema(
      id: 3,
      name: r'rateSnapshotMinorUnitsPerHour',
      type: IsarType.long,
    ),
    r'rateSnapshotRoundingIncrementMinutes': PropertySchema(
      id: 4,
      name: r'rateSnapshotRoundingIncrementMinutes',
      type: IsarType.long,
    ),
    r'resourceId': PropertySchema(
      id: 5,
      name: r'resourceId',
      type: IsarType.long,
    ),
    r'resourceType': PropertySchema(
      id: 6,
      name: r'resourceType',
      type: IsarType.string,
      enumMap: _SessionModelresourceTypeEnumValueMap,
    ),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.string,
      enumMap: _SessionModelstatusEnumValueMap,
    )
  },
  estimateSize: _sessionModelEstimateSize,
  serialize: _sessionModelSerialize,
  deserialize: _sessionModelDeserialize,
  deserializeProp: _sessionModelDeserializeProp,
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
    r'startTime': IndexSchema(
      id: -3870335341264752872,
      name: r'startTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sessionModelGetId,
  getLinks: _sessionModelGetLinks,
  attach: _sessionModelAttach,
  version: '3.1.0+1',
);

int _sessionModelEstimateSize(
  SessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.resourceType.name.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _sessionModelSerialize(
  SessionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cafeteriaChargesMinorUnits);
  writer.writeDateTime(offsets[1], object.endTime);
  writer.writeLong(offsets[2], object.rateSnapshotMinimumChargeMinutes);
  writer.writeLong(offsets[3], object.rateSnapshotMinorUnitsPerHour);
  writer.writeLong(offsets[4], object.rateSnapshotRoundingIncrementMinutes);
  writer.writeLong(offsets[5], object.resourceId);
  writer.writeString(offsets[6], object.resourceType.name);
  writer.writeDateTime(offsets[7], object.startTime);
  writer.writeString(offsets[8], object.status.name);
}

SessionModel _sessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SessionModel();
  object.cafeteriaChargesMinorUnits = reader.readLong(offsets[0]);
  object.endTime = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.rateSnapshotMinimumChargeMinutes = reader.readLong(offsets[2]);
  object.rateSnapshotMinorUnitsPerHour = reader.readLong(offsets[3]);
  object.rateSnapshotRoundingIncrementMinutes = reader.readLong(offsets[4]);
  object.resourceId = reader.readLong(offsets[5]);
  object.resourceType = _SessionModelresourceTypeValueEnumMap[
          reader.readStringOrNull(offsets[6])] ??
      SessionResourceType.billiardTable;
  object.startTime = reader.readDateTime(offsets[7]);
  object.status =
      _SessionModelstatusValueEnumMap[reader.readStringOrNull(offsets[8])] ??
          SessionStatus.active;
  return object;
}

P _sessionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (_SessionModelresourceTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SessionResourceType.billiardTable) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (_SessionModelstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SessionStatus.active) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SessionModelresourceTypeEnumValueMap = {
  r'billiardTable': r'billiardTable',
  r'playstationDevice': r'playstationDevice',
  r'cybercafeDevice': r'cybercafeDevice',
};
const _SessionModelresourceTypeValueEnumMap = {
  r'billiardTable': SessionResourceType.billiardTable,
  r'playstationDevice': SessionResourceType.playstationDevice,
  r'cybercafeDevice': SessionResourceType.cybercafeDevice,
};
const _SessionModelstatusEnumValueMap = {
  r'active': r'active',
  r'closed': r'closed',
};
const _SessionModelstatusValueEnumMap = {
  r'active': SessionStatus.active,
  r'closed': SessionStatus.closed,
};

Id _sessionModelGetId(SessionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sessionModelGetLinks(SessionModel object) {
  return [];
}

void _sessionModelAttach(
    IsarCollection<dynamic> col, Id id, SessionModel object) {
  object.id = id;
}

extension SessionModelQueryWhereSort
    on QueryBuilder<SessionModel, SessionModel, QWhere> {
  QueryBuilder<SessionModel, SessionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhere> anyResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'resourceId'),
      );
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhere> anyStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startTime'),
      );
    });
  }
}

extension SessionModelQueryWhere
    on QueryBuilder<SessionModel, SessionModel, QWhereClause> {
  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> resourceIdEqualTo(
      int resourceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'resourceId',
        value: [resourceId],
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause>
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

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause>
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

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause>
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

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> resourceIdBetween(
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

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> startTimeEqualTo(
      DateTime startTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startTime',
        value: [startTime],
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause>
      startTimeNotEqualTo(DateTime startTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [],
              upper: [startTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [startTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [startTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [],
              upper: [startTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause>
      startTimeGreaterThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [startTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> startTimeLessThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [],
        upper: [startTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterWhereClause> startTimeBetween(
    DateTime lowerStartTime,
    DateTime upperStartTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [lowerStartTime],
        includeLower: includeLower,
        upper: [upperStartTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SessionModelQueryFilter
    on QueryBuilder<SessionModel, SessionModel, QFilterCondition> {
  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      cafeteriaChargesMinorUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cafeteriaChargesMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      cafeteriaChargesMinorUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cafeteriaChargesMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      cafeteriaChargesMinorUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cafeteriaChargesMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      cafeteriaChargesMinorUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cafeteriaChargesMinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinimumChargeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rateSnapshotMinimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinimumChargeMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rateSnapshotMinimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinimumChargeMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rateSnapshotMinimumChargeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinimumChargeMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rateSnapshotMinimumChargeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinorUnitsPerHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rateSnapshotMinorUnitsPerHour',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinorUnitsPerHourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rateSnapshotMinorUnitsPerHour',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinorUnitsPerHourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rateSnapshotMinorUnitsPerHour',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotMinorUnitsPerHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rateSnapshotMinorUnitsPerHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotRoundingIncrementMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rateSnapshotRoundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotRoundingIncrementMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rateSnapshotRoundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotRoundingIncrementMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rateSnapshotRoundingIncrementMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      rateSnapshotRoundingIncrementMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rateSnapshotRoundingIncrementMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      resourceIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceId',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      resourceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      resourceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resourceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      resourceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      resourceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition> statusEqualTo(
    SessionStatus value, {
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      statusGreaterThan(
    SessionStatus value, {
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      statusLessThan(
    SessionStatus value, {
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition> statusBetween(
    SessionStatus lower,
    SessionStatus upper, {
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension SessionModelQueryObject
    on QueryBuilder<SessionModel, SessionModel, QFilterCondition> {}

extension SessionModelQueryLinks
    on QueryBuilder<SessionModel, SessionModel, QFilterCondition> {}

extension SessionModelQuerySortBy
    on QueryBuilder<SessionModel, SessionModel, QSortBy> {
  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByCafeteriaChargesMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cafeteriaChargesMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByCafeteriaChargesMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cafeteriaChargesMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByRateSnapshotMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByRateSnapshotMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByRateSnapshotMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinorUnitsPerHour', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByRateSnapshotMinorUnitsPerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinorUnitsPerHour', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByRateSnapshotRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotRoundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByRateSnapshotRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'rateSnapshotRoundingIncrementMinutes', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByResourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByResourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      sortByResourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SessionModelQuerySortThenBy
    on QueryBuilder<SessionModel, SessionModel, QSortThenBy> {
  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByCafeteriaChargesMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cafeteriaChargesMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByCafeteriaChargesMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cafeteriaChargesMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByRateSnapshotMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinimumChargeMinutes', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByRateSnapshotMinimumChargeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinimumChargeMinutes', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByRateSnapshotMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinorUnitsPerHour', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByRateSnapshotMinorUnitsPerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotMinorUnitsPerHour', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByRateSnapshotRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rateSnapshotRoundingIncrementMinutes', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByRateSnapshotRoundingIncrementMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'rateSnapshotRoundingIncrementMinutes', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByResourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceId', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByResourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy>
      thenByResourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceType', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SessionModelQueryWhereDistinct
    on QueryBuilder<SessionModel, SessionModel, QDistinct> {
  QueryBuilder<SessionModel, SessionModel, QDistinct>
      distinctByCafeteriaChargesMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cafeteriaChargesMinorUnits');
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct>
      distinctByRateSnapshotMinimumChargeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rateSnapshotMinimumChargeMinutes');
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct>
      distinctByRateSnapshotMinorUnitsPerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rateSnapshotMinorUnitsPerHour');
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct>
      distinctByRateSnapshotRoundingIncrementMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rateSnapshotRoundingIncrementMinutes');
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct> distinctByResourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceId');
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct> distinctByResourceType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<SessionModel, SessionModel, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension SessionModelQueryProperty
    on QueryBuilder<SessionModel, SessionModel, QQueryProperty> {
  QueryBuilder<SessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SessionModel, int, QQueryOperations>
      cafeteriaChargesMinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cafeteriaChargesMinorUnits');
    });
  }

  QueryBuilder<SessionModel, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<SessionModel, int, QQueryOperations>
      rateSnapshotMinimumChargeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rateSnapshotMinimumChargeMinutes');
    });
  }

  QueryBuilder<SessionModel, int, QQueryOperations>
      rateSnapshotMinorUnitsPerHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rateSnapshotMinorUnitsPerHour');
    });
  }

  QueryBuilder<SessionModel, int, QQueryOperations>
      rateSnapshotRoundingIncrementMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rateSnapshotRoundingIncrementMinutes');
    });
  }

  QueryBuilder<SessionModel, int, QQueryOperations> resourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceId');
    });
  }

  QueryBuilder<SessionModel, SessionResourceType, QQueryOperations>
      resourceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceType');
    });
  }

  QueryBuilder<SessionModel, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<SessionModel, SessionStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
