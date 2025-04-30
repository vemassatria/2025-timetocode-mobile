# Dokumentasi Penggunaan Komponen

Isi bagian `[]` sesuai dengan kebutuhan.

## Table of Contents

- [1. CustomButton](#1-custombutton)
- [2. LevelCard](#2-levelcard)
- [3. GameStats](#3-gamestats)
- [4. SettingItem](#4-settingitem)
- [5. MenuButton](#5-menubutton)
- [6. AnswerPopup](#6-answerpopup)
- [7. ConfirmPopup](#7-confirmpopup)
- [8. InfoPopup](#8-infopopup)
- [9. CodeBox](#9-codebox)
- [10. NarartionBox](#10-narrationbox)
- [11. ChoicesBox](#11-choicesbox)
- [12. QuestionBox](#12-questionbox)

---

<br>

## [1] CustomButton

### Template:

```dart
CustomButton(
    label: "[TEKS_BUTTON]",
    icon: Icon(Icons.[ICON]), // (opsional)
    onPressed: () {
         [ACTION]
    },
    color: ButtonColor.[WARNA], // (opsional)
    type: ButtonType.[TYPE], // (opsional)
    widthMode: ButtonWidthMode.[MODE_WIDTH], // (opsional)
    width: [WIDTH], // (Pake ini kalo mode widthnya Fixed)
    isDisabled: [TRUE / FALSE], // (opsional)
)
```

### Variant:

**color**:

- `ButtonColor.purple`
- `ButtonColor.none`
- `ButtonColor.yellow`
- `ButtonColor.blue`
- `ButtonColor.green`
- `ButtonColor.red`

**type**:

- `ButtonType.filled`
- `ButtonType.icon` (Harus ada parameter icon)
- `ButtonType.outline`
- `ButtonType.iconLable` (Harus ada parameter icon dan label)

**widthMode**:

- `ButtonWidthMode.fill`
- `ButtonWidthMode.hug`
- `ButtonWidthMode.fixed`NarrationBox(
  narrationText:
  "Ini adalah teks narasi yang akan membawamu mengikuti sebuah alur cerita panjang, penuh dengan berbagai kejadian seru dan menarik. Bacalah perlahan, karena setiap bagian dari kisah ini mengandung petualangan, tantangan, dan momen-momen tak terduga yang akan membentuk perjalanan karakter utama.",
  onTap: () {
  showPopupOverlay(
  context,
  InfoPopup(
  title: "Ini kalo diklik Narration box",
  description: "Cihuyy",
  onClose: closePopupOverlay,
  ),
  );
  },
  ),

**isDisabled**:

- `true` (Variant disabled)
- `false`

<br>

## [2] LevelCard

### Template:

```dart
LevelCard(
    image: Image.asset("[PATH_ASSET_IMAGE]"),
    title: "[JUDUL]",
    status: CardStatus.[STATUS],
    onStartPressed: () {
         [ACTION_KE_HALAMAN_CERITA]
    },
    onInfoPressed: () {
         [POP-UP_DESKRIPSI]
    },
)
```

### Variant:

**status** :

- `CardStatus.unlocked`
- `CardStatus.locked`
- `CardStatus.completed`

<br>

## [3] GameStats

### Template:

```dart
GameStats(
 correct: [JUMLAH_TEPAT],
 retry: [JUMLAH_ULANG_MATERI],
 wrong: [JUMLAH_SALAH],
 total: [JUMLAH_TOTAL],
)
```

<br>

## [4] SettingItem

### Template:

```dart
SettingItem(
 icon: Icon(Icons.[ICON]),
 label: "[LABEL]",
 value: [VALUE],
 onChanged: (bool newValue) {
   [ACTION];
 },
)
```

<br>

## [5] MenuButton

### Template:

```dart
MenuButton(
 onRestart: () {
   [ACTION_MULAI_ULANG];
 },
 onExit: () {
   [ACTION_KELUAR];
 },
)
```

<br>

## [6] AnswerPopup

### Template:

```dart
showPopupOverlay(
 context,
 AnswerPopup(
   isCorrect: [TRUE/FALSE],
   onPressed: () {
     [ACTION];
   },
 )
)
```

### Variant:

**isCorrect**:

- `true` (Variant Benar)
- `false` (Variant Salah)

<br>

## [7] ConfirmPopup

### Template:

```dart
showPopupOverlay(
 context,
 ConfirmPopup(
   title: "[JUDUL]",
   description: "[DESKRIPSI]",
   confirmLabel: "[LABEL_BUTTON_FILLED]",
   onPrimaryButtonPressed: () {
     [ACTION_BUTTON_FILLED];
   },
   onGoBack: () {
     goBackToPreviousOverlay(context);
   },
 )
)
```

<br>

## [8] InfoPopup

### Template:

```dart
showPopupOverlay(
 context,
 InfoPopup(
   title: "[JUDUL]",
   description: "[DESKRIPSI]",
   onClose: () {
     closePopupOverlay();
   },
 )
)
```

<br>

## [9] CodeBox

### Template:

```dart
CodeBox(
  code: '''
[CODE]
'''
)
```

<br>

## [10] NarrationBox

### Template:

```dart
NarrationBox(
  narrationText:
      "[TEKS]",
  onTap: () {
    [ACTION]
  },
)
```

<br>

## [11] ChoicesBox

### Template:

```dart
ChoicesBox(
  correctAnswerIndex: [SALAH SATU DARI INDEX 0 - 3],
  choices: ['[INDEX 0]', '[INDEX 1]', '[INDEX 2]', '[INDEX 3]'], // JUMLAHNYA BOLEH 2, 3, 4
  onCorrect: () {
    [ACTION BENAR]
  },
  onWrong: () {
    [ACTION SALAH]
  },
)
```

<br>

## [12] QuestionBox

### Template:

```dart
QuestionBox(questionText: "[PERTANYAAN]")
```
