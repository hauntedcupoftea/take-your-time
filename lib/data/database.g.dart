// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PersonalStatsTable extends PersonalStats
    with TableInfo<$PersonalStatsTable, PersonalStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonalStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMinutesMeta = const VerificationMeta(
    'totalMinutes',
  );
  @override
  late final GeneratedColumn<int> totalMinutes = GeneratedColumn<int>(
    'total_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<StatDifficulty, int> difficulty =
      GeneratedColumn<int>(
        'difficulty',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<StatDifficulty>($PersonalStatsTable.$converterdifficulty);
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _archiveReasonMeta = const VerificationMeta(
    'archiveReason',
  );
  @override
  late final GeneratedColumn<String> archiveReason = GeneratedColumn<String>(
    'archive_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    totalMinutes,
    difficulty,
    isArchived,
    archivedAt,
    archiveReason,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personal_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonalStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('total_minutes')) {
      context.handle(
        _totalMinutesMeta,
        totalMinutes.isAcceptableOrUnknown(
          data['total_minutes']!,
          _totalMinutesMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('archive_reason')) {
      context.handle(
        _archiveReasonMeta,
        archiveReason.isAcceptableOrUnknown(
          data['archive_reason']!,
          _archiveReasonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonalStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonalStat(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      totalMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minutes'],
      )!,
      difficulty: $PersonalStatsTable.$converterdifficulty.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}difficulty'],
        )!,
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
      archiveReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archive_reason'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PersonalStatsTable createAlias(String alias) {
    return $PersonalStatsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<StatDifficulty, int, int> $converterdifficulty =
      const EnumIndexConverter<StatDifficulty>(StatDifficulty.values);
}

class PersonalStat extends DataClass implements Insertable<PersonalStat> {
  final int id;
  final String name;
  final int totalMinutes;
  final StatDifficulty difficulty;
  final bool isArchived;
  final DateTime? archivedAt;
  final String? archiveReason;
  final DateTime createdAt;
  const PersonalStat({
    required this.id,
    required this.name,
    required this.totalMinutes,
    required this.difficulty,
    required this.isArchived,
    this.archivedAt,
    this.archiveReason,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['total_minutes'] = Variable<int>(totalMinutes);
    {
      map['difficulty'] = Variable<int>(
        $PersonalStatsTable.$converterdifficulty.toSql(difficulty),
      );
    }
    map['is_archived'] = Variable<bool>(isArchived);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    if (!nullToAbsent || archiveReason != null) {
      map['archive_reason'] = Variable<String>(archiveReason);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PersonalStatsCompanion toCompanion(bool nullToAbsent) {
    return PersonalStatsCompanion(
      id: Value(id),
      name: Value(name),
      totalMinutes: Value(totalMinutes),
      difficulty: Value(difficulty),
      isArchived: Value(isArchived),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      archiveReason: archiveReason == null && nullToAbsent
          ? const Value.absent()
          : Value(archiveReason),
      createdAt: Value(createdAt),
    );
  }

  factory PersonalStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonalStat(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      totalMinutes: serializer.fromJson<int>(json['totalMinutes']),
      difficulty: $PersonalStatsTable.$converterdifficulty.fromJson(
        serializer.fromJson<int>(json['difficulty']),
      ),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
      archiveReason: serializer.fromJson<String?>(json['archiveReason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'totalMinutes': serializer.toJson<int>(totalMinutes),
      'difficulty': serializer.toJson<int>(
        $PersonalStatsTable.$converterdifficulty.toJson(difficulty),
      ),
      'isArchived': serializer.toJson<bool>(isArchived),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
      'archiveReason': serializer.toJson<String?>(archiveReason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PersonalStat copyWith({
    int? id,
    String? name,
    int? totalMinutes,
    StatDifficulty? difficulty,
    bool? isArchived,
    Value<DateTime?> archivedAt = const Value.absent(),
    Value<String?> archiveReason = const Value.absent(),
    DateTime? createdAt,
  }) => PersonalStat(
    id: id ?? this.id,
    name: name ?? this.name,
    totalMinutes: totalMinutes ?? this.totalMinutes,
    difficulty: difficulty ?? this.difficulty,
    isArchived: isArchived ?? this.isArchived,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    archiveReason: archiveReason.present
        ? archiveReason.value
        : this.archiveReason,
    createdAt: createdAt ?? this.createdAt,
  );
  PersonalStat copyWithCompanion(PersonalStatsCompanion data) {
    return PersonalStat(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      totalMinutes: data.totalMinutes.present
          ? data.totalMinutes.value
          : this.totalMinutes,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      archiveReason: data.archiveReason.present
          ? data.archiveReason.value
          : this.archiveReason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonalStat(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('difficulty: $difficulty, ')
          ..write('isArchived: $isArchived, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('archiveReason: $archiveReason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    totalMinutes,
    difficulty,
    isArchived,
    archivedAt,
    archiveReason,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonalStat &&
          other.id == this.id &&
          other.name == this.name &&
          other.totalMinutes == this.totalMinutes &&
          other.difficulty == this.difficulty &&
          other.isArchived == this.isArchived &&
          other.archivedAt == this.archivedAt &&
          other.archiveReason == this.archiveReason &&
          other.createdAt == this.createdAt);
}

class PersonalStatsCompanion extends UpdateCompanion<PersonalStat> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> totalMinutes;
  final Value<StatDifficulty> difficulty;
  final Value<bool> isArchived;
  final Value<DateTime?> archivedAt;
  final Value<String?> archiveReason;
  final Value<DateTime> createdAt;
  const PersonalStatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.totalMinutes = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.archiveReason = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PersonalStatsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.totalMinutes = const Value.absent(),
    required StatDifficulty difficulty,
    this.isArchived = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.archiveReason = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       difficulty = Value(difficulty);
  static Insertable<PersonalStat> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? totalMinutes,
    Expression<int>? difficulty,
    Expression<bool>? isArchived,
    Expression<DateTime>? archivedAt,
    Expression<String>? archiveReason,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (totalMinutes != null) 'total_minutes': totalMinutes,
      if (difficulty != null) 'difficulty': difficulty,
      if (isArchived != null) 'is_archived': isArchived,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (archiveReason != null) 'archive_reason': archiveReason,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PersonalStatsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? totalMinutes,
    Value<StatDifficulty>? difficulty,
    Value<bool>? isArchived,
    Value<DateTime?>? archivedAt,
    Value<String?>? archiveReason,
    Value<DateTime>? createdAt,
  }) {
    return PersonalStatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      totalMinutes: totalMinutes ?? this.totalMinutes,
      difficulty: difficulty ?? this.difficulty,
      isArchived: isArchived ?? this.isArchived,
      archivedAt: archivedAt ?? this.archivedAt,
      archiveReason: archiveReason ?? this.archiveReason,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (totalMinutes.present) {
      map['total_minutes'] = Variable<int>(totalMinutes.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(
        $PersonalStatsTable.$converterdifficulty.toSql(difficulty.value),
      );
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (archiveReason.present) {
      map['archive_reason'] = Variable<String>(archiveReason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalStatsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('difficulty: $difficulty, ')
          ..write('isArchived: $isArchived, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('archiveReason: $archiveReason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CallingCardsTable extends CallingCards
    with TableInfo<$CallingCardsTable, CallingCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CallingCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CallingCardStatus, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<CallingCardStatus>($CallingCardsTable.$converterstatus);
  static const VerificationMeta _totalMinutesInvestedMeta =
      const VerificationMeta('totalMinutesInvested');
  @override
  late final GeneratedColumn<int> totalMinutesInvested = GeneratedColumn<int>(
    'total_minutes_invested',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _reflectionNotesMeta = const VerificationMeta(
    'reflectionNotes',
  );
  @override
  late final GeneratedColumn<String> reflectionNotes = GeneratedColumn<String>(
    'reflection_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _abandonmentReasonMeta = const VerificationMeta(
    'abandonmentReason',
  );
  @override
  late final GeneratedColumn<String> abandonmentReason =
      GeneratedColumn<String>(
        'abandonment_reason',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _abandonedAtMeta = const VerificationMeta(
    'abandonedAt',
  );
  @override
  late final GeneratedColumn<DateTime> abandonedAt = GeneratedColumn<DateTime>(
    'abandoned_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    deadline,
    status,
    totalMinutesInvested,
    reflectionNotes,
    abandonmentReason,
    completedAt,
    abandonedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calling_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<CallingCard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('total_minutes_invested')) {
      context.handle(
        _totalMinutesInvestedMeta,
        totalMinutesInvested.isAcceptableOrUnknown(
          data['total_minutes_invested']!,
          _totalMinutesInvestedMeta,
        ),
      );
    }
    if (data.containsKey('reflection_notes')) {
      context.handle(
        _reflectionNotesMeta,
        reflectionNotes.isAcceptableOrUnknown(
          data['reflection_notes']!,
          _reflectionNotesMeta,
        ),
      );
    }
    if (data.containsKey('abandonment_reason')) {
      context.handle(
        _abandonmentReasonMeta,
        abandonmentReason.isAcceptableOrUnknown(
          data['abandonment_reason']!,
          _abandonmentReasonMeta,
        ),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('abandoned_at')) {
      context.handle(
        _abandonedAtMeta,
        abandonedAt.isAcceptableOrUnknown(
          data['abandoned_at']!,
          _abandonedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CallingCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CallingCard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      )!,
      status: $CallingCardsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
      totalMinutesInvested: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minutes_invested'],
      )!,
      reflectionNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reflection_notes'],
      ),
      abandonmentReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abandonment_reason'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      abandonedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}abandoned_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CallingCardsTable createAlias(String alias) {
    return $CallingCardsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CallingCardStatus, int, int> $converterstatus =
      const EnumIndexConverter<CallingCardStatus>(CallingCardStatus.values);
}

class CallingCard extends DataClass implements Insertable<CallingCard> {
  final int id;
  final String title;
  final String description;
  final DateTime deadline;
  final CallingCardStatus status;
  final int totalMinutesInvested;
  final String? reflectionNotes;
  final String? abandonmentReason;
  final DateTime? completedAt;
  final DateTime? abandonedAt;
  final DateTime createdAt;
  const CallingCard({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.status,
    required this.totalMinutesInvested,
    this.reflectionNotes,
    this.abandonmentReason,
    this.completedAt,
    this.abandonedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['deadline'] = Variable<DateTime>(deadline);
    {
      map['status'] = Variable<int>(
        $CallingCardsTable.$converterstatus.toSql(status),
      );
    }
    map['total_minutes_invested'] = Variable<int>(totalMinutesInvested);
    if (!nullToAbsent || reflectionNotes != null) {
      map['reflection_notes'] = Variable<String>(reflectionNotes);
    }
    if (!nullToAbsent || abandonmentReason != null) {
      map['abandonment_reason'] = Variable<String>(abandonmentReason);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || abandonedAt != null) {
      map['abandoned_at'] = Variable<DateTime>(abandonedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CallingCardsCompanion toCompanion(bool nullToAbsent) {
    return CallingCardsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      deadline: Value(deadline),
      status: Value(status),
      totalMinutesInvested: Value(totalMinutesInvested),
      reflectionNotes: reflectionNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(reflectionNotes),
      abandonmentReason: abandonmentReason == null && nullToAbsent
          ? const Value.absent()
          : Value(abandonmentReason),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      abandonedAt: abandonedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(abandonedAt),
      createdAt: Value(createdAt),
    );
  }

  factory CallingCard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CallingCard(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      status: $CallingCardsTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
      totalMinutesInvested: serializer.fromJson<int>(
        json['totalMinutesInvested'],
      ),
      reflectionNotes: serializer.fromJson<String?>(json['reflectionNotes']),
      abandonmentReason: serializer.fromJson<String?>(
        json['abandonmentReason'],
      ),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      abandonedAt: serializer.fromJson<DateTime?>(json['abandonedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'deadline': serializer.toJson<DateTime>(deadline),
      'status': serializer.toJson<int>(
        $CallingCardsTable.$converterstatus.toJson(status),
      ),
      'totalMinutesInvested': serializer.toJson<int>(totalMinutesInvested),
      'reflectionNotes': serializer.toJson<String?>(reflectionNotes),
      'abandonmentReason': serializer.toJson<String?>(abandonmentReason),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'abandonedAt': serializer.toJson<DateTime?>(abandonedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CallingCard copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? deadline,
    CallingCardStatus? status,
    int? totalMinutesInvested,
    Value<String?> reflectionNotes = const Value.absent(),
    Value<String?> abandonmentReason = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
    Value<DateTime?> abandonedAt = const Value.absent(),
    DateTime? createdAt,
  }) => CallingCard(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    deadline: deadline ?? this.deadline,
    status: status ?? this.status,
    totalMinutesInvested: totalMinutesInvested ?? this.totalMinutesInvested,
    reflectionNotes: reflectionNotes.present
        ? reflectionNotes.value
        : this.reflectionNotes,
    abandonmentReason: abandonmentReason.present
        ? abandonmentReason.value
        : this.abandonmentReason,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    abandonedAt: abandonedAt.present ? abandonedAt.value : this.abandonedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  CallingCard copyWithCompanion(CallingCardsCompanion data) {
    return CallingCard(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      status: data.status.present ? data.status.value : this.status,
      totalMinutesInvested: data.totalMinutesInvested.present
          ? data.totalMinutesInvested.value
          : this.totalMinutesInvested,
      reflectionNotes: data.reflectionNotes.present
          ? data.reflectionNotes.value
          : this.reflectionNotes,
      abandonmentReason: data.abandonmentReason.present
          ? data.abandonmentReason.value
          : this.abandonmentReason,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      abandonedAt: data.abandonedAt.present
          ? data.abandonedAt.value
          : this.abandonedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CallingCard(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('deadline: $deadline, ')
          ..write('status: $status, ')
          ..write('totalMinutesInvested: $totalMinutesInvested, ')
          ..write('reflectionNotes: $reflectionNotes, ')
          ..write('abandonmentReason: $abandonmentReason, ')
          ..write('completedAt: $completedAt, ')
          ..write('abandonedAt: $abandonedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    deadline,
    status,
    totalMinutesInvested,
    reflectionNotes,
    abandonmentReason,
    completedAt,
    abandonedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CallingCard &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.deadline == this.deadline &&
          other.status == this.status &&
          other.totalMinutesInvested == this.totalMinutesInvested &&
          other.reflectionNotes == this.reflectionNotes &&
          other.abandonmentReason == this.abandonmentReason &&
          other.completedAt == this.completedAt &&
          other.abandonedAt == this.abandonedAt &&
          other.createdAt == this.createdAt);
}

class CallingCardsCompanion extends UpdateCompanion<CallingCard> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> deadline;
  final Value<CallingCardStatus> status;
  final Value<int> totalMinutesInvested;
  final Value<String?> reflectionNotes;
  final Value<String?> abandonmentReason;
  final Value<DateTime?> completedAt;
  final Value<DateTime?> abandonedAt;
  final Value<DateTime> createdAt;
  const CallingCardsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.deadline = const Value.absent(),
    this.status = const Value.absent(),
    this.totalMinutesInvested = const Value.absent(),
    this.reflectionNotes = const Value.absent(),
    this.abandonmentReason = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.abandonedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CallingCardsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required DateTime deadline,
    required CallingCardStatus status,
    this.totalMinutesInvested = const Value.absent(),
    this.reflectionNotes = const Value.absent(),
    this.abandonmentReason = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.abandonedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       description = Value(description),
       deadline = Value(deadline),
       status = Value(status);
  static Insertable<CallingCard> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? deadline,
    Expression<int>? status,
    Expression<int>? totalMinutesInvested,
    Expression<String>? reflectionNotes,
    Expression<String>? abandonmentReason,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? abandonedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (deadline != null) 'deadline': deadline,
      if (status != null) 'status': status,
      if (totalMinutesInvested != null)
        'total_minutes_invested': totalMinutesInvested,
      if (reflectionNotes != null) 'reflection_notes': reflectionNotes,
      if (abandonmentReason != null) 'abandonment_reason': abandonmentReason,
      if (completedAt != null) 'completed_at': completedAt,
      if (abandonedAt != null) 'abandoned_at': abandonedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CallingCardsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime>? deadline,
    Value<CallingCardStatus>? status,
    Value<int>? totalMinutesInvested,
    Value<String?>? reflectionNotes,
    Value<String?>? abandonmentReason,
    Value<DateTime?>? completedAt,
    Value<DateTime?>? abandonedAt,
    Value<DateTime>? createdAt,
  }) {
    return CallingCardsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      status: status ?? this.status,
      totalMinutesInvested: totalMinutesInvested ?? this.totalMinutesInvested,
      reflectionNotes: reflectionNotes ?? this.reflectionNotes,
      abandonmentReason: abandonmentReason ?? this.abandonmentReason,
      completedAt: completedAt ?? this.completedAt,
      abandonedAt: abandonedAt ?? this.abandonedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $CallingCardsTable.$converterstatus.toSql(status.value),
      );
    }
    if (totalMinutesInvested.present) {
      map['total_minutes_invested'] = Variable<int>(totalMinutesInvested.value);
    }
    if (reflectionNotes.present) {
      map['reflection_notes'] = Variable<String>(reflectionNotes.value);
    }
    if (abandonmentReason.present) {
      map['abandonment_reason'] = Variable<String>(abandonmentReason.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (abandonedAt.present) {
      map['abandoned_at'] = Variable<DateTime>(abandonedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CallingCardsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('deadline: $deadline, ')
          ..write('status: $status, ')
          ..write('totalMinutesInvested: $totalMinutesInvested, ')
          ..write('reflectionNotes: $reflectionNotes, ')
          ..write('abandonmentReason: $abandonmentReason, ')
          ..write('completedAt: $completedAt, ')
          ..write('abandonedAt: $abandonedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TimeBlocksTable extends TimeBlocks
    with TableInfo<$TimeBlocksTable, TimeBlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeBlocksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DayState, int> blockType =
      GeneratedColumn<int>(
        'block_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DayState>($TimeBlocksTable.$converterblockType);
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityMeta = const VerificationMeta(
    'activity',
  );
  @override
  late final GeneratedColumn<String> activity = GeneratedColumn<String>(
    'activity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minimumCommitmentMinutesMeta =
      const VerificationMeta('minimumCommitmentMinutes');
  @override
  late final GeneratedColumn<int> minimumCommitmentMinutes =
      GeneratedColumn<int>(
        'minimum_commitment_minutes',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _statIdMeta = const VerificationMeta('statId');
  @override
  late final GeneratedColumn<int> statId = GeneratedColumn<int>(
    'stat_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES personal_stats (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _callingCardIdMeta = const VerificationMeta(
    'callingCardId',
  );
  @override
  late final GeneratedColumn<int> callingCardId = GeneratedColumn<int>(
    'calling_card_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES calling_cards (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    blockType,
    startTime,
    endTime,
    activity,
    minimumCommitmentMinutes,
    statId,
    callingCardId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'time_blocks';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimeBlock> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('activity')) {
      context.handle(
        _activityMeta,
        activity.isAcceptableOrUnknown(data['activity']!, _activityMeta),
      );
    }
    if (data.containsKey('minimum_commitment_minutes')) {
      context.handle(
        _minimumCommitmentMinutesMeta,
        minimumCommitmentMinutes.isAcceptableOrUnknown(
          data['minimum_commitment_minutes']!,
          _minimumCommitmentMinutesMeta,
        ),
      );
    }
    if (data.containsKey('stat_id')) {
      context.handle(
        _statIdMeta,
        statId.isAcceptableOrUnknown(data['stat_id']!, _statIdMeta),
      );
    }
    if (data.containsKey('calling_card_id')) {
      context.handle(
        _callingCardIdMeta,
        callingCardId.isAcceptableOrUnknown(
          data['calling_card_id']!,
          _callingCardIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimeBlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeBlock(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      blockType: $TimeBlocksTable.$converterblockType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}block_type'],
        )!,
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      activity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity'],
      ),
      minimumCommitmentMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minimum_commitment_minutes'],
      ),
      statId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stat_id'],
      ),
      callingCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calling_card_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TimeBlocksTable createAlias(String alias) {
    return $TimeBlocksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DayState, int, int> $converterblockType =
      const EnumIndexConverter<DayState>(DayState.values);
}

class TimeBlock extends DataClass implements Insertable<TimeBlock> {
  final int id;
  final DayState blockType;
  final DateTime startTime;
  final DateTime? endTime;
  final String? activity;
  final int? minimumCommitmentMinutes;
  final int? statId;
  final int? callingCardId;
  final DateTime createdAt;
  const TimeBlock({
    required this.id,
    required this.blockType,
    required this.startTime,
    this.endTime,
    this.activity,
    this.minimumCommitmentMinutes,
    this.statId,
    this.callingCardId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['block_type'] = Variable<int>(
        $TimeBlocksTable.$converterblockType.toSql(blockType),
      );
    }
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || activity != null) {
      map['activity'] = Variable<String>(activity);
    }
    if (!nullToAbsent || minimumCommitmentMinutes != null) {
      map['minimum_commitment_minutes'] = Variable<int>(
        minimumCommitmentMinutes,
      );
    }
    if (!nullToAbsent || statId != null) {
      map['stat_id'] = Variable<int>(statId);
    }
    if (!nullToAbsent || callingCardId != null) {
      map['calling_card_id'] = Variable<int>(callingCardId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TimeBlocksCompanion toCompanion(bool nullToAbsent) {
    return TimeBlocksCompanion(
      id: Value(id),
      blockType: Value(blockType),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      activity: activity == null && nullToAbsent
          ? const Value.absent()
          : Value(activity),
      minimumCommitmentMinutes: minimumCommitmentMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumCommitmentMinutes),
      statId: statId == null && nullToAbsent
          ? const Value.absent()
          : Value(statId),
      callingCardId: callingCardId == null && nullToAbsent
          ? const Value.absent()
          : Value(callingCardId),
      createdAt: Value(createdAt),
    );
  }

  factory TimeBlock.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeBlock(
      id: serializer.fromJson<int>(json['id']),
      blockType: $TimeBlocksTable.$converterblockType.fromJson(
        serializer.fromJson<int>(json['blockType']),
      ),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      activity: serializer.fromJson<String?>(json['activity']),
      minimumCommitmentMinutes: serializer.fromJson<int?>(
        json['minimumCommitmentMinutes'],
      ),
      statId: serializer.fromJson<int?>(json['statId']),
      callingCardId: serializer.fromJson<int?>(json['callingCardId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'blockType': serializer.toJson<int>(
        $TimeBlocksTable.$converterblockType.toJson(blockType),
      ),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'activity': serializer.toJson<String?>(activity),
      'minimumCommitmentMinutes': serializer.toJson<int?>(
        minimumCommitmentMinutes,
      ),
      'statId': serializer.toJson<int?>(statId),
      'callingCardId': serializer.toJson<int?>(callingCardId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TimeBlock copyWith({
    int? id,
    DayState? blockType,
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    Value<String?> activity = const Value.absent(),
    Value<int?> minimumCommitmentMinutes = const Value.absent(),
    Value<int?> statId = const Value.absent(),
    Value<int?> callingCardId = const Value.absent(),
    DateTime? createdAt,
  }) => TimeBlock(
    id: id ?? this.id,
    blockType: blockType ?? this.blockType,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    activity: activity.present ? activity.value : this.activity,
    minimumCommitmentMinutes: minimumCommitmentMinutes.present
        ? minimumCommitmentMinutes.value
        : this.minimumCommitmentMinutes,
    statId: statId.present ? statId.value : this.statId,
    callingCardId: callingCardId.present
        ? callingCardId.value
        : this.callingCardId,
    createdAt: createdAt ?? this.createdAt,
  );
  TimeBlock copyWithCompanion(TimeBlocksCompanion data) {
    return TimeBlock(
      id: data.id.present ? data.id.value : this.id,
      blockType: data.blockType.present ? data.blockType.value : this.blockType,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      activity: data.activity.present ? data.activity.value : this.activity,
      minimumCommitmentMinutes: data.minimumCommitmentMinutes.present
          ? data.minimumCommitmentMinutes.value
          : this.minimumCommitmentMinutes,
      statId: data.statId.present ? data.statId.value : this.statId,
      callingCardId: data.callingCardId.present
          ? data.callingCardId.value
          : this.callingCardId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimeBlock(')
          ..write('id: $id, ')
          ..write('blockType: $blockType, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('activity: $activity, ')
          ..write('minimumCommitmentMinutes: $minimumCommitmentMinutes, ')
          ..write('statId: $statId, ')
          ..write('callingCardId: $callingCardId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    blockType,
    startTime,
    endTime,
    activity,
    minimumCommitmentMinutes,
    statId,
    callingCardId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeBlock &&
          other.id == this.id &&
          other.blockType == this.blockType &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.activity == this.activity &&
          other.minimumCommitmentMinutes == this.minimumCommitmentMinutes &&
          other.statId == this.statId &&
          other.callingCardId == this.callingCardId &&
          other.createdAt == this.createdAt);
}

class TimeBlocksCompanion extends UpdateCompanion<TimeBlock> {
  final Value<int> id;
  final Value<DayState> blockType;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<String?> activity;
  final Value<int?> minimumCommitmentMinutes;
  final Value<int?> statId;
  final Value<int?> callingCardId;
  final Value<DateTime> createdAt;
  const TimeBlocksCompanion({
    this.id = const Value.absent(),
    this.blockType = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.activity = const Value.absent(),
    this.minimumCommitmentMinutes = const Value.absent(),
    this.statId = const Value.absent(),
    this.callingCardId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TimeBlocksCompanion.insert({
    this.id = const Value.absent(),
    required DayState blockType,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.activity = const Value.absent(),
    this.minimumCommitmentMinutes = const Value.absent(),
    this.statId = const Value.absent(),
    this.callingCardId = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : blockType = Value(blockType),
       startTime = Value(startTime);
  static Insertable<TimeBlock> custom({
    Expression<int>? id,
    Expression<int>? blockType,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? activity,
    Expression<int>? minimumCommitmentMinutes,
    Expression<int>? statId,
    Expression<int>? callingCardId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (blockType != null) 'block_type': blockType,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (activity != null) 'activity': activity,
      if (minimumCommitmentMinutes != null)
        'minimum_commitment_minutes': minimumCommitmentMinutes,
      if (statId != null) 'stat_id': statId,
      if (callingCardId != null) 'calling_card_id': callingCardId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TimeBlocksCompanion copyWith({
    Value<int>? id,
    Value<DayState>? blockType,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<String?>? activity,
    Value<int?>? minimumCommitmentMinutes,
    Value<int?>? statId,
    Value<int?>? callingCardId,
    Value<DateTime>? createdAt,
  }) {
    return TimeBlocksCompanion(
      id: id ?? this.id,
      blockType: blockType ?? this.blockType,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      activity: activity ?? this.activity,
      minimumCommitmentMinutes:
          minimumCommitmentMinutes ?? this.minimumCommitmentMinutes,
      statId: statId ?? this.statId,
      callingCardId: callingCardId ?? this.callingCardId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (blockType.present) {
      map['block_type'] = Variable<int>(
        $TimeBlocksTable.$converterblockType.toSql(blockType.value),
      );
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (activity.present) {
      map['activity'] = Variable<String>(activity.value);
    }
    if (minimumCommitmentMinutes.present) {
      map['minimum_commitment_minutes'] = Variable<int>(
        minimumCommitmentMinutes.value,
      );
    }
    if (statId.present) {
      map['stat_id'] = Variable<int>(statId.value);
    }
    if (callingCardId.present) {
      map['calling_card_id'] = Variable<int>(callingCardId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeBlocksCompanion(')
          ..write('id: $id, ')
          ..write('blockType: $blockType, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('activity: $activity, ')
          ..write('minimumCommitmentMinutes: $minimumCommitmentMinutes, ')
          ..write('statId: $statId, ')
          ..write('callingCardId: $callingCardId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StatRankNamesTable extends StatRankNames
    with TableInfo<$StatRankNamesTable, StatRankName> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatRankNamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _statIdMeta = const VerificationMeta('statId');
  @override
  late final GeneratedColumn<int> statId = GeneratedColumn<int>(
    'stat_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES personal_stats (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _rankNumberMeta = const VerificationMeta(
    'rankNumber',
  );
  @override
  late final GeneratedColumn<int> rankNumber = GeneratedColumn<int>(
    'rank_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rankNameMeta = const VerificationMeta(
    'rankName',
  );
  @override
  late final GeneratedColumn<String> rankName = GeneratedColumn<String>(
    'rank_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, statId, rankNumber, rankName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stat_rank_names';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatRankName> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stat_id')) {
      context.handle(
        _statIdMeta,
        statId.isAcceptableOrUnknown(data['stat_id']!, _statIdMeta),
      );
    } else if (isInserting) {
      context.missing(_statIdMeta);
    }
    if (data.containsKey('rank_number')) {
      context.handle(
        _rankNumberMeta,
        rankNumber.isAcceptableOrUnknown(data['rank_number']!, _rankNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_rankNumberMeta);
    }
    if (data.containsKey('rank_name')) {
      context.handle(
        _rankNameMeta,
        rankName.isAcceptableOrUnknown(data['rank_name']!, _rankNameMeta),
      );
    } else if (isInserting) {
      context.missing(_rankNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {statId, rankNumber},
  ];
  @override
  StatRankName map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatRankName(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      statId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stat_id'],
      )!,
      rankNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rank_number'],
      )!,
      rankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rank_name'],
      )!,
    );
  }

  @override
  $StatRankNamesTable createAlias(String alias) {
    return $StatRankNamesTable(attachedDatabase, alias);
  }
}

class StatRankName extends DataClass implements Insertable<StatRankName> {
  final int id;
  final int statId;
  final int rankNumber;
  final String rankName;
  const StatRankName({
    required this.id,
    required this.statId,
    required this.rankNumber,
    required this.rankName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stat_id'] = Variable<int>(statId);
    map['rank_number'] = Variable<int>(rankNumber);
    map['rank_name'] = Variable<String>(rankName);
    return map;
  }

  StatRankNamesCompanion toCompanion(bool nullToAbsent) {
    return StatRankNamesCompanion(
      id: Value(id),
      statId: Value(statId),
      rankNumber: Value(rankNumber),
      rankName: Value(rankName),
    );
  }

  factory StatRankName.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatRankName(
      id: serializer.fromJson<int>(json['id']),
      statId: serializer.fromJson<int>(json['statId']),
      rankNumber: serializer.fromJson<int>(json['rankNumber']),
      rankName: serializer.fromJson<String>(json['rankName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statId': serializer.toJson<int>(statId),
      'rankNumber': serializer.toJson<int>(rankNumber),
      'rankName': serializer.toJson<String>(rankName),
    };
  }

  StatRankName copyWith({
    int? id,
    int? statId,
    int? rankNumber,
    String? rankName,
  }) => StatRankName(
    id: id ?? this.id,
    statId: statId ?? this.statId,
    rankNumber: rankNumber ?? this.rankNumber,
    rankName: rankName ?? this.rankName,
  );
  StatRankName copyWithCompanion(StatRankNamesCompanion data) {
    return StatRankName(
      id: data.id.present ? data.id.value : this.id,
      statId: data.statId.present ? data.statId.value : this.statId,
      rankNumber: data.rankNumber.present
          ? data.rankNumber.value
          : this.rankNumber,
      rankName: data.rankName.present ? data.rankName.value : this.rankName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatRankName(')
          ..write('id: $id, ')
          ..write('statId: $statId, ')
          ..write('rankNumber: $rankNumber, ')
          ..write('rankName: $rankName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, statId, rankNumber, rankName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatRankName &&
          other.id == this.id &&
          other.statId == this.statId &&
          other.rankNumber == this.rankNumber &&
          other.rankName == this.rankName);
}

class StatRankNamesCompanion extends UpdateCompanion<StatRankName> {
  final Value<int> id;
  final Value<int> statId;
  final Value<int> rankNumber;
  final Value<String> rankName;
  const StatRankNamesCompanion({
    this.id = const Value.absent(),
    this.statId = const Value.absent(),
    this.rankNumber = const Value.absent(),
    this.rankName = const Value.absent(),
  });
  StatRankNamesCompanion.insert({
    this.id = const Value.absent(),
    required int statId,
    required int rankNumber,
    required String rankName,
  }) : statId = Value(statId),
       rankNumber = Value(rankNumber),
       rankName = Value(rankName);
  static Insertable<StatRankName> custom({
    Expression<int>? id,
    Expression<int>? statId,
    Expression<int>? rankNumber,
    Expression<String>? rankName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statId != null) 'stat_id': statId,
      if (rankNumber != null) 'rank_number': rankNumber,
      if (rankName != null) 'rank_name': rankName,
    });
  }

  StatRankNamesCompanion copyWith({
    Value<int>? id,
    Value<int>? statId,
    Value<int>? rankNumber,
    Value<String>? rankName,
  }) {
    return StatRankNamesCompanion(
      id: id ?? this.id,
      statId: statId ?? this.statId,
      rankNumber: rankNumber ?? this.rankNumber,
      rankName: rankName ?? this.rankName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (statId.present) {
      map['stat_id'] = Variable<int>(statId.value);
    }
    if (rankNumber.present) {
      map['rank_number'] = Variable<int>(rankNumber.value);
    }
    if (rankName.present) {
      map['rank_name'] = Variable<String>(rankName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatRankNamesCompanion(')
          ..write('id: $id, ')
          ..write('statId: $statId, ')
          ..write('rankNumber: $rankNumber, ')
          ..write('rankName: $rankName')
          ..write(')'))
        .toString();
  }
}

class $CallingCardObjectivesTable extends CallingCardObjectives
    with TableInfo<$CallingCardObjectivesTable, CallingCardObjective> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CallingCardObjectivesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _callingCardIdMeta = const VerificationMeta(
    'callingCardId',
  );
  @override
  late final GeneratedColumn<int> callingCardId = GeneratedColumn<int>(
    'calling_card_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES calling_cards (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    callingCardId,
    description,
    isCompleted,
    sortOrder,
    completedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calling_card_objectives';
  @override
  VerificationContext validateIntegrity(
    Insertable<CallingCardObjective> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('calling_card_id')) {
      context.handle(
        _callingCardIdMeta,
        callingCardId.isAcceptableOrUnknown(
          data['calling_card_id']!,
          _callingCardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_callingCardIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CallingCardObjective map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CallingCardObjective(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      callingCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calling_card_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CallingCardObjectivesTable createAlias(String alias) {
    return $CallingCardObjectivesTable(attachedDatabase, alias);
  }
}

class CallingCardObjective extends DataClass
    implements Insertable<CallingCardObjective> {
  final int id;
  final int callingCardId;
  final String description;
  final bool isCompleted;
  final int sortOrder;
  final DateTime? completedAt;
  final DateTime createdAt;
  const CallingCardObjective({
    required this.id,
    required this.callingCardId,
    required this.description,
    required this.isCompleted,
    required this.sortOrder,
    this.completedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['calling_card_id'] = Variable<int>(callingCardId);
    map['description'] = Variable<String>(description);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CallingCardObjectivesCompanion toCompanion(bool nullToAbsent) {
    return CallingCardObjectivesCompanion(
      id: Value(id),
      callingCardId: Value(callingCardId),
      description: Value(description),
      isCompleted: Value(isCompleted),
      sortOrder: Value(sortOrder),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      createdAt: Value(createdAt),
    );
  }

  factory CallingCardObjective.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CallingCardObjective(
      id: serializer.fromJson<int>(json['id']),
      callingCardId: serializer.fromJson<int>(json['callingCardId']),
      description: serializer.fromJson<String>(json['description']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'callingCardId': serializer.toJson<int>(callingCardId),
      'description': serializer.toJson<String>(description),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CallingCardObjective copyWith({
    int? id,
    int? callingCardId,
    String? description,
    bool? isCompleted,
    int? sortOrder,
    Value<DateTime?> completedAt = const Value.absent(),
    DateTime? createdAt,
  }) => CallingCardObjective(
    id: id ?? this.id,
    callingCardId: callingCardId ?? this.callingCardId,
    description: description ?? this.description,
    isCompleted: isCompleted ?? this.isCompleted,
    sortOrder: sortOrder ?? this.sortOrder,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  CallingCardObjective copyWithCompanion(CallingCardObjectivesCompanion data) {
    return CallingCardObjective(
      id: data.id.present ? data.id.value : this.id,
      callingCardId: data.callingCardId.present
          ? data.callingCardId.value
          : this.callingCardId,
      description: data.description.present
          ? data.description.value
          : this.description,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CallingCardObjective(')
          ..write('id: $id, ')
          ..write('callingCardId: $callingCardId, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    callingCardId,
    description,
    isCompleted,
    sortOrder,
    completedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CallingCardObjective &&
          other.id == this.id &&
          other.callingCardId == this.callingCardId &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.sortOrder == this.sortOrder &&
          other.completedAt == this.completedAt &&
          other.createdAt == this.createdAt);
}

class CallingCardObjectivesCompanion
    extends UpdateCompanion<CallingCardObjective> {
  final Value<int> id;
  final Value<int> callingCardId;
  final Value<String> description;
  final Value<bool> isCompleted;
  final Value<int> sortOrder;
  final Value<DateTime?> completedAt;
  final Value<DateTime> createdAt;
  const CallingCardObjectivesCompanion({
    this.id = const Value.absent(),
    this.callingCardId = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CallingCardObjectivesCompanion.insert({
    this.id = const Value.absent(),
    required int callingCardId,
    required String description,
    this.isCompleted = const Value.absent(),
    required int sortOrder,
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : callingCardId = Value(callingCardId),
       description = Value(description),
       sortOrder = Value(sortOrder);
  static Insertable<CallingCardObjective> custom({
    Expression<int>? id,
    Expression<int>? callingCardId,
    Expression<String>? description,
    Expression<bool>? isCompleted,
    Expression<int>? sortOrder,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (callingCardId != null) 'calling_card_id': callingCardId,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (completedAt != null) 'completed_at': completedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CallingCardObjectivesCompanion copyWith({
    Value<int>? id,
    Value<int>? callingCardId,
    Value<String>? description,
    Value<bool>? isCompleted,
    Value<int>? sortOrder,
    Value<DateTime?>? completedAt,
    Value<DateTime>? createdAt,
  }) {
    return CallingCardObjectivesCompanion(
      id: id ?? this.id,
      callingCardId: callingCardId ?? this.callingCardId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      sortOrder: sortOrder ?? this.sortOrder,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (callingCardId.present) {
      map['calling_card_id'] = Variable<int>(callingCardId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CallingCardObjectivesCompanion(')
          ..write('id: $id, ')
          ..write('callingCardId: $callingCardId, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PersonalStatsTable personalStats = $PersonalStatsTable(this);
  late final $CallingCardsTable callingCards = $CallingCardsTable(this);
  late final $TimeBlocksTable timeBlocks = $TimeBlocksTable(this);
  late final $StatRankNamesTable statRankNames = $StatRankNamesTable(this);
  late final $CallingCardObjectivesTable callingCardObjectives =
      $CallingCardObjectivesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    personalStats,
    callingCards,
    timeBlocks,
    statRankNames,
    callingCardObjectives,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'personal_stats',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('time_blocks', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'calling_cards',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('time_blocks', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'personal_stats',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('stat_rank_names', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'calling_cards',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('calling_card_objectives', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PersonalStatsTableCreateCompanionBuilder =
    PersonalStatsCompanion Function({
      Value<int> id,
      required String name,
      Value<int> totalMinutes,
      required StatDifficulty difficulty,
      Value<bool> isArchived,
      Value<DateTime?> archivedAt,
      Value<String?> archiveReason,
      Value<DateTime> createdAt,
    });
typedef $$PersonalStatsTableUpdateCompanionBuilder =
    PersonalStatsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> totalMinutes,
      Value<StatDifficulty> difficulty,
      Value<bool> isArchived,
      Value<DateTime?> archivedAt,
      Value<String?> archiveReason,
      Value<DateTime> createdAt,
    });

final class $$PersonalStatsTableReferences
    extends BaseReferences<_$AppDatabase, $PersonalStatsTable, PersonalStat> {
  $$PersonalStatsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TimeBlocksTable, List<TimeBlock>>
  _timeBlocksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timeBlocks,
    aliasName: $_aliasNameGenerator(db.personalStats.id, db.timeBlocks.statId),
  );

  $$TimeBlocksTableProcessedTableManager get timeBlocksRefs {
    final manager = $$TimeBlocksTableTableManager(
      $_db,
      $_db.timeBlocks,
    ).filter((f) => f.statId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_timeBlocksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StatRankNamesTable, List<StatRankName>>
  _statRankNamesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.statRankNames,
    aliasName: $_aliasNameGenerator(
      db.personalStats.id,
      db.statRankNames.statId,
    ),
  );

  $$StatRankNamesTableProcessedTableManager get statRankNamesRefs {
    final manager = $$StatRankNamesTableTableManager(
      $_db,
      $_db.statRankNames,
    ).filter((f) => f.statId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_statRankNamesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PersonalStatsTableFilterComposer
    extends Composer<_$AppDatabase, $PersonalStatsTable> {
  $$PersonalStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMinutes => $composableBuilder(
    column: $table.totalMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StatDifficulty, StatDifficulty, int>
  get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archiveReason => $composableBuilder(
    column: $table.archiveReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> timeBlocksRefs(
    Expression<bool> Function($$TimeBlocksTableFilterComposer f) f,
  ) {
    final $$TimeBlocksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeBlocks,
      getReferencedColumn: (t) => t.statId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeBlocksTableFilterComposer(
            $db: $db,
            $table: $db.timeBlocks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> statRankNamesRefs(
    Expression<bool> Function($$StatRankNamesTableFilterComposer f) f,
  ) {
    final $$StatRankNamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statRankNames,
      getReferencedColumn: (t) => t.statId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatRankNamesTableFilterComposer(
            $db: $db,
            $table: $db.statRankNames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PersonalStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonalStatsTable> {
  $$PersonalStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinutes => $composableBuilder(
    column: $table.totalMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archiveReason => $composableBuilder(
    column: $table.archiveReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonalStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonalStatsTable> {
  $$PersonalStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get totalMinutes => $composableBuilder(
    column: $table.totalMinutes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<StatDifficulty, int> get difficulty =>
      $composableBuilder(
        column: $table.difficulty,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archiveReason => $composableBuilder(
    column: $table.archiveReason,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> timeBlocksRefs<T extends Object>(
    Expression<T> Function($$TimeBlocksTableAnnotationComposer a) f,
  ) {
    final $$TimeBlocksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeBlocks,
      getReferencedColumn: (t) => t.statId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeBlocksTableAnnotationComposer(
            $db: $db,
            $table: $db.timeBlocks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> statRankNamesRefs<T extends Object>(
    Expression<T> Function($$StatRankNamesTableAnnotationComposer a) f,
  ) {
    final $$StatRankNamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statRankNames,
      getReferencedColumn: (t) => t.statId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatRankNamesTableAnnotationComposer(
            $db: $db,
            $table: $db.statRankNames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PersonalStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonalStatsTable,
          PersonalStat,
          $$PersonalStatsTableFilterComposer,
          $$PersonalStatsTableOrderingComposer,
          $$PersonalStatsTableAnnotationComposer,
          $$PersonalStatsTableCreateCompanionBuilder,
          $$PersonalStatsTableUpdateCompanionBuilder,
          (PersonalStat, $$PersonalStatsTableReferences),
          PersonalStat,
          PrefetchHooks Function({bool timeBlocksRefs, bool statRankNamesRefs})
        > {
  $$PersonalStatsTableTableManager(_$AppDatabase db, $PersonalStatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonalStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonalStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonalStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> totalMinutes = const Value.absent(),
                Value<StatDifficulty> difficulty = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<String?> archiveReason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PersonalStatsCompanion(
                id: id,
                name: name,
                totalMinutes: totalMinutes,
                difficulty: difficulty,
                isArchived: isArchived,
                archivedAt: archivedAt,
                archiveReason: archiveReason,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int> totalMinutes = const Value.absent(),
                required StatDifficulty difficulty,
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<String?> archiveReason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PersonalStatsCompanion.insert(
                id: id,
                name: name,
                totalMinutes: totalMinutes,
                difficulty: difficulty,
                isArchived: isArchived,
                archivedAt: archivedAt,
                archiveReason: archiveReason,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PersonalStatsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({timeBlocksRefs = false, statRankNamesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timeBlocksRefs) db.timeBlocks,
                    if (statRankNamesRefs) db.statRankNames,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timeBlocksRefs)
                        await $_getPrefetchedData<
                          PersonalStat,
                          $PersonalStatsTable,
                          TimeBlock
                        >(
                          currentTable: table,
                          referencedTable: $$PersonalStatsTableReferences
                              ._timeBlocksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PersonalStatsTableReferences(
                                db,
                                table,
                                p0,
                              ).timeBlocksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.statId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (statRankNamesRefs)
                        await $_getPrefetchedData<
                          PersonalStat,
                          $PersonalStatsTable,
                          StatRankName
                        >(
                          currentTable: table,
                          referencedTable: $$PersonalStatsTableReferences
                              ._statRankNamesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PersonalStatsTableReferences(
                                db,
                                table,
                                p0,
                              ).statRankNamesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.statId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PersonalStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonalStatsTable,
      PersonalStat,
      $$PersonalStatsTableFilterComposer,
      $$PersonalStatsTableOrderingComposer,
      $$PersonalStatsTableAnnotationComposer,
      $$PersonalStatsTableCreateCompanionBuilder,
      $$PersonalStatsTableUpdateCompanionBuilder,
      (PersonalStat, $$PersonalStatsTableReferences),
      PersonalStat,
      PrefetchHooks Function({bool timeBlocksRefs, bool statRankNamesRefs})
    >;
typedef $$CallingCardsTableCreateCompanionBuilder =
    CallingCardsCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required DateTime deadline,
      required CallingCardStatus status,
      Value<int> totalMinutesInvested,
      Value<String?> reflectionNotes,
      Value<String?> abandonmentReason,
      Value<DateTime?> completedAt,
      Value<DateTime?> abandonedAt,
      Value<DateTime> createdAt,
    });
typedef $$CallingCardsTableUpdateCompanionBuilder =
    CallingCardsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<DateTime> deadline,
      Value<CallingCardStatus> status,
      Value<int> totalMinutesInvested,
      Value<String?> reflectionNotes,
      Value<String?> abandonmentReason,
      Value<DateTime?> completedAt,
      Value<DateTime?> abandonedAt,
      Value<DateTime> createdAt,
    });

final class $$CallingCardsTableReferences
    extends BaseReferences<_$AppDatabase, $CallingCardsTable, CallingCard> {
  $$CallingCardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TimeBlocksTable, List<TimeBlock>>
  _timeBlocksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timeBlocks,
    aliasName: $_aliasNameGenerator(
      db.callingCards.id,
      db.timeBlocks.callingCardId,
    ),
  );

  $$TimeBlocksTableProcessedTableManager get timeBlocksRefs {
    final manager = $$TimeBlocksTableTableManager(
      $_db,
      $_db.timeBlocks,
    ).filter((f) => f.callingCardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_timeBlocksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CallingCardObjectivesTable,
    List<CallingCardObjective>
  >
  _callingCardObjectivesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.callingCardObjectives,
        aliasName: $_aliasNameGenerator(
          db.callingCards.id,
          db.callingCardObjectives.callingCardId,
        ),
      );

  $$CallingCardObjectivesTableProcessedTableManager
  get callingCardObjectivesRefs {
    final manager = $$CallingCardObjectivesTableTableManager(
      $_db,
      $_db.callingCardObjectives,
    ).filter((f) => f.callingCardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _callingCardObjectivesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CallingCardsTableFilterComposer
    extends Composer<_$AppDatabase, $CallingCardsTable> {
  $$CallingCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CallingCardStatus, CallingCardStatus, int>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get totalMinutesInvested => $composableBuilder(
    column: $table.totalMinutesInvested,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reflectionNotes => $composableBuilder(
    column: $table.reflectionNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abandonmentReason => $composableBuilder(
    column: $table.abandonmentReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get abandonedAt => $composableBuilder(
    column: $table.abandonedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> timeBlocksRefs(
    Expression<bool> Function($$TimeBlocksTableFilterComposer f) f,
  ) {
    final $$TimeBlocksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeBlocks,
      getReferencedColumn: (t) => t.callingCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeBlocksTableFilterComposer(
            $db: $db,
            $table: $db.timeBlocks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> callingCardObjectivesRefs(
    Expression<bool> Function($$CallingCardObjectivesTableFilterComposer f) f,
  ) {
    final $$CallingCardObjectivesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.callingCardObjectives,
          getReferencedColumn: (t) => t.callingCardId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CallingCardObjectivesTableFilterComposer(
                $db: $db,
                $table: $db.callingCardObjectives,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CallingCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CallingCardsTable> {
  $$CallingCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinutesInvested => $composableBuilder(
    column: $table.totalMinutesInvested,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reflectionNotes => $composableBuilder(
    column: $table.reflectionNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abandonmentReason => $composableBuilder(
    column: $table.abandonmentReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get abandonedAt => $composableBuilder(
    column: $table.abandonedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CallingCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CallingCardsTable> {
  $$CallingCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CallingCardStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get totalMinutesInvested => $composableBuilder(
    column: $table.totalMinutesInvested,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reflectionNotes => $composableBuilder(
    column: $table.reflectionNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get abandonmentReason => $composableBuilder(
    column: $table.abandonmentReason,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get abandonedAt => $composableBuilder(
    column: $table.abandonedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> timeBlocksRefs<T extends Object>(
    Expression<T> Function($$TimeBlocksTableAnnotationComposer a) f,
  ) {
    final $$TimeBlocksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeBlocks,
      getReferencedColumn: (t) => t.callingCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeBlocksTableAnnotationComposer(
            $db: $db,
            $table: $db.timeBlocks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> callingCardObjectivesRefs<T extends Object>(
    Expression<T> Function($$CallingCardObjectivesTableAnnotationComposer a) f,
  ) {
    final $$CallingCardObjectivesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.callingCardObjectives,
          getReferencedColumn: (t) => t.callingCardId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CallingCardObjectivesTableAnnotationComposer(
                $db: $db,
                $table: $db.callingCardObjectives,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CallingCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CallingCardsTable,
          CallingCard,
          $$CallingCardsTableFilterComposer,
          $$CallingCardsTableOrderingComposer,
          $$CallingCardsTableAnnotationComposer,
          $$CallingCardsTableCreateCompanionBuilder,
          $$CallingCardsTableUpdateCompanionBuilder,
          (CallingCard, $$CallingCardsTableReferences),
          CallingCard,
          PrefetchHooks Function({
            bool timeBlocksRefs,
            bool callingCardObjectivesRefs,
          })
        > {
  $$CallingCardsTableTableManager(_$AppDatabase db, $CallingCardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CallingCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CallingCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CallingCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> deadline = const Value.absent(),
                Value<CallingCardStatus> status = const Value.absent(),
                Value<int> totalMinutesInvested = const Value.absent(),
                Value<String?> reflectionNotes = const Value.absent(),
                Value<String?> abandonmentReason = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime?> abandonedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CallingCardsCompanion(
                id: id,
                title: title,
                description: description,
                deadline: deadline,
                status: status,
                totalMinutesInvested: totalMinutesInvested,
                reflectionNotes: reflectionNotes,
                abandonmentReason: abandonmentReason,
                completedAt: completedAt,
                abandonedAt: abandonedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required DateTime deadline,
                required CallingCardStatus status,
                Value<int> totalMinutesInvested = const Value.absent(),
                Value<String?> reflectionNotes = const Value.absent(),
                Value<String?> abandonmentReason = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime?> abandonedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CallingCardsCompanion.insert(
                id: id,
                title: title,
                description: description,
                deadline: deadline,
                status: status,
                totalMinutesInvested: totalMinutesInvested,
                reflectionNotes: reflectionNotes,
                abandonmentReason: abandonmentReason,
                completedAt: completedAt,
                abandonedAt: abandonedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CallingCardsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({timeBlocksRefs = false, callingCardObjectivesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timeBlocksRefs) db.timeBlocks,
                    if (callingCardObjectivesRefs) db.callingCardObjectives,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timeBlocksRefs)
                        await $_getPrefetchedData<
                          CallingCard,
                          $CallingCardsTable,
                          TimeBlock
                        >(
                          currentTable: table,
                          referencedTable: $$CallingCardsTableReferences
                              ._timeBlocksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CallingCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).timeBlocksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.callingCardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (callingCardObjectivesRefs)
                        await $_getPrefetchedData<
                          CallingCard,
                          $CallingCardsTable,
                          CallingCardObjective
                        >(
                          currentTable: table,
                          referencedTable: $$CallingCardsTableReferences
                              ._callingCardObjectivesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CallingCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).callingCardObjectivesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.callingCardId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CallingCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CallingCardsTable,
      CallingCard,
      $$CallingCardsTableFilterComposer,
      $$CallingCardsTableOrderingComposer,
      $$CallingCardsTableAnnotationComposer,
      $$CallingCardsTableCreateCompanionBuilder,
      $$CallingCardsTableUpdateCompanionBuilder,
      (CallingCard, $$CallingCardsTableReferences),
      CallingCard,
      PrefetchHooks Function({
        bool timeBlocksRefs,
        bool callingCardObjectivesRefs,
      })
    >;
typedef $$TimeBlocksTableCreateCompanionBuilder =
    TimeBlocksCompanion Function({
      Value<int> id,
      required DayState blockType,
      required DateTime startTime,
      Value<DateTime?> endTime,
      Value<String?> activity,
      Value<int?> minimumCommitmentMinutes,
      Value<int?> statId,
      Value<int?> callingCardId,
      Value<DateTime> createdAt,
    });
typedef $$TimeBlocksTableUpdateCompanionBuilder =
    TimeBlocksCompanion Function({
      Value<int> id,
      Value<DayState> blockType,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<String?> activity,
      Value<int?> minimumCommitmentMinutes,
      Value<int?> statId,
      Value<int?> callingCardId,
      Value<DateTime> createdAt,
    });

final class $$TimeBlocksTableReferences
    extends BaseReferences<_$AppDatabase, $TimeBlocksTable, TimeBlock> {
  $$TimeBlocksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PersonalStatsTable _statIdTable(_$AppDatabase db) =>
      db.personalStats.createAlias(
        $_aliasNameGenerator(db.timeBlocks.statId, db.personalStats.id),
      );

  $$PersonalStatsTableProcessedTableManager? get statId {
    final $_column = $_itemColumn<int>('stat_id');
    if ($_column == null) return null;
    final manager = $$PersonalStatsTableTableManager(
      $_db,
      $_db.personalStats,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_statIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CallingCardsTable _callingCardIdTable(_$AppDatabase db) =>
      db.callingCards.createAlias(
        $_aliasNameGenerator(db.timeBlocks.callingCardId, db.callingCards.id),
      );

  $$CallingCardsTableProcessedTableManager? get callingCardId {
    final $_column = $_itemColumn<int>('calling_card_id');
    if ($_column == null) return null;
    final manager = $$CallingCardsTableTableManager(
      $_db,
      $_db.callingCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_callingCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TimeBlocksTableFilterComposer
    extends Composer<_$AppDatabase, $TimeBlocksTable> {
  $$TimeBlocksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DayState, DayState, int> get blockType =>
      $composableBuilder(
        column: $table.blockType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activity => $composableBuilder(
    column: $table.activity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minimumCommitmentMinutes => $composableBuilder(
    column: $table.minimumCommitmentMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PersonalStatsTableFilterComposer get statId {
    final $$PersonalStatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statId,
      referencedTable: $db.personalStats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonalStatsTableFilterComposer(
            $db: $db,
            $table: $db.personalStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CallingCardsTableFilterComposer get callingCardId {
    final $$CallingCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.callingCardId,
      referencedTable: $db.callingCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CallingCardsTableFilterComposer(
            $db: $db,
            $table: $db.callingCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeBlocksTableOrderingComposer
    extends Composer<_$AppDatabase, $TimeBlocksTable> {
  $$TimeBlocksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get blockType => $composableBuilder(
    column: $table.blockType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activity => $composableBuilder(
    column: $table.activity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minimumCommitmentMinutes => $composableBuilder(
    column: $table.minimumCommitmentMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PersonalStatsTableOrderingComposer get statId {
    final $$PersonalStatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statId,
      referencedTable: $db.personalStats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonalStatsTableOrderingComposer(
            $db: $db,
            $table: $db.personalStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CallingCardsTableOrderingComposer get callingCardId {
    final $$CallingCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.callingCardId,
      referencedTable: $db.callingCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CallingCardsTableOrderingComposer(
            $db: $db,
            $table: $db.callingCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeBlocksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimeBlocksTable> {
  $$TimeBlocksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DayState, int> get blockType =>
      $composableBuilder(column: $table.blockType, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get activity =>
      $composableBuilder(column: $table.activity, builder: (column) => column);

  GeneratedColumn<int> get minimumCommitmentMinutes => $composableBuilder(
    column: $table.minimumCommitmentMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PersonalStatsTableAnnotationComposer get statId {
    final $$PersonalStatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statId,
      referencedTable: $db.personalStats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonalStatsTableAnnotationComposer(
            $db: $db,
            $table: $db.personalStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CallingCardsTableAnnotationComposer get callingCardId {
    final $$CallingCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.callingCardId,
      referencedTable: $db.callingCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CallingCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.callingCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeBlocksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimeBlocksTable,
          TimeBlock,
          $$TimeBlocksTableFilterComposer,
          $$TimeBlocksTableOrderingComposer,
          $$TimeBlocksTableAnnotationComposer,
          $$TimeBlocksTableCreateCompanionBuilder,
          $$TimeBlocksTableUpdateCompanionBuilder,
          (TimeBlock, $$TimeBlocksTableReferences),
          TimeBlock,
          PrefetchHooks Function({bool statId, bool callingCardId})
        > {
  $$TimeBlocksTableTableManager(_$AppDatabase db, $TimeBlocksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimeBlocksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimeBlocksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimeBlocksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DayState> blockType = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<String?> activity = const Value.absent(),
                Value<int?> minimumCommitmentMinutes = const Value.absent(),
                Value<int?> statId = const Value.absent(),
                Value<int?> callingCardId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TimeBlocksCompanion(
                id: id,
                blockType: blockType,
                startTime: startTime,
                endTime: endTime,
                activity: activity,
                minimumCommitmentMinutes: minimumCommitmentMinutes,
                statId: statId,
                callingCardId: callingCardId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DayState blockType,
                required DateTime startTime,
                Value<DateTime?> endTime = const Value.absent(),
                Value<String?> activity = const Value.absent(),
                Value<int?> minimumCommitmentMinutes = const Value.absent(),
                Value<int?> statId = const Value.absent(),
                Value<int?> callingCardId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TimeBlocksCompanion.insert(
                id: id,
                blockType: blockType,
                startTime: startTime,
                endTime: endTime,
                activity: activity,
                minimumCommitmentMinutes: minimumCommitmentMinutes,
                statId: statId,
                callingCardId: callingCardId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimeBlocksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({statId = false, callingCardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (statId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.statId,
                                referencedTable: $$TimeBlocksTableReferences
                                    ._statIdTable(db),
                                referencedColumn: $$TimeBlocksTableReferences
                                    ._statIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (callingCardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.callingCardId,
                                referencedTable: $$TimeBlocksTableReferences
                                    ._callingCardIdTable(db),
                                referencedColumn: $$TimeBlocksTableReferences
                                    ._callingCardIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TimeBlocksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimeBlocksTable,
      TimeBlock,
      $$TimeBlocksTableFilterComposer,
      $$TimeBlocksTableOrderingComposer,
      $$TimeBlocksTableAnnotationComposer,
      $$TimeBlocksTableCreateCompanionBuilder,
      $$TimeBlocksTableUpdateCompanionBuilder,
      (TimeBlock, $$TimeBlocksTableReferences),
      TimeBlock,
      PrefetchHooks Function({bool statId, bool callingCardId})
    >;
typedef $$StatRankNamesTableCreateCompanionBuilder =
    StatRankNamesCompanion Function({
      Value<int> id,
      required int statId,
      required int rankNumber,
      required String rankName,
    });
typedef $$StatRankNamesTableUpdateCompanionBuilder =
    StatRankNamesCompanion Function({
      Value<int> id,
      Value<int> statId,
      Value<int> rankNumber,
      Value<String> rankName,
    });

final class $$StatRankNamesTableReferences
    extends BaseReferences<_$AppDatabase, $StatRankNamesTable, StatRankName> {
  $$StatRankNamesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PersonalStatsTable _statIdTable(_$AppDatabase db) =>
      db.personalStats.createAlias(
        $_aliasNameGenerator(db.statRankNames.statId, db.personalStats.id),
      );

  $$PersonalStatsTableProcessedTableManager get statId {
    final $_column = $_itemColumn<int>('stat_id')!;

    final manager = $$PersonalStatsTableTableManager(
      $_db,
      $_db.personalStats,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_statIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StatRankNamesTableFilterComposer
    extends Composer<_$AppDatabase, $StatRankNamesTable> {
  $$StatRankNamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rankNumber => $composableBuilder(
    column: $table.rankNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rankName => $composableBuilder(
    column: $table.rankName,
    builder: (column) => ColumnFilters(column),
  );

  $$PersonalStatsTableFilterComposer get statId {
    final $$PersonalStatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statId,
      referencedTable: $db.personalStats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonalStatsTableFilterComposer(
            $db: $db,
            $table: $db.personalStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatRankNamesTableOrderingComposer
    extends Composer<_$AppDatabase, $StatRankNamesTable> {
  $$StatRankNamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rankNumber => $composableBuilder(
    column: $table.rankNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rankName => $composableBuilder(
    column: $table.rankName,
    builder: (column) => ColumnOrderings(column),
  );

  $$PersonalStatsTableOrderingComposer get statId {
    final $$PersonalStatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statId,
      referencedTable: $db.personalStats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonalStatsTableOrderingComposer(
            $db: $db,
            $table: $db.personalStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatRankNamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatRankNamesTable> {
  $$StatRankNamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rankNumber => $composableBuilder(
    column: $table.rankNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rankName =>
      $composableBuilder(column: $table.rankName, builder: (column) => column);

  $$PersonalStatsTableAnnotationComposer get statId {
    final $$PersonalStatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statId,
      referencedTable: $db.personalStats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonalStatsTableAnnotationComposer(
            $db: $db,
            $table: $db.personalStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatRankNamesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatRankNamesTable,
          StatRankName,
          $$StatRankNamesTableFilterComposer,
          $$StatRankNamesTableOrderingComposer,
          $$StatRankNamesTableAnnotationComposer,
          $$StatRankNamesTableCreateCompanionBuilder,
          $$StatRankNamesTableUpdateCompanionBuilder,
          (StatRankName, $$StatRankNamesTableReferences),
          StatRankName,
          PrefetchHooks Function({bool statId})
        > {
  $$StatRankNamesTableTableManager(_$AppDatabase db, $StatRankNamesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatRankNamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatRankNamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatRankNamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> statId = const Value.absent(),
                Value<int> rankNumber = const Value.absent(),
                Value<String> rankName = const Value.absent(),
              }) => StatRankNamesCompanion(
                id: id,
                statId: statId,
                rankNumber: rankNumber,
                rankName: rankName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int statId,
                required int rankNumber,
                required String rankName,
              }) => StatRankNamesCompanion.insert(
                id: id,
                statId: statId,
                rankNumber: rankNumber,
                rankName: rankName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StatRankNamesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({statId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (statId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.statId,
                                referencedTable: $$StatRankNamesTableReferences
                                    ._statIdTable(db),
                                referencedColumn: $$StatRankNamesTableReferences
                                    ._statIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StatRankNamesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatRankNamesTable,
      StatRankName,
      $$StatRankNamesTableFilterComposer,
      $$StatRankNamesTableOrderingComposer,
      $$StatRankNamesTableAnnotationComposer,
      $$StatRankNamesTableCreateCompanionBuilder,
      $$StatRankNamesTableUpdateCompanionBuilder,
      (StatRankName, $$StatRankNamesTableReferences),
      StatRankName,
      PrefetchHooks Function({bool statId})
    >;
typedef $$CallingCardObjectivesTableCreateCompanionBuilder =
    CallingCardObjectivesCompanion Function({
      Value<int> id,
      required int callingCardId,
      required String description,
      Value<bool> isCompleted,
      required int sortOrder,
      Value<DateTime?> completedAt,
      Value<DateTime> createdAt,
    });
typedef $$CallingCardObjectivesTableUpdateCompanionBuilder =
    CallingCardObjectivesCompanion Function({
      Value<int> id,
      Value<int> callingCardId,
      Value<String> description,
      Value<bool> isCompleted,
      Value<int> sortOrder,
      Value<DateTime?> completedAt,
      Value<DateTime> createdAt,
    });

final class $$CallingCardObjectivesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CallingCardObjectivesTable,
          CallingCardObjective
        > {
  $$CallingCardObjectivesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CallingCardsTable _callingCardIdTable(_$AppDatabase db) =>
      db.callingCards.createAlias(
        $_aliasNameGenerator(
          db.callingCardObjectives.callingCardId,
          db.callingCards.id,
        ),
      );

  $$CallingCardsTableProcessedTableManager get callingCardId {
    final $_column = $_itemColumn<int>('calling_card_id')!;

    final manager = $$CallingCardsTableTableManager(
      $_db,
      $_db.callingCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_callingCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CallingCardObjectivesTableFilterComposer
    extends Composer<_$AppDatabase, $CallingCardObjectivesTable> {
  $$CallingCardObjectivesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CallingCardsTableFilterComposer get callingCardId {
    final $$CallingCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.callingCardId,
      referencedTable: $db.callingCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CallingCardsTableFilterComposer(
            $db: $db,
            $table: $db.callingCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CallingCardObjectivesTableOrderingComposer
    extends Composer<_$AppDatabase, $CallingCardObjectivesTable> {
  $$CallingCardObjectivesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CallingCardsTableOrderingComposer get callingCardId {
    final $$CallingCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.callingCardId,
      referencedTable: $db.callingCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CallingCardsTableOrderingComposer(
            $db: $db,
            $table: $db.callingCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CallingCardObjectivesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CallingCardObjectivesTable> {
  $$CallingCardObjectivesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CallingCardsTableAnnotationComposer get callingCardId {
    final $$CallingCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.callingCardId,
      referencedTable: $db.callingCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CallingCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.callingCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CallingCardObjectivesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CallingCardObjectivesTable,
          CallingCardObjective,
          $$CallingCardObjectivesTableFilterComposer,
          $$CallingCardObjectivesTableOrderingComposer,
          $$CallingCardObjectivesTableAnnotationComposer,
          $$CallingCardObjectivesTableCreateCompanionBuilder,
          $$CallingCardObjectivesTableUpdateCompanionBuilder,
          (CallingCardObjective, $$CallingCardObjectivesTableReferences),
          CallingCardObjective,
          PrefetchHooks Function({bool callingCardId})
        > {
  $$CallingCardObjectivesTableTableManager(
    _$AppDatabase db,
    $CallingCardObjectivesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CallingCardObjectivesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CallingCardObjectivesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CallingCardObjectivesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> callingCardId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CallingCardObjectivesCompanion(
                id: id,
                callingCardId: callingCardId,
                description: description,
                isCompleted: isCompleted,
                sortOrder: sortOrder,
                completedAt: completedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int callingCardId,
                required String description,
                Value<bool> isCompleted = const Value.absent(),
                required int sortOrder,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CallingCardObjectivesCompanion.insert(
                id: id,
                callingCardId: callingCardId,
                description: description,
                isCompleted: isCompleted,
                sortOrder: sortOrder,
                completedAt: completedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CallingCardObjectivesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({callingCardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (callingCardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.callingCardId,
                                referencedTable:
                                    $$CallingCardObjectivesTableReferences
                                        ._callingCardIdTable(db),
                                referencedColumn:
                                    $$CallingCardObjectivesTableReferences
                                        ._callingCardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CallingCardObjectivesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CallingCardObjectivesTable,
      CallingCardObjective,
      $$CallingCardObjectivesTableFilterComposer,
      $$CallingCardObjectivesTableOrderingComposer,
      $$CallingCardObjectivesTableAnnotationComposer,
      $$CallingCardObjectivesTableCreateCompanionBuilder,
      $$CallingCardObjectivesTableUpdateCompanionBuilder,
      (CallingCardObjective, $$CallingCardObjectivesTableReferences),
      CallingCardObjective,
      PrefetchHooks Function({bool callingCardId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PersonalStatsTableTableManager get personalStats =>
      $$PersonalStatsTableTableManager(_db, _db.personalStats);
  $$CallingCardsTableTableManager get callingCards =>
      $$CallingCardsTableTableManager(_db, _db.callingCards);
  $$TimeBlocksTableTableManager get timeBlocks =>
      $$TimeBlocksTableTableManager(_db, _db.timeBlocks);
  $$StatRankNamesTableTableManager get statRankNames =>
      $$StatRankNamesTableTableManager(_db, _db.statRankNames);
  $$CallingCardObjectivesTableTableManager get callingCardObjectives =>
      $$CallingCardObjectivesTableTableManager(_db, _db.callingCardObjectives);
}
