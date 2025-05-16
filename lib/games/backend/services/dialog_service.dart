import 'package:timetocode/games/backend/models/dialog_model.dart';
import 'package:timetocode/games/backend/models/level_model.dart';

class DialogService {
  DialogModel getDialogById(LevelModel level, String dialogId) {
    return level.dialogs.firstWhere((dialog) => dialog.id == dialogId);
  }
}
