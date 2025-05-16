import 'package:flame/cache.dart';
import 'package:flame_audio/flame_audio.dart';

class ResourceService {
  final Images images;
  final Set<String> _loadedBackground = {};
  final Set<String> _loadedCharacter = {};

  ResourceService(this.images);

  Future<void> preLoadBackgrounds(List<String> backgroundNames) async {
    images.prefix = 'assets/';
    await Future.wait(
      backgroundNames
          .where((name) => !_loadedBackground.contains(_bgKey(name)))
          .map((name) {
            final key = _bgKey(name);
            _loadedBackground.add(key);
            return images.load(key);
          }),
    );
  }

  Future<void> preloadCharacters(List<String> characterNames) async {
    images.prefix = 'assets/';
    await Future.wait(
      characterNames
          .where((name) => !_loadedCharacter.contains(_charKey(name)))
          .map((name) {
            final key = _charKey(name);
            _loadedCharacter.add(key);
            return images.load(key);
          }),
    );
  }

  void clearAll() {
    images.clearCache();
    _loadedBackground.clear();
    _loadedCharacter.clear();
    FlameAudio.bgm.stop();
  }

  void clearGameResources() async {
    _loadedCharacter.forEach((key) async {
      images.clear(key);
    });
    FlameAudio.bgm.stop();
    _loadedCharacter.clear();
  }

  String _bgKey(String sceneName) => 'background/$sceneName.webp';
  String _charKey(String characterName) => 'character/$characterName.webp';
}
