// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMenuItemModelCollection on Isar {
  IsarCollection<MenuItemModel> get menuItemModels => this.collection();
}

const MenuItemModelSchema = CollectionSchema(
  name: r'MenuItemModel',
  id: 7014635700844098072,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
      enumMap: _MenuItemModelcategoryEnumValueMap,
    ),
    r'isActiveFlag': PropertySchema(
      id: 1,
      name: r'isActiveFlag',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'priceMinorUnits': PropertySchema(
      id: 3,
      name: r'priceMinorUnits',
      type: IsarType.long,
    ),
    r'stockQuantity': PropertySchema(
      id: 4,
      name: r'stockQuantity',
      type: IsarType.long,
    )
  },
  estimateSize: _menuItemModelEstimateSize,
  serialize: _menuItemModelSerialize,
  deserialize: _menuItemModelDeserialize,
  deserializeProp: _menuItemModelDeserializeProp,
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
  getId: _menuItemModelGetId,
  getLinks: _menuItemModelGetLinks,
  attach: _menuItemModelAttach,
  version: '3.1.0+1',
);

int _menuItemModelEstimateSize(
  MenuItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.name.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _menuItemModelSerialize(
  MenuItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category.name);
  writer.writeBool(offsets[1], object.isActiveFlag);
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.priceMinorUnits);
  writer.writeLong(offsets[4], object.stockQuantity);
}

MenuItemModel _menuItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MenuItemModel();
  object.category =
      _MenuItemModelcategoryValueEnumMap[reader.readStringOrNull(offsets[0])] ??
          MenuCategory.food;
  object.id = id;
  object.isActiveFlag = reader.readBool(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.priceMinorUnits = reader.readLong(offsets[3]);
  object.stockQuantity = reader.readLong(offsets[4]);
  return object;
}

P _menuItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_MenuItemModelcategoryValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MenuCategory.food) as P;
    case 1:
      return (reader.readBool(offset)) as P;
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

const _MenuItemModelcategoryEnumValueMap = {
  r'food': r'food',
  r'coldDrinks': r'coldDrinks',
  r'hotDrinks': r'hotDrinks',
  r'hookah': r'hookah',
  r'other': r'other',
};
const _MenuItemModelcategoryValueEnumMap = {
  r'food': MenuCategory.food,
  r'coldDrinks': MenuCategory.coldDrinks,
  r'hotDrinks': MenuCategory.hotDrinks,
  r'hookah': MenuCategory.hookah,
  r'other': MenuCategory.other,
};

Id _menuItemModelGetId(MenuItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _menuItemModelGetLinks(MenuItemModel object) {
  return [];
}

void _menuItemModelAttach(
    IsarCollection<dynamic> col, Id id, MenuItemModel object) {
  object.id = id;
}

extension MenuItemModelByIndex on IsarCollection<MenuItemModel> {
  Future<MenuItemModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  MenuItemModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<MenuItemModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<MenuItemModel?> getAllByNameSync(List<String> nameValues) {
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

  Future<Id> putByName(MenuItemModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(MenuItemModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<MenuItemModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<MenuItemModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension MenuItemModelQueryWhereSort
    on QueryBuilder<MenuItemModel, MenuItemModel, QWhere> {
  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhere> anyIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isActiveFlag'),
      );
    });
  }
}

extension MenuItemModelQueryWhere
    on QueryBuilder<MenuItemModel, MenuItemModel, QWhereClause> {
  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause> nameNotEqualTo(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause>
      isActiveFlagEqualTo(bool isActiveFlag) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isActiveFlag',
        value: [isActiveFlag],
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterWhereClause>
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

extension MenuItemModelQueryFilter
    on QueryBuilder<MenuItemModel, MenuItemModel, QFilterCondition> {
  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryEqualTo(
    MenuCategory value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryGreaterThan(
    MenuCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryLessThan(
    MenuCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryBetween(
    MenuCategory lower,
    MenuCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      isActiveFlagEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActiveFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      priceMinorUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      priceMinorUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      priceMinorUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceMinorUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      priceMinorUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceMinorUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      stockQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      stockQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      stockQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterFilterCondition>
      stockQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MenuItemModelQueryObject
    on QueryBuilder<MenuItemModel, MenuItemModel, QFilterCondition> {}

extension MenuItemModelQueryLinks
    on QueryBuilder<MenuItemModel, MenuItemModel, QFilterCondition> {}

extension MenuItemModelQuerySortBy
    on QueryBuilder<MenuItemModel, MenuItemModel, QSortBy> {
  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      sortByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      sortByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      sortByPriceMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      sortByPriceMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      sortByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      sortByStockQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.desc);
    });
  }
}

extension MenuItemModelQuerySortThenBy
    on QueryBuilder<MenuItemModel, MenuItemModel, QSortThenBy> {
  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      thenByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      thenByIsActiveFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveFlag', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      thenByPriceMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMinorUnits', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      thenByPriceMinorUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMinorUnits', Sort.desc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      thenByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.asc);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QAfterSortBy>
      thenByStockQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.desc);
    });
  }
}

extension MenuItemModelQueryWhereDistinct
    on QueryBuilder<MenuItemModel, MenuItemModel, QDistinct> {
  QueryBuilder<MenuItemModel, MenuItemModel, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QDistinct>
      distinctByIsActiveFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActiveFlag');
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QDistinct>
      distinctByPriceMinorUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceMinorUnits');
    });
  }

  QueryBuilder<MenuItemModel, MenuItemModel, QDistinct>
      distinctByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockQuantity');
    });
  }
}

extension MenuItemModelQueryProperty
    on QueryBuilder<MenuItemModel, MenuItemModel, QQueryProperty> {
  QueryBuilder<MenuItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MenuItemModel, MenuCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<MenuItemModel, bool, QQueryOperations> isActiveFlagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActiveFlag');
    });
  }

  QueryBuilder<MenuItemModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MenuItemModel, int, QQueryOperations> priceMinorUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceMinorUnits');
    });
  }

  QueryBuilder<MenuItemModel, int, QQueryOperations> stockQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockQuantity');
    });
  }
}
