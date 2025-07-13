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
- [13. QuestionBox](#13-dialogbox)
- [14. IllustrationBox](#14-illustrationbox)

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

<br>

## [13] DialogBox

### Template:

```dart
DialogBox(
  dialogText:
      "[TEKS PERCAKAPAN]",
  onTap: () {
    [ACTION NEXT]
  },
  characterName: '[NAMA]',
  nameBoxColor: [WARNA NAMA],
  ),
```

<br>

## [14] IllustrationBox

### Template:

```dart
IllustrationBox(image: AssetImage('[PATH KE ASSET ILUSTRASI]')),
```


# Dokumentasi Backend

## Table of Contents

- [1. BGM](#1-bgm)
- [2. Sound Effect](#2-sound-effect)

---

<br>

## [1] BGM
lokasi: lib/games/backend/service

keterangan: bgm yang dimiliki sekarang memiliki pemanggilan global dengan inisasi dan membiarkannya hidup sepanjang aplikasi menggunakan manajemen state riverpod & inisasi di **`main.dart`**. Dengan cara kerja di mana 1 instance player akan dibuat, dan jika diibaratkan dengan pemutaran film dengan cd,itu instance player sebagai si dvd player dan musik yang akan dimainkan adalah cd.

**cara melihat state bgm(user aktifkan suara apa gak):**
```dart
ref.read(musicServiceProvider); // gunakan watch jika ingin selalu mengawasi dan read untuk ambil nilai sekali.
```

**cara memanggil method bgm:**
```dart
ref.read(musicServiceProvider.notifier).namaMethodnya();
// ----------------------
// atau kalau mau nyimpan
// -----------------------
final bgmService = ref.read(musicServiceProvider.notifier);
bgmService.namaMethodnya();
```

**cara nambahin & memutar lagu:**
```dart
Future<void> fungsiBaru () async {
    await _play(parameter); // intinya di sini, pastikan parameter berakhir .ogg
}
```

**tips :** gunakan ogg untuk bgm karena ukuran lebih kecil dan kualitasnya lumayan bagus.

## [2] Sound Effect
lokasi: lib/games/backend/service

keterangan: sfx yang dimiliki sekarang juga memiliki pemanggilan global dengan inisasi dan membiarkannya hidup sepanjang aplikasi menggunakan manajemen state riverpod & inisasi di **`main.dart`**. Melakukan **caching** pada semua audio yang digunakannya. terdapat 2 cara yang dilakukan untuk melakukan caching dan efisien yang telah dilakukan, dengan cara kerja sebagai berikut:
- cara 1, menggunakan `FlameAudio.createPool();` IDEALNYA:
  cara ini menggunakan konsep **Fire and Forget**, di mana memulai sebuah proses dan tidak menunggu hasilnya atau peduli dengan kapan proses itu selesai. Dengan menggunakan createPool, otomatis file juga akan mencaching dan nahkan telah menyiapkan **audio player** siap pakai untuk diputar dengan ketentuan:
  - parameter `minPlayers`: berfungsi untuk menyiapkan minimal instance audio player yang siap pakai untuk diputar.
  - parameter `maxPlayers`: berfungsi untuk menambahkan total instance audio player akan dipakai ketika audio diputar terus menerus(jadi misal dipanggil secara hampir bersamaan 10 kali, dan maxPlayers adalah 6, maka hanya 6 yang akan di putar dan 4 sisanya tidak dipedulikan.

  **cara melihat state sound effect(user aktifkan suara apa gak):**
  ```dart
  ref.read(soundEffectServiceProvider); // gunakan watch jika ingin selalu mengawasi dan read untuk ambil nilai sekali.
  ```
    
  **cara memanggil method sound effect:**
  ```dart
  ref.read(soundEffectServiceProvider.notifier).namaMethodnya();
  // ----------------------
  // atau kalau mau nyimpan
  // -----------------------
  final sfxService = ref.read(soundEffectServiceProvider.notifier);
  sfxService.namaMethodnya();
  ```

  **cara nambahin sound effect:**
  buat variabel baru dengan: `late AudioPool _namaSFX`;

  lakukan di initialized
  ```dart
  late AudioPool _namaSFX= await FlameAudio.createPool(
      'tempat_sfxnya.wav',
      minPlayers: int,
      maxPlayers: int,
  );
  ```
  tips: wajib menggunakan wav soalnya kata ai🤓:  File WAV pada dasarnya adalah aliran data audio mentah. CPU tinggal membaca data digital tersebut dan langsung mengirimkannya ke kartu suara untuk diubah menjadi suara. Tidak ada proses dekompresi atau "penerjemahan" yang rumit.

  **cara memutar sound effect:**
  ```dart
  _namaSFX.start()
  // pastikan kalian buat method dulu untuk mempermudah pemanggilan
  ```

- cara 2, KHUSUS typing:
  cara ini menggunakan konsep cancellation token yang memiliki reliabilitas tinggi. hal tersebut karena dia akan secara cerdas menghindari race condition ketika method playing terus menerus dipanggil(karena textnya di skip) karena ketika tombol skip ditekan, token ini membatalkan atau mengabaikan semua operasi play yang sudah "ditembakkan" sebelumnya tetapi belum selesai (masih dalam proses await).
