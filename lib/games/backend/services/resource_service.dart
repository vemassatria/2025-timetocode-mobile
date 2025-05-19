import 'package:flame/cache.dart';
import 'package:flame_audio/flame_audio.dart';

class ResourceService {
  final Images images;
  final Set<String> _loadedBackground = {};
  final Set<String> _loadedCharacter = {};
  final Set<String> _loadedIlustration = {};

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

  Future<void> preloadIlustrations(List<String> ilustrations) async {
    images.prefix = 'assets/';
    await Future.wait(
      ilustrations
          .where((name) => !_loadedIlustration.contains(_ilustrationKey(name)))
          .map((name) {
            final key = _ilustrationKey(name);
            _loadedIlustration.add(key);
            return images.load(key);
          }),
    );
  }

  void clearStoryResources() {
    final allKeys = {..._loadedCharacter, ..._loadedIlustration};

    allKeys.forEach(images.clear);
    _loadedCharacter.clear();
    _loadedIlustration.clear();
    FlameAudio.bgm.stop();
  }

  void clearAll() {
    images.clearCache();
    _loadedBackground.clear();
    _loadedCharacter.clear();
    _loadedIlustration.clear();
    FlameAudio.bgm.stop();
  }

  String _bgKey(String sceneName) => 'background/$sceneName.webp';
  String _charKey(String characterName) => 'character/$characterName.webp';
  String _ilustrationKey(String ilustrationName) =>
      'ilustration/$ilustrationName.webp';
}
