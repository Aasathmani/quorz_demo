// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String> designation = GeneratedColumn<String>(
      'designation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profilePhotoMeta =
      const VerificationMeta('profilePhoto');
  @override
  late final GeneratedColumn<String> profilePhoto = GeneratedColumn<String>(
      'profile_photo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, designation, email, profilePhoto];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('profile_photo')) {
      context.handle(
          _profilePhotoMeta,
          profilePhoto.isAcceptableOrUnknown(
              data['profile_photo']!, _profilePhotoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      designation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}designation']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      profilePhoto: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_photo']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String firstName;
  final String lastName;
  final String? designation;
  final String? email;
  final String? profilePhoto;
  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.designation,
      this.email,
      this.profilePhoto});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String>(designation);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || profilePhoto != null) {
      map['profile_photo'] = Variable<String>(profilePhoto);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      profilePhoto: profilePhoto == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePhoto),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      designation: serializer.fromJson<String?>(json['designation']),
      email: serializer.fromJson<String?>(json['email']),
      profilePhoto: serializer.fromJson<String?>(json['profilePhoto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'designation': serializer.toJson<String?>(designation),
      'email': serializer.toJson<String?>(email),
      'profilePhoto': serializer.toJson<String?>(profilePhoto),
    };
  }

  User copyWith(
          {String? id,
          String? firstName,
          String? lastName,
          Value<String?> designation = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> profilePhoto = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        designation: designation.present ? designation.value : this.designation,
        email: email.present ? email.value : this.email,
        profilePhoto:
            profilePhoto.present ? profilePhoto.value : this.profilePhoto,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      designation:
          data.designation.present ? data.designation.value : this.designation,
      email: data.email.present ? data.email.value : this.email,
      profilePhoto: data.profilePhoto.present
          ? data.profilePhoto.value
          : this.profilePhoto,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('designation: $designation, ')
          ..write('email: $email, ')
          ..write('profilePhoto: $profilePhoto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, firstName, lastName, designation, email, profilePhoto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.designation == this.designation &&
          other.email == this.email &&
          other.profilePhoto == this.profilePhoto);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> designation;
  final Value<String?> email;
  final Value<String?> profilePhoto;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.designation = const Value.absent(),
    this.email = const Value.absent(),
    this.profilePhoto = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String firstName,
    required String lastName,
    this.designation = const Value.absent(),
    this.email = const Value.absent(),
    this.profilePhoto = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        firstName = Value(firstName),
        lastName = Value(lastName);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? designation,
    Expression<String>? email,
    Expression<String>? profilePhoto,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (designation != null) 'designation': designation,
      if (email != null) 'email': email,
      if (profilePhoto != null) 'profile_photo': profilePhoto,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String?>? designation,
      Value<String?>? email,
      Value<String?>? profilePhoto,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      designation: designation ?? this.designation,
      email: email ?? this.email,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (profilePhoto.present) {
      map['profile_photo'] = Variable<String>(profilePhoto.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('designation: $designation, ')
          ..write('email: $email, ')
          ..write('profilePhoto: $profilePhoto, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuthTokensTable extends AuthTokens
    with TableInfo<$AuthTokensTable, AuthToken> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthTokensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accessTokenMeta =
      const VerificationMeta('accessToken');
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
      'access_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idTokenMeta =
      const VerificationMeta('idToken');
  @override
  late final GeneratedColumn<String> idToken = GeneratedColumn<String>(
      'id_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _refreshTokenMeta =
      const VerificationMeta('refreshToken');
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
      'refresh_token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [accessToken, idToken, refreshToken];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_tokens';
  @override
  VerificationContext validateIntegrity(Insertable<AuthToken> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('access_token')) {
      context.handle(
          _accessTokenMeta,
          accessToken.isAcceptableOrUnknown(
              data['access_token']!, _accessTokenMeta));
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
    }
    if (data.containsKey('id_token')) {
      context.handle(_idTokenMeta,
          idToken.isAcceptableOrUnknown(data['id_token']!, _idTokenMeta));
    } else if (isInserting) {
      context.missing(_idTokenMeta);
    }
    if (data.containsKey('refresh_token')) {
      context.handle(
          _refreshTokenMeta,
          refreshToken.isAcceptableOrUnknown(
              data['refresh_token']!, _refreshTokenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AuthToken map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthToken(
      accessToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}access_token'])!,
      idToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_token'])!,
      refreshToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refresh_token']),
    );
  }

  @override
  $AuthTokensTable createAlias(String alias) {
    return $AuthTokensTable(attachedDatabase, alias);
  }
}

class AuthToken extends DataClass implements Insertable<AuthToken> {
  final String accessToken;
  final String idToken;
  final String? refreshToken;
  const AuthToken(
      {required this.accessToken, required this.idToken, this.refreshToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['access_token'] = Variable<String>(accessToken);
    map['id_token'] = Variable<String>(idToken);
    if (!nullToAbsent || refreshToken != null) {
      map['refresh_token'] = Variable<String>(refreshToken);
    }
    return map;
  }

  AuthTokensCompanion toCompanion(bool nullToAbsent) {
    return AuthTokensCompanion(
      accessToken: Value(accessToken),
      idToken: Value(idToken),
      refreshToken: refreshToken == null && nullToAbsent
          ? const Value.absent()
          : Value(refreshToken),
    );
  }

  factory AuthToken.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthToken(
      accessToken: serializer.fromJson<String>(json['accessToken']),
      idToken: serializer.fromJson<String>(json['idToken']),
      refreshToken: serializer.fromJson<String?>(json['refreshToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accessToken': serializer.toJson<String>(accessToken),
      'idToken': serializer.toJson<String>(idToken),
      'refreshToken': serializer.toJson<String?>(refreshToken),
    };
  }

  AuthToken copyWith(
          {String? accessToken,
          String? idToken,
          Value<String?> refreshToken = const Value.absent()}) =>
      AuthToken(
        accessToken: accessToken ?? this.accessToken,
        idToken: idToken ?? this.idToken,
        refreshToken:
            refreshToken.present ? refreshToken.value : this.refreshToken,
      );
  AuthToken copyWithCompanion(AuthTokensCompanion data) {
    return AuthToken(
      accessToken:
          data.accessToken.present ? data.accessToken.value : this.accessToken,
      idToken: data.idToken.present ? data.idToken.value : this.idToken,
      refreshToken: data.refreshToken.present
          ? data.refreshToken.value
          : this.refreshToken,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthToken(')
          ..write('accessToken: $accessToken, ')
          ..write('idToken: $idToken, ')
          ..write('refreshToken: $refreshToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accessToken, idToken, refreshToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthToken &&
          other.accessToken == this.accessToken &&
          other.idToken == this.idToken &&
          other.refreshToken == this.refreshToken);
}

class AuthTokensCompanion extends UpdateCompanion<AuthToken> {
  final Value<String> accessToken;
  final Value<String> idToken;
  final Value<String?> refreshToken;
  final Value<int> rowid;
  const AuthTokensCompanion({
    this.accessToken = const Value.absent(),
    this.idToken = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthTokensCompanion.insert({
    required String accessToken,
    required String idToken,
    this.refreshToken = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : accessToken = Value(accessToken),
        idToken = Value(idToken);
  static Insertable<AuthToken> custom({
    Expression<String>? accessToken,
    Expression<String>? idToken,
    Expression<String>? refreshToken,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accessToken != null) 'access_token': accessToken,
      if (idToken != null) 'id_token': idToken,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthTokensCompanion copyWith(
      {Value<String>? accessToken,
      Value<String>? idToken,
      Value<String?>? refreshToken,
      Value<int>? rowid}) {
    return AuthTokensCompanion(
      accessToken: accessToken ?? this.accessToken,
      idToken: idToken ?? this.idToken,
      refreshToken: refreshToken ?? this.refreshToken,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    if (idToken.present) {
      map['id_token'] = Variable<String>(idToken.value);
    }
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthTokensCompanion(')
          ..write('accessToken: $accessToken, ')
          ..write('idToken: $idToken, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, NotificationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notificationTypeMeta =
      const VerificationMeta('notificationType');
  @override
  late final GeneratedColumn<String> notificationType = GeneratedColumn<String>(
      'notification_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notifierIdMeta =
      const VerificationMeta('notifierId');
  @override
  late final GeneratedColumn<String> notifierId = GeneratedColumn<String>(
      'notifier_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notifierTypeMeta =
      const VerificationMeta('notifierType');
  @override
  late final GeneratedColumn<String> notifierType = GeneratedColumn<String>(
      'notifier_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        body,
        notificationType,
        notifierId,
        notifierType,
        isRead,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(Insertable<NotificationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('notification_type')) {
      context.handle(
          _notificationTypeMeta,
          notificationType.isAcceptableOrUnknown(
              data['notification_type']!, _notificationTypeMeta));
    }
    if (data.containsKey('notifier_id')) {
      context.handle(
          _notifierIdMeta,
          notifierId.isAcceptableOrUnknown(
              data['notifier_id']!, _notifierIdMeta));
    }
    if (data.containsKey('notifier_type')) {
      context.handle(
          _notifierTypeMeta,
          notifierType.isAcceptableOrUnknown(
              data['notifier_type']!, _notifierTypeMeta));
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      notificationType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}notification_type']),
      notifierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notifier_id']),
      notifierType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notifier_type']),
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class NotificationData extends DataClass
    implements Insertable<NotificationData> {
  final String id;
  final String title;
  final String body;
  final String? notificationType;
  final String? notifierId;
  final String? notifierType;
  final bool? isRead;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const NotificationData(
      {required this.id,
      required this.title,
      required this.body,
      this.notificationType,
      this.notifierId,
      this.notifierType,
      this.isRead,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || notificationType != null) {
      map['notification_type'] = Variable<String>(notificationType);
    }
    if (!nullToAbsent || notifierId != null) {
      map['notifier_id'] = Variable<String>(notifierId);
    }
    if (!nullToAbsent || notifierType != null) {
      map['notifier_type'] = Variable<String>(notifierType);
    }
    if (!nullToAbsent || isRead != null) {
      map['is_read'] = Variable<bool>(isRead);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      notificationType: notificationType == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationType),
      notifierId: notifierId == null && nullToAbsent
          ? const Value.absent()
          : Value(notifierId),
      notifierType: notifierType == null && nullToAbsent
          ? const Value.absent()
          : Value(notifierType),
      isRead:
          isRead == null && nullToAbsent ? const Value.absent() : Value(isRead),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory NotificationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      notificationType: serializer.fromJson<String?>(json['notificationType']),
      notifierId: serializer.fromJson<String?>(json['notifierId']),
      notifierType: serializer.fromJson<String?>(json['notifierType']),
      isRead: serializer.fromJson<bool?>(json['isRead']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'notificationType': serializer.toJson<String?>(notificationType),
      'notifierId': serializer.toJson<String?>(notifierId),
      'notifierType': serializer.toJson<String?>(notifierType),
      'isRead': serializer.toJson<bool?>(isRead),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  NotificationData copyWith(
          {String? id,
          String? title,
          String? body,
          Value<String?> notificationType = const Value.absent(),
          Value<String?> notifierId = const Value.absent(),
          Value<String?> notifierType = const Value.absent(),
          Value<bool?> isRead = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      NotificationData(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        notificationType: notificationType.present
            ? notificationType.value
            : this.notificationType,
        notifierId: notifierId.present ? notifierId.value : this.notifierId,
        notifierType:
            notifierType.present ? notifierType.value : this.notifierType,
        isRead: isRead.present ? isRead.value : this.isRead,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  NotificationData copyWithCompanion(NotificationsCompanion data) {
    return NotificationData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      notificationType: data.notificationType.present
          ? data.notificationType.value
          : this.notificationType,
      notifierId:
          data.notifierId.present ? data.notifierId.value : this.notifierId,
      notifierType: data.notifierType.present
          ? data.notifierType.value
          : this.notifierType,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('notificationType: $notificationType, ')
          ..write('notifierId: $notifierId, ')
          ..write('notifierType: $notifierType, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, body, notificationType, notifierId,
      notifierType, isRead, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationData &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.notificationType == this.notificationType &&
          other.notifierId == this.notifierId &&
          other.notifierType == this.notifierType &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotificationsCompanion extends UpdateCompanion<NotificationData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> body;
  final Value<String?> notificationType;
  final Value<String?> notifierId;
  final Value<String?> notifierType;
  final Value<bool?> isRead;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.notificationType = const Value.absent(),
    this.notifierId = const Value.absent(),
    this.notifierType = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationsCompanion.insert({
    required String id,
    required String title,
    required String body,
    this.notificationType = const Value.absent(),
    this.notifierId = const Value.absent(),
    this.notifierType = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        body = Value(body);
  static Insertable<NotificationData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? notificationType,
    Expression<String>? notifierId,
    Expression<String>? notifierType,
    Expression<bool>? isRead,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (notificationType != null) 'notification_type': notificationType,
      if (notifierId != null) 'notifier_id': notifierId,
      if (notifierType != null) 'notifier_type': notifierType,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? body,
      Value<String?>? notificationType,
      Value<String?>? notifierId,
      Value<String?>? notifierType,
      Value<bool?>? isRead,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return NotificationsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      notificationType: notificationType ?? this.notificationType,
      notifierId: notifierId ?? this.notifierId,
      notifierType: notifierType ?? this.notifierType,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (notificationType.present) {
      map['notification_type'] = Variable<String>(notificationType.value);
    }
    if (notifierId.present) {
      map['notifier_id'] = Variable<String>(notifierId.value);
    }
    if (notifierType.present) {
      map['notifier_type'] = Variable<String>(notifierType.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('notificationType: $notificationType, ')
          ..write('notifierId: $notifierId, ')
          ..write('notifierType: $notifierType, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecentListsTable extends RecentLists
    with TableInfo<$RecentListsTable, RecentList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idHashMeta = const VerificationMeta('idHash');
  @override
  late final GeneratedColumn<String> idHash = GeneratedColumn<String>(
      'id_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _companyMeta =
      const VerificationMeta('company');
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
      'company', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String> designation = GeneratedColumn<String>(
      'designation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isHighValueMeta =
      const VerificationMeta('isHighValue');
  @override
  late final GeneratedColumn<bool> isHighValue = GeneratedColumn<bool>(
      'is_high_value', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_high_value" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _requestDetailsMeta =
      const VerificationMeta('requestDetails');
  @override
  late final GeneratedColumn<String> requestDetails = GeneratedColumn<String>(
      'request_details', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _citiesMeta = const VerificationMeta('cities');
  @override
  late final GeneratedColumn<String> cities = GeneratedColumn<String>(
      'cities', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _platformMeta =
      const VerificationMeta('platform');
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _followersRageMeta =
      const VerificationMeta('followersRage');
  @override
  late final GeneratedColumn<String> followersRage = GeneratedColumn<String>(
      'followers_rage', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _serviceTypeMeta =
      const VerificationMeta('serviceType');
  @override
  late final GeneratedColumn<String> serviceType = GeneratedColumn<String>(
      'service_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _targetAudienceMeta =
      const VerificationMeta('targetAudience');
  @override
  late final GeneratedColumn<String> targetAudience = GeneratedColumn<String>(
      'target_audience', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isOpenMeta = const VerificationMeta('isOpen');
  @override
  late final GeneratedColumn<bool> isOpen = GeneratedColumn<bool>(
      'is_open', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_open" IN (0, 1))'));
  static const VerificationMeta _isPanIndiaMeta =
      const VerificationMeta('isPanIndia');
  @override
  late final GeneratedColumn<bool> isPanIndia = GeneratedColumn<bool>(
      'is_pan_india', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_pan_india" IN (0, 1))'));
  static const VerificationMeta _anyLanguageMeta =
      const VerificationMeta('anyLanguage');
  @override
  late final GeneratedColumn<bool> anyLanguage = GeneratedColumn<bool>(
      'any_language', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("any_language" IN (0, 1))'));
  static const VerificationMeta _anyDealClosedMeta =
      const VerificationMeta('anyDealClosed');
  @override
  late final GeneratedColumn<bool> anyDealClosed = GeneratedColumn<bool>(
      'any_deal_closed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("any_deal_closed" IN (0, 1))'));
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idHash,
        name,
        profileImage,
        company,
        designation,
        isHighValue,
        createdAt,
        description,
        requestDetails,
        cities,
        categories,
        language,
        platform,
        followersRage,
        status,
        serviceType,
        targetAudience,
        isOpen,
        isPanIndia,
        anyLanguage,
        anyDealClosed,
        slug
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recent_lists';
  @override
  VerificationContext validateIntegrity(Insertable<RecentList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_hash')) {
      context.handle(_idHashMeta,
          idHash.isAcceptableOrUnknown(data['id_hash']!, _idHashMeta));
    } else if (isInserting) {
      context.missing(_idHashMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('is_high_value')) {
      context.handle(
          _isHighValueMeta,
          isHighValue.isAcceptableOrUnknown(
              data['is_high_value']!, _isHighValueMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('request_details')) {
      context.handle(
          _requestDetailsMeta,
          requestDetails.isAcceptableOrUnknown(
              data['request_details']!, _requestDetailsMeta));
    }
    if (data.containsKey('cities')) {
      context.handle(_citiesMeta,
          cities.isAcceptableOrUnknown(data['cities']!, _citiesMeta));
    }
    if (data.containsKey('categories')) {
      context.handle(
          _categoriesMeta,
          categories.isAcceptableOrUnknown(
              data['categories']!, _categoriesMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('platform')) {
      context.handle(_platformMeta,
          platform.isAcceptableOrUnknown(data['platform']!, _platformMeta));
    }
    if (data.containsKey('followers_rage')) {
      context.handle(
          _followersRageMeta,
          followersRage.isAcceptableOrUnknown(
              data['followers_rage']!, _followersRageMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('service_type')) {
      context.handle(
          _serviceTypeMeta,
          serviceType.isAcceptableOrUnknown(
              data['service_type']!, _serviceTypeMeta));
    }
    if (data.containsKey('target_audience')) {
      context.handle(
          _targetAudienceMeta,
          targetAudience.isAcceptableOrUnknown(
              data['target_audience']!, _targetAudienceMeta));
    }
    if (data.containsKey('is_open')) {
      context.handle(_isOpenMeta,
          isOpen.isAcceptableOrUnknown(data['is_open']!, _isOpenMeta));
    }
    if (data.containsKey('is_pan_india')) {
      context.handle(
          _isPanIndiaMeta,
          isPanIndia.isAcceptableOrUnknown(
              data['is_pan_india']!, _isPanIndiaMeta));
    }
    if (data.containsKey('any_language')) {
      context.handle(
          _anyLanguageMeta,
          anyLanguage.isAcceptableOrUnknown(
              data['any_language']!, _anyLanguageMeta));
    }
    if (data.containsKey('any_deal_closed')) {
      context.handle(
          _anyDealClosedMeta,
          anyDealClosed.isAcceptableOrUnknown(
              data['any_deal_closed']!, _anyDealClosedMeta));
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idHash};
  @override
  RecentList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentList(
      idHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_hash'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image']),
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company']),
      designation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}designation']),
      isHighValue: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_high_value']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      requestDetails: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}request_details']),
      cities: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cities']),
      categories: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      platform: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platform']),
      followersRage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}followers_rage']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      serviceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_type']),
      targetAudience: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_audience']),
      isOpen: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_open']),
      isPanIndia: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_pan_india']),
      anyLanguage: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}any_language']),
      anyDealClosed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}any_deal_closed']),
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug']),
    );
  }

  @override
  $RecentListsTable createAlias(String alias) {
    return $RecentListsTable(attachedDatabase, alias);
  }
}

class RecentList extends DataClass implements Insertable<RecentList> {
  final String idHash;
  final String? name;
  final String? profileImage;
  final String? company;
  final String? designation;
  final bool? isHighValue;
  final String? createdAt;
  final String? description;
  final String? requestDetails;
  final String? cities;
  final String? categories;
  final String? language;
  final String? platform;
  final String? followersRage;
  final String? status;
  final String? serviceType;
  final String? targetAudience;
  final bool? isOpen;
  final bool? isPanIndia;
  final bool? anyLanguage;
  final bool? anyDealClosed;
  final String? slug;
  const RecentList(
      {required this.idHash,
      this.name,
      this.profileImage,
      this.company,
      this.designation,
      this.isHighValue,
      this.createdAt,
      this.description,
      this.requestDetails,
      this.cities,
      this.categories,
      this.language,
      this.platform,
      this.followersRage,
      this.status,
      this.serviceType,
      this.targetAudience,
      this.isOpen,
      this.isPanIndia,
      this.anyLanguage,
      this.anyDealClosed,
      this.slug});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_hash'] = Variable<String>(idHash);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<String>(profileImage);
    }
    if (!nullToAbsent || company != null) {
      map['company'] = Variable<String>(company);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String>(designation);
    }
    if (!nullToAbsent || isHighValue != null) {
      map['is_high_value'] = Variable<bool>(isHighValue);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || requestDetails != null) {
      map['request_details'] = Variable<String>(requestDetails);
    }
    if (!nullToAbsent || cities != null) {
      map['cities'] = Variable<String>(cities);
    }
    if (!nullToAbsent || categories != null) {
      map['categories'] = Variable<String>(categories);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || platform != null) {
      map['platform'] = Variable<String>(platform);
    }
    if (!nullToAbsent || followersRage != null) {
      map['followers_rage'] = Variable<String>(followersRage);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || serviceType != null) {
      map['service_type'] = Variable<String>(serviceType);
    }
    if (!nullToAbsent || targetAudience != null) {
      map['target_audience'] = Variable<String>(targetAudience);
    }
    if (!nullToAbsent || isOpen != null) {
      map['is_open'] = Variable<bool>(isOpen);
    }
    if (!nullToAbsent || isPanIndia != null) {
      map['is_pan_india'] = Variable<bool>(isPanIndia);
    }
    if (!nullToAbsent || anyLanguage != null) {
      map['any_language'] = Variable<bool>(anyLanguage);
    }
    if (!nullToAbsent || anyDealClosed != null) {
      map['any_deal_closed'] = Variable<bool>(anyDealClosed);
    }
    if (!nullToAbsent || slug != null) {
      map['slug'] = Variable<String>(slug);
    }
    return map;
  }

  RecentListsCompanion toCompanion(bool nullToAbsent) {
    return RecentListsCompanion(
      idHash: Value(idHash),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      profileImage: profileImage == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImage),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      isHighValue: isHighValue == null && nullToAbsent
          ? const Value.absent()
          : Value(isHighValue),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      requestDetails: requestDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(requestDetails),
      cities:
          cities == null && nullToAbsent ? const Value.absent() : Value(cities),
      categories: categories == null && nullToAbsent
          ? const Value.absent()
          : Value(categories),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      platform: platform == null && nullToAbsent
          ? const Value.absent()
          : Value(platform),
      followersRage: followersRage == null && nullToAbsent
          ? const Value.absent()
          : Value(followersRage),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      serviceType: serviceType == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceType),
      targetAudience: targetAudience == null && nullToAbsent
          ? const Value.absent()
          : Value(targetAudience),
      isOpen:
          isOpen == null && nullToAbsent ? const Value.absent() : Value(isOpen),
      isPanIndia: isPanIndia == null && nullToAbsent
          ? const Value.absent()
          : Value(isPanIndia),
      anyLanguage: anyLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(anyLanguage),
      anyDealClosed: anyDealClosed == null && nullToAbsent
          ? const Value.absent()
          : Value(anyDealClosed),
      slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
    );
  }

  factory RecentList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentList(
      idHash: serializer.fromJson<String>(json['idHash']),
      name: serializer.fromJson<String?>(json['name']),
      profileImage: serializer.fromJson<String?>(json['profileImage']),
      company: serializer.fromJson<String?>(json['company']),
      designation: serializer.fromJson<String?>(json['designation']),
      isHighValue: serializer.fromJson<bool?>(json['isHighValue']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      description: serializer.fromJson<String?>(json['description']),
      requestDetails: serializer.fromJson<String?>(json['requestDetails']),
      cities: serializer.fromJson<String?>(json['cities']),
      categories: serializer.fromJson<String?>(json['categories']),
      language: serializer.fromJson<String?>(json['language']),
      platform: serializer.fromJson<String?>(json['platform']),
      followersRage: serializer.fromJson<String?>(json['followersRage']),
      status: serializer.fromJson<String?>(json['status']),
      serviceType: serializer.fromJson<String?>(json['serviceType']),
      targetAudience: serializer.fromJson<String?>(json['targetAudience']),
      isOpen: serializer.fromJson<bool?>(json['isOpen']),
      isPanIndia: serializer.fromJson<bool?>(json['isPanIndia']),
      anyLanguage: serializer.fromJson<bool?>(json['anyLanguage']),
      anyDealClosed: serializer.fromJson<bool?>(json['anyDealClosed']),
      slug: serializer.fromJson<String?>(json['slug']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idHash': serializer.toJson<String>(idHash),
      'name': serializer.toJson<String?>(name),
      'profileImage': serializer.toJson<String?>(profileImage),
      'company': serializer.toJson<String?>(company),
      'designation': serializer.toJson<String?>(designation),
      'isHighValue': serializer.toJson<bool?>(isHighValue),
      'createdAt': serializer.toJson<String?>(createdAt),
      'description': serializer.toJson<String?>(description),
      'requestDetails': serializer.toJson<String?>(requestDetails),
      'cities': serializer.toJson<String?>(cities),
      'categories': serializer.toJson<String?>(categories),
      'language': serializer.toJson<String?>(language),
      'platform': serializer.toJson<String?>(platform),
      'followersRage': serializer.toJson<String?>(followersRage),
      'status': serializer.toJson<String?>(status),
      'serviceType': serializer.toJson<String?>(serviceType),
      'targetAudience': serializer.toJson<String?>(targetAudience),
      'isOpen': serializer.toJson<bool?>(isOpen),
      'isPanIndia': serializer.toJson<bool?>(isPanIndia),
      'anyLanguage': serializer.toJson<bool?>(anyLanguage),
      'anyDealClosed': serializer.toJson<bool?>(anyDealClosed),
      'slug': serializer.toJson<String?>(slug),
    };
  }

  RecentList copyWith(
          {String? idHash,
          Value<String?> name = const Value.absent(),
          Value<String?> profileImage = const Value.absent(),
          Value<String?> company = const Value.absent(),
          Value<String?> designation = const Value.absent(),
          Value<bool?> isHighValue = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> requestDetails = const Value.absent(),
          Value<String?> cities = const Value.absent(),
          Value<String?> categories = const Value.absent(),
          Value<String?> language = const Value.absent(),
          Value<String?> platform = const Value.absent(),
          Value<String?> followersRage = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> serviceType = const Value.absent(),
          Value<String?> targetAudience = const Value.absent(),
          Value<bool?> isOpen = const Value.absent(),
          Value<bool?> isPanIndia = const Value.absent(),
          Value<bool?> anyLanguage = const Value.absent(),
          Value<bool?> anyDealClosed = const Value.absent(),
          Value<String?> slug = const Value.absent()}) =>
      RecentList(
        idHash: idHash ?? this.idHash,
        name: name.present ? name.value : this.name,
        profileImage:
            profileImage.present ? profileImage.value : this.profileImage,
        company: company.present ? company.value : this.company,
        designation: designation.present ? designation.value : this.designation,
        isHighValue: isHighValue.present ? isHighValue.value : this.isHighValue,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        description: description.present ? description.value : this.description,
        requestDetails:
            requestDetails.present ? requestDetails.value : this.requestDetails,
        cities: cities.present ? cities.value : this.cities,
        categories: categories.present ? categories.value : this.categories,
        language: language.present ? language.value : this.language,
        platform: platform.present ? platform.value : this.platform,
        followersRage:
            followersRage.present ? followersRage.value : this.followersRage,
        status: status.present ? status.value : this.status,
        serviceType: serviceType.present ? serviceType.value : this.serviceType,
        targetAudience:
            targetAudience.present ? targetAudience.value : this.targetAudience,
        isOpen: isOpen.present ? isOpen.value : this.isOpen,
        isPanIndia: isPanIndia.present ? isPanIndia.value : this.isPanIndia,
        anyLanguage: anyLanguage.present ? anyLanguage.value : this.anyLanguage,
        anyDealClosed:
            anyDealClosed.present ? anyDealClosed.value : this.anyDealClosed,
        slug: slug.present ? slug.value : this.slug,
      );
  RecentList copyWithCompanion(RecentListsCompanion data) {
    return RecentList(
      idHash: data.idHash.present ? data.idHash.value : this.idHash,
      name: data.name.present ? data.name.value : this.name,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
      company: data.company.present ? data.company.value : this.company,
      designation:
          data.designation.present ? data.designation.value : this.designation,
      isHighValue:
          data.isHighValue.present ? data.isHighValue.value : this.isHighValue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      description:
          data.description.present ? data.description.value : this.description,
      requestDetails: data.requestDetails.present
          ? data.requestDetails.value
          : this.requestDetails,
      cities: data.cities.present ? data.cities.value : this.cities,
      categories:
          data.categories.present ? data.categories.value : this.categories,
      language: data.language.present ? data.language.value : this.language,
      platform: data.platform.present ? data.platform.value : this.platform,
      followersRage: data.followersRage.present
          ? data.followersRage.value
          : this.followersRage,
      status: data.status.present ? data.status.value : this.status,
      serviceType:
          data.serviceType.present ? data.serviceType.value : this.serviceType,
      targetAudience: data.targetAudience.present
          ? data.targetAudience.value
          : this.targetAudience,
      isOpen: data.isOpen.present ? data.isOpen.value : this.isOpen,
      isPanIndia:
          data.isPanIndia.present ? data.isPanIndia.value : this.isPanIndia,
      anyLanguage:
          data.anyLanguage.present ? data.anyLanguage.value : this.anyLanguage,
      anyDealClosed: data.anyDealClosed.present
          ? data.anyDealClosed.value
          : this.anyDealClosed,
      slug: data.slug.present ? data.slug.value : this.slug,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecentList(')
          ..write('idHash: $idHash, ')
          ..write('name: $name, ')
          ..write('profileImage: $profileImage, ')
          ..write('company: $company, ')
          ..write('designation: $designation, ')
          ..write('isHighValue: $isHighValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('description: $description, ')
          ..write('requestDetails: $requestDetails, ')
          ..write('cities: $cities, ')
          ..write('categories: $categories, ')
          ..write('language: $language, ')
          ..write('platform: $platform, ')
          ..write('followersRage: $followersRage, ')
          ..write('status: $status, ')
          ..write('serviceType: $serviceType, ')
          ..write('targetAudience: $targetAudience, ')
          ..write('isOpen: $isOpen, ')
          ..write('isPanIndia: $isPanIndia, ')
          ..write('anyLanguage: $anyLanguage, ')
          ..write('anyDealClosed: $anyDealClosed, ')
          ..write('slug: $slug')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        idHash,
        name,
        profileImage,
        company,
        designation,
        isHighValue,
        createdAt,
        description,
        requestDetails,
        cities,
        categories,
        language,
        platform,
        followersRage,
        status,
        serviceType,
        targetAudience,
        isOpen,
        isPanIndia,
        anyLanguage,
        anyDealClosed,
        slug
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentList &&
          other.idHash == this.idHash &&
          other.name == this.name &&
          other.profileImage == this.profileImage &&
          other.company == this.company &&
          other.designation == this.designation &&
          other.isHighValue == this.isHighValue &&
          other.createdAt == this.createdAt &&
          other.description == this.description &&
          other.requestDetails == this.requestDetails &&
          other.cities == this.cities &&
          other.categories == this.categories &&
          other.language == this.language &&
          other.platform == this.platform &&
          other.followersRage == this.followersRage &&
          other.status == this.status &&
          other.serviceType == this.serviceType &&
          other.targetAudience == this.targetAudience &&
          other.isOpen == this.isOpen &&
          other.isPanIndia == this.isPanIndia &&
          other.anyLanguage == this.anyLanguage &&
          other.anyDealClosed == this.anyDealClosed &&
          other.slug == this.slug);
}

class RecentListsCompanion extends UpdateCompanion<RecentList> {
  final Value<String> idHash;
  final Value<String?> name;
  final Value<String?> profileImage;
  final Value<String?> company;
  final Value<String?> designation;
  final Value<bool?> isHighValue;
  final Value<String?> createdAt;
  final Value<String?> description;
  final Value<String?> requestDetails;
  final Value<String?> cities;
  final Value<String?> categories;
  final Value<String?> language;
  final Value<String?> platform;
  final Value<String?> followersRage;
  final Value<String?> status;
  final Value<String?> serviceType;
  final Value<String?> targetAudience;
  final Value<bool?> isOpen;
  final Value<bool?> isPanIndia;
  final Value<bool?> anyLanguage;
  final Value<bool?> anyDealClosed;
  final Value<String?> slug;
  final Value<int> rowid;
  const RecentListsCompanion({
    this.idHash = const Value.absent(),
    this.name = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.company = const Value.absent(),
    this.designation = const Value.absent(),
    this.isHighValue = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.description = const Value.absent(),
    this.requestDetails = const Value.absent(),
    this.cities = const Value.absent(),
    this.categories = const Value.absent(),
    this.language = const Value.absent(),
    this.platform = const Value.absent(),
    this.followersRage = const Value.absent(),
    this.status = const Value.absent(),
    this.serviceType = const Value.absent(),
    this.targetAudience = const Value.absent(),
    this.isOpen = const Value.absent(),
    this.isPanIndia = const Value.absent(),
    this.anyLanguage = const Value.absent(),
    this.anyDealClosed = const Value.absent(),
    this.slug = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecentListsCompanion.insert({
    required String idHash,
    this.name = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.company = const Value.absent(),
    this.designation = const Value.absent(),
    this.isHighValue = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.description = const Value.absent(),
    this.requestDetails = const Value.absent(),
    this.cities = const Value.absent(),
    this.categories = const Value.absent(),
    this.language = const Value.absent(),
    this.platform = const Value.absent(),
    this.followersRage = const Value.absent(),
    this.status = const Value.absent(),
    this.serviceType = const Value.absent(),
    this.targetAudience = const Value.absent(),
    this.isOpen = const Value.absent(),
    this.isPanIndia = const Value.absent(),
    this.anyLanguage = const Value.absent(),
    this.anyDealClosed = const Value.absent(),
    this.slug = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idHash = Value(idHash);
  static Insertable<RecentList> custom({
    Expression<String>? idHash,
    Expression<String>? name,
    Expression<String>? profileImage,
    Expression<String>? company,
    Expression<String>? designation,
    Expression<bool>? isHighValue,
    Expression<String>? createdAt,
    Expression<String>? description,
    Expression<String>? requestDetails,
    Expression<String>? cities,
    Expression<String>? categories,
    Expression<String>? language,
    Expression<String>? platform,
    Expression<String>? followersRage,
    Expression<String>? status,
    Expression<String>? serviceType,
    Expression<String>? targetAudience,
    Expression<bool>? isOpen,
    Expression<bool>? isPanIndia,
    Expression<bool>? anyLanguage,
    Expression<bool>? anyDealClosed,
    Expression<String>? slug,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idHash != null) 'id_hash': idHash,
      if (name != null) 'name': name,
      if (profileImage != null) 'profile_image': profileImage,
      if (company != null) 'company': company,
      if (designation != null) 'designation': designation,
      if (isHighValue != null) 'is_high_value': isHighValue,
      if (createdAt != null) 'created_at': createdAt,
      if (description != null) 'description': description,
      if (requestDetails != null) 'request_details': requestDetails,
      if (cities != null) 'cities': cities,
      if (categories != null) 'categories': categories,
      if (language != null) 'language': language,
      if (platform != null) 'platform': platform,
      if (followersRage != null) 'followers_rage': followersRage,
      if (status != null) 'status': status,
      if (serviceType != null) 'service_type': serviceType,
      if (targetAudience != null) 'target_audience': targetAudience,
      if (isOpen != null) 'is_open': isOpen,
      if (isPanIndia != null) 'is_pan_india': isPanIndia,
      if (anyLanguage != null) 'any_language': anyLanguage,
      if (anyDealClosed != null) 'any_deal_closed': anyDealClosed,
      if (slug != null) 'slug': slug,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecentListsCompanion copyWith(
      {Value<String>? idHash,
      Value<String?>? name,
      Value<String?>? profileImage,
      Value<String?>? company,
      Value<String?>? designation,
      Value<bool?>? isHighValue,
      Value<String?>? createdAt,
      Value<String?>? description,
      Value<String?>? requestDetails,
      Value<String?>? cities,
      Value<String?>? categories,
      Value<String?>? language,
      Value<String?>? platform,
      Value<String?>? followersRage,
      Value<String?>? status,
      Value<String?>? serviceType,
      Value<String?>? targetAudience,
      Value<bool?>? isOpen,
      Value<bool?>? isPanIndia,
      Value<bool?>? anyLanguage,
      Value<bool?>? anyDealClosed,
      Value<String?>? slug,
      Value<int>? rowid}) {
    return RecentListsCompanion(
      idHash: idHash ?? this.idHash,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      company: company ?? this.company,
      designation: designation ?? this.designation,
      isHighValue: isHighValue ?? this.isHighValue,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      requestDetails: requestDetails ?? this.requestDetails,
      cities: cities ?? this.cities,
      categories: categories ?? this.categories,
      language: language ?? this.language,
      platform: platform ?? this.platform,
      followersRage: followersRage ?? this.followersRage,
      status: status ?? this.status,
      serviceType: serviceType ?? this.serviceType,
      targetAudience: targetAudience ?? this.targetAudience,
      isOpen: isOpen ?? this.isOpen,
      isPanIndia: isPanIndia ?? this.isPanIndia,
      anyLanguage: anyLanguage ?? this.anyLanguage,
      anyDealClosed: anyDealClosed ?? this.anyDealClosed,
      slug: slug ?? this.slug,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idHash.present) {
      map['id_hash'] = Variable<String>(idHash.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    if (isHighValue.present) {
      map['is_high_value'] = Variable<bool>(isHighValue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (requestDetails.present) {
      map['request_details'] = Variable<String>(requestDetails.value);
    }
    if (cities.present) {
      map['cities'] = Variable<String>(cities.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (followersRage.present) {
      map['followers_rage'] = Variable<String>(followersRage.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (serviceType.present) {
      map['service_type'] = Variable<String>(serviceType.value);
    }
    if (targetAudience.present) {
      map['target_audience'] = Variable<String>(targetAudience.value);
    }
    if (isOpen.present) {
      map['is_open'] = Variable<bool>(isOpen.value);
    }
    if (isPanIndia.present) {
      map['is_pan_india'] = Variable<bool>(isPanIndia.value);
    }
    if (anyLanguage.present) {
      map['any_language'] = Variable<bool>(anyLanguage.value);
    }
    if (anyDealClosed.present) {
      map['any_deal_closed'] = Variable<bool>(anyDealClosed.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentListsCompanion(')
          ..write('idHash: $idHash, ')
          ..write('name: $name, ')
          ..write('profileImage: $profileImage, ')
          ..write('company: $company, ')
          ..write('designation: $designation, ')
          ..write('isHighValue: $isHighValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('description: $description, ')
          ..write('requestDetails: $requestDetails, ')
          ..write('cities: $cities, ')
          ..write('categories: $categories, ')
          ..write('language: $language, ')
          ..write('platform: $platform, ')
          ..write('followersRage: $followersRage, ')
          ..write('status: $status, ')
          ..write('serviceType: $serviceType, ')
          ..write('targetAudience: $targetAudience, ')
          ..write('isOpen: $isOpen, ')
          ..write('isPanIndia: $isPanIndia, ')
          ..write('anyLanguage: $anyLanguage, ')
          ..write('anyDealClosed: $anyDealClosed, ')
          ..write('slug: $slug, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AuthTokensTable authTokens = $AuthTokensTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $RecentListsTable recentLists = $RecentListsTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final AuthTokenDao authTokenDao = AuthTokenDao(this as AppDatabase);
  late final NotificationDao notificationDao =
      NotificationDao(this as AppDatabase);
  late final RecentListDao recentListDao = RecentListDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, authTokens, notifications, recentLists];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String firstName,
  required String lastName,
  Value<String?> designation,
  Value<String?> email,
  Value<String?> profilePhoto,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<String?> designation,
  Value<String?> email,
  Value<String?> profilePhoto,
  Value<int> rowid,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profilePhoto => $composableBuilder(
      column: $table.profilePhoto, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profilePhoto => $composableBuilder(
      column: $table.profilePhoto,
      builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get profilePhoto => $composableBuilder(
      column: $table.profilePhoto, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> designation = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> profilePhoto = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            designation: designation,
            email: email,
            profilePhoto: profilePhoto,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String firstName,
            required String lastName,
            Value<String?> designation = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> profilePhoto = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            designation: designation,
            email: email,
            profilePhoto: profilePhoto,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$AuthTokensTableCreateCompanionBuilder = AuthTokensCompanion Function({
  required String accessToken,
  required String idToken,
  Value<String?> refreshToken,
  Value<int> rowid,
});
typedef $$AuthTokensTableUpdateCompanionBuilder = AuthTokensCompanion Function({
  Value<String> accessToken,
  Value<String> idToken,
  Value<String?> refreshToken,
  Value<int> rowid,
});

class $$AuthTokensTableFilterComposer
    extends Composer<_$AppDatabase, $AuthTokensTable> {
  $$AuthTokensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accessToken => $composableBuilder(
      column: $table.accessToken, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get idToken => $composableBuilder(
      column: $table.idToken, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => ColumnFilters(column));
}

class $$AuthTokensTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthTokensTable> {
  $$AuthTokensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accessToken => $composableBuilder(
      column: $table.accessToken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get idToken => $composableBuilder(
      column: $table.idToken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken,
      builder: (column) => ColumnOrderings(column));
}

class $$AuthTokensTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthTokensTable> {
  $$AuthTokensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accessToken => $composableBuilder(
      column: $table.accessToken, builder: (column) => column);

  GeneratedColumn<String> get idToken =>
      $composableBuilder(column: $table.idToken, builder: (column) => column);

  GeneratedColumn<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => column);
}

class $$AuthTokensTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AuthTokensTable,
    AuthToken,
    $$AuthTokensTableFilterComposer,
    $$AuthTokensTableOrderingComposer,
    $$AuthTokensTableAnnotationComposer,
    $$AuthTokensTableCreateCompanionBuilder,
    $$AuthTokensTableUpdateCompanionBuilder,
    (AuthToken, BaseReferences<_$AppDatabase, $AuthTokensTable, AuthToken>),
    AuthToken,
    PrefetchHooks Function()> {
  $$AuthTokensTableTableManager(_$AppDatabase db, $AuthTokensTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthTokensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthTokensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthTokensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> accessToken = const Value.absent(),
            Value<String> idToken = const Value.absent(),
            Value<String?> refreshToken = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthTokensCompanion(
            accessToken: accessToken,
            idToken: idToken,
            refreshToken: refreshToken,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String accessToken,
            required String idToken,
            Value<String?> refreshToken = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthTokensCompanion.insert(
            accessToken: accessToken,
            idToken: idToken,
            refreshToken: refreshToken,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuthTokensTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AuthTokensTable,
    AuthToken,
    $$AuthTokensTableFilterComposer,
    $$AuthTokensTableOrderingComposer,
    $$AuthTokensTableAnnotationComposer,
    $$AuthTokensTableCreateCompanionBuilder,
    $$AuthTokensTableUpdateCompanionBuilder,
    (AuthToken, BaseReferences<_$AppDatabase, $AuthTokensTable, AuthToken>),
    AuthToken,
    PrefetchHooks Function()>;
typedef $$NotificationsTableCreateCompanionBuilder = NotificationsCompanion
    Function({
  required String id,
  required String title,
  required String body,
  Value<String?> notificationType,
  Value<String?> notifierId,
  Value<String?> notifierType,
  Value<bool?> isRead,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$NotificationsTableUpdateCompanionBuilder = NotificationsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String> body,
  Value<String?> notificationType,
  Value<String?> notifierId,
  Value<String?> notifierType,
  Value<bool?> isRead,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

class $$NotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notificationType => $composableBuilder(
      column: $table.notificationType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notifierId => $composableBuilder(
      column: $table.notifierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notifierType => $composableBuilder(
      column: $table.notifierType, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$NotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notificationType => $composableBuilder(
      column: $table.notificationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notifierId => $composableBuilder(
      column: $table.notifierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notifierType => $composableBuilder(
      column: $table.notifierType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$NotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get notificationType => $composableBuilder(
      column: $table.notificationType, builder: (column) => column);

  GeneratedColumn<String> get notifierId => $composableBuilder(
      column: $table.notifierId, builder: (column) => column);

  GeneratedColumn<String> get notifierType => $composableBuilder(
      column: $table.notifierType, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$NotificationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationsTable,
    NotificationData,
    $$NotificationsTableFilterComposer,
    $$NotificationsTableOrderingComposer,
    $$NotificationsTableAnnotationComposer,
    $$NotificationsTableCreateCompanionBuilder,
    $$NotificationsTableUpdateCompanionBuilder,
    (
      NotificationData,
      BaseReferences<_$AppDatabase, $NotificationsTable, NotificationData>
    ),
    NotificationData,
    PrefetchHooks Function()> {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<String?> notificationType = const Value.absent(),
            Value<String?> notifierId = const Value.absent(),
            Value<String?> notifierType = const Value.absent(),
            Value<bool?> isRead = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationsCompanion(
            id: id,
            title: title,
            body: body,
            notificationType: notificationType,
            notifierId: notifierId,
            notifierType: notifierType,
            isRead: isRead,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String body,
            Value<String?> notificationType = const Value.absent(),
            Value<String?> notifierId = const Value.absent(),
            Value<String?> notifierType = const Value.absent(),
            Value<bool?> isRead = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationsCompanion.insert(
            id: id,
            title: title,
            body: body,
            notificationType: notificationType,
            notifierId: notifierId,
            notifierType: notifierType,
            isRead: isRead,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotificationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotificationsTable,
    NotificationData,
    $$NotificationsTableFilterComposer,
    $$NotificationsTableOrderingComposer,
    $$NotificationsTableAnnotationComposer,
    $$NotificationsTableCreateCompanionBuilder,
    $$NotificationsTableUpdateCompanionBuilder,
    (
      NotificationData,
      BaseReferences<_$AppDatabase, $NotificationsTable, NotificationData>
    ),
    NotificationData,
    PrefetchHooks Function()>;
typedef $$RecentListsTableCreateCompanionBuilder = RecentListsCompanion
    Function({
  required String idHash,
  Value<String?> name,
  Value<String?> profileImage,
  Value<String?> company,
  Value<String?> designation,
  Value<bool?> isHighValue,
  Value<String?> createdAt,
  Value<String?> description,
  Value<String?> requestDetails,
  Value<String?> cities,
  Value<String?> categories,
  Value<String?> language,
  Value<String?> platform,
  Value<String?> followersRage,
  Value<String?> status,
  Value<String?> serviceType,
  Value<String?> targetAudience,
  Value<bool?> isOpen,
  Value<bool?> isPanIndia,
  Value<bool?> anyLanguage,
  Value<bool?> anyDealClosed,
  Value<String?> slug,
  Value<int> rowid,
});
typedef $$RecentListsTableUpdateCompanionBuilder = RecentListsCompanion
    Function({
  Value<String> idHash,
  Value<String?> name,
  Value<String?> profileImage,
  Value<String?> company,
  Value<String?> designation,
  Value<bool?> isHighValue,
  Value<String?> createdAt,
  Value<String?> description,
  Value<String?> requestDetails,
  Value<String?> cities,
  Value<String?> categories,
  Value<String?> language,
  Value<String?> platform,
  Value<String?> followersRage,
  Value<String?> status,
  Value<String?> serviceType,
  Value<String?> targetAudience,
  Value<bool?> isOpen,
  Value<bool?> isPanIndia,
  Value<bool?> anyLanguage,
  Value<bool?> anyDealClosed,
  Value<String?> slug,
  Value<int> rowid,
});

class $$RecentListsTableFilterComposer
    extends Composer<_$AppDatabase, $RecentListsTable> {
  $$RecentListsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idHash => $composableBuilder(
      column: $table.idHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHighValue => $composableBuilder(
      column: $table.isHighValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get requestDetails => $composableBuilder(
      column: $table.requestDetails,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cities => $composableBuilder(
      column: $table.cities, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get followersRage => $composableBuilder(
      column: $table.followersRage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serviceType => $composableBuilder(
      column: $table.serviceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetAudience => $composableBuilder(
      column: $table.targetAudience,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOpen => $composableBuilder(
      column: $table.isOpen, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPanIndia => $composableBuilder(
      column: $table.isPanIndia, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get anyLanguage => $composableBuilder(
      column: $table.anyLanguage, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get anyDealClosed => $composableBuilder(
      column: $table.anyDealClosed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnFilters(column));
}

class $$RecentListsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecentListsTable> {
  $$RecentListsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idHash => $composableBuilder(
      column: $table.idHash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHighValue => $composableBuilder(
      column: $table.isHighValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get requestDetails => $composableBuilder(
      column: $table.requestDetails,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cities => $composableBuilder(
      column: $table.cities, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get followersRage => $composableBuilder(
      column: $table.followersRage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serviceType => $composableBuilder(
      column: $table.serviceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetAudience => $composableBuilder(
      column: $table.targetAudience,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOpen => $composableBuilder(
      column: $table.isOpen, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPanIndia => $composableBuilder(
      column: $table.isPanIndia, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get anyLanguage => $composableBuilder(
      column: $table.anyLanguage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get anyDealClosed => $composableBuilder(
      column: $table.anyDealClosed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnOrderings(column));
}

class $$RecentListsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecentListsTable> {
  $$RecentListsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idHash =>
      $composableBuilder(column: $table.idHash, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => column);

  GeneratedColumn<bool> get isHighValue => $composableBuilder(
      column: $table.isHighValue, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get requestDetails => $composableBuilder(
      column: $table.requestDetails, builder: (column) => column);

  GeneratedColumn<String> get cities =>
      $composableBuilder(column: $table.cities, builder: (column) => column);

  GeneratedColumn<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get platform =>
      $composableBuilder(column: $table.platform, builder: (column) => column);

  GeneratedColumn<String> get followersRage => $composableBuilder(
      column: $table.followersRage, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get serviceType => $composableBuilder(
      column: $table.serviceType, builder: (column) => column);

  GeneratedColumn<String> get targetAudience => $composableBuilder(
      column: $table.targetAudience, builder: (column) => column);

  GeneratedColumn<bool> get isOpen =>
      $composableBuilder(column: $table.isOpen, builder: (column) => column);

  GeneratedColumn<bool> get isPanIndia => $composableBuilder(
      column: $table.isPanIndia, builder: (column) => column);

  GeneratedColumn<bool> get anyLanguage => $composableBuilder(
      column: $table.anyLanguage, builder: (column) => column);

  GeneratedColumn<bool> get anyDealClosed => $composableBuilder(
      column: $table.anyDealClosed, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);
}

class $$RecentListsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecentListsTable,
    RecentList,
    $$RecentListsTableFilterComposer,
    $$RecentListsTableOrderingComposer,
    $$RecentListsTableAnnotationComposer,
    $$RecentListsTableCreateCompanionBuilder,
    $$RecentListsTableUpdateCompanionBuilder,
    (RecentList, BaseReferences<_$AppDatabase, $RecentListsTable, RecentList>),
    RecentList,
    PrefetchHooks Function()> {
  $$RecentListsTableTableManager(_$AppDatabase db, $RecentListsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecentListsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecentListsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecentListsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> idHash = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
            Value<String?> company = const Value.absent(),
            Value<String?> designation = const Value.absent(),
            Value<bool?> isHighValue = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> requestDetails = const Value.absent(),
            Value<String?> cities = const Value.absent(),
            Value<String?> categories = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<String?> followersRage = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> serviceType = const Value.absent(),
            Value<String?> targetAudience = const Value.absent(),
            Value<bool?> isOpen = const Value.absent(),
            Value<bool?> isPanIndia = const Value.absent(),
            Value<bool?> anyLanguage = const Value.absent(),
            Value<bool?> anyDealClosed = const Value.absent(),
            Value<String?> slug = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecentListsCompanion(
            idHash: idHash,
            name: name,
            profileImage: profileImage,
            company: company,
            designation: designation,
            isHighValue: isHighValue,
            createdAt: createdAt,
            description: description,
            requestDetails: requestDetails,
            cities: cities,
            categories: categories,
            language: language,
            platform: platform,
            followersRage: followersRage,
            status: status,
            serviceType: serviceType,
            targetAudience: targetAudience,
            isOpen: isOpen,
            isPanIndia: isPanIndia,
            anyLanguage: anyLanguage,
            anyDealClosed: anyDealClosed,
            slug: slug,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String idHash,
            Value<String?> name = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
            Value<String?> company = const Value.absent(),
            Value<String?> designation = const Value.absent(),
            Value<bool?> isHighValue = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> requestDetails = const Value.absent(),
            Value<String?> cities = const Value.absent(),
            Value<String?> categories = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<String?> followersRage = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> serviceType = const Value.absent(),
            Value<String?> targetAudience = const Value.absent(),
            Value<bool?> isOpen = const Value.absent(),
            Value<bool?> isPanIndia = const Value.absent(),
            Value<bool?> anyLanguage = const Value.absent(),
            Value<bool?> anyDealClosed = const Value.absent(),
            Value<String?> slug = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecentListsCompanion.insert(
            idHash: idHash,
            name: name,
            profileImage: profileImage,
            company: company,
            designation: designation,
            isHighValue: isHighValue,
            createdAt: createdAt,
            description: description,
            requestDetails: requestDetails,
            cities: cities,
            categories: categories,
            language: language,
            platform: platform,
            followersRage: followersRage,
            status: status,
            serviceType: serviceType,
            targetAudience: targetAudience,
            isOpen: isOpen,
            isPanIndia: isPanIndia,
            anyLanguage: anyLanguage,
            anyDealClosed: anyDealClosed,
            slug: slug,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecentListsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecentListsTable,
    RecentList,
    $$RecentListsTableFilterComposer,
    $$RecentListsTableOrderingComposer,
    $$RecentListsTableAnnotationComposer,
    $$RecentListsTableCreateCompanionBuilder,
    $$RecentListsTableUpdateCompanionBuilder,
    (RecentList, BaseReferences<_$AppDatabase, $RecentListsTable, RecentList>),
    RecentList,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AuthTokensTableTableManager get authTokens =>
      $$AuthTokensTableTableManager(_db, _db.authTokens);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$RecentListsTableTableManager get recentLists =>
      $$RecentListsTableTableManager(_db, _db.recentLists);
}
