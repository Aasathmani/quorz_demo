import 'package:app_qoruz/src/domain/database/core/app_database.dart';
import 'package:drift/drift.dart';

part 'recent_list_dao.g.dart';

@DriftAccessor(tables: [RecentLists])
class RecentListDao extends DatabaseAccessor<AppDatabase>
    with _$RecentListDaoMixin {
  RecentListDao(super.db);

  Future<void> saveRecentList(List<RecentList> recentList) {
    return batch(
      (batch) => batch.insertAll(
        recentLists,
        recentList,
        mode: InsertMode.insertOrReplace,
      ),
    );
  }

  Future<void> deleteAllRecentListList() async {
    await delete(recentLists).go();
  }

  Future<List<RecentList>> getRecentListList() async {
    return select(recentLists).get();
  }
}

@DataClassName('RecentList')
class RecentLists extends Table {
  TextColumn get idHash => text()();

  TextColumn get name => text().nullable()();
  TextColumn get profileImage => text().nullable()();
  TextColumn get company => text().nullable()();
  TextColumn get designation => text().nullable()();
  BoolColumn get isHighValue => boolean().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get requestDetails => text().nullable()();
  TextColumn get cities => text().nullable()();
  TextColumn get categories => text().nullable()();
  TextColumn get language => text().nullable()();
  TextColumn get platform => text().nullable()();
  TextColumn get followersRage => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get serviceType => text().nullable()();
  TextColumn get targetAudience => text().nullable()();
  BoolColumn get isOpen => boolean().nullable()();
  BoolColumn get isPanIndia => boolean().nullable()();
  BoolColumn get anyLanguage => boolean().nullable()();
  BoolColumn get anyDealClosed => boolean().nullable()();
  TextColumn get slug => text().nullable()();

  @override
  Set<Column> get primaryKey => {idHash};
}
