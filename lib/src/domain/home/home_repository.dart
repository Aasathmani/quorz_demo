import 'package:app_qoruz/src/domain/database/core/app_database.dart';
import 'package:app_qoruz/src/domain/database/recent_list_dao.dart';
import 'package:app_qoruz/src/domain/home/home_service.dart';
import 'package:app_qoruz/src/utils/extensions.dart';
import 'package:app_qoruz/src/utils/guard.dart';
import 'package:collection/collection.dart';

class HomeRepository {
  static HomeRepository? instance;
  final HomeService homeService;
  final RecentListDao recentListDao;

  HomeRepository({
    required this.homeService,
    required this.recentListDao,
  });

  Future<List<RecentList>> getRecentList(int count) async {
    await Guard.runAsync(() async {
      final dataFromResponse = await homeService.fetchRecentList(count);
      if (dataFromResponse.isNotEmpty) {
        final selectProjectList = dataFromResponse
            .map((item) => _recentList(item))
            .whereNotNull()
            .toList();
        await recentListDao.deleteAllRecentListList();

        await recentListDao.saveRecentList(selectProjectList);
      }
    });
    return recentListDao.getRecentListList();
  }

  RecentList? _recentList(Map<String, dynamic> item) {
    return Guard.asNullable<RecentList>(() {
      final userDetails = toGenericMap(item['user_details']);
      final requestDetails = toGenericMap(item['request_details']);
      return RecentList(
        idHash: item['id_hash'].toString(),
        name: userDetails['name'].toString(),
        profileImage: userDetails['profile_image'].toString(),
        company: userDetails['company'].toString(),
        designation: userDetails['designation'].toString(),
        createdAt: item['created_at'].toString(),
        description: item['description'].toString(),
        requestDetails: item['request_details'].toString(),
        cities: requestDetails['cities'].toString(),
        categories: requestDetails['categories'].toString(),
        followersRage: requestDetails['followers_range'].toString(),
        language: requestDetails['languages'].toString(),
        platform: requestDetails['platform'].toString(),
        status: item['status'].toString(),
        serviceType: item['service_type'].toString(),
        targetAudience: item['target_audience'].toString(),
        slug: item['slug'].toString(),
        isOpen: item['is_open'] as bool,
        isHighValue: item['is_high_value'] as bool,
        isPanIndia: item['is_pan_india'] as bool,
        anyLanguage: item['any_language'] as bool,
        anyDealClosed: item['is_deal_closed'] as bool,
      );
    });
  }
}
