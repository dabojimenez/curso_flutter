import 'package:toktik/domain/video_post.dart';

// DataSource: no le importa ñla impeklenmtyacion ya que es solo la fuente de datos
abstract class VideoPostDataSource {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoritesByUser(String userId);
}
