import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/repositories/video_post_repositorie.dart';
import 'package:toktik/domain/video_post.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  // Recibe el dataSource como parametro
  final VideoPostDataSource videosDataSource;

  VideoPostsRepositoryImpl({required this.videosDataSource});

  @override
  Future<List<VideoPost>> getFavoritesByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }
}
