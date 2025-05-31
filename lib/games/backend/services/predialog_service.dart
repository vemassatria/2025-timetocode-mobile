import 'package:timetocode/games/backend/models/level_model.dart';
import 'package:timetocode/games/backend/models/predialog_model.dart';

class PredialogService {
  PreDialogModel getPredialogById(LevelModel level, String predialogId) {
    return level.preDialog!.firstWhere(
      (predialog) => predialog.id == predialogId,
    );
  }
}
