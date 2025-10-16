// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_block_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ContentBlockData _$ContentBlockDataFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'heading':
          return HeadingData.fromJson(
            json
          );
                case 'text':
          return TextData.fromJson(
            json
          );
                case 'image':
          return ImageData.fromJson(
            json
          );
                case 'table':
          return TableData.fromJson(
            json
          );
                case 'list':
          return ListData.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ContentBlockData',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ContentBlockData {



  /// Serializes this ContentBlockData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentBlockData);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContentBlockData()';
}


}

/// @nodoc
class $ContentBlockDataCopyWith<$Res>  {
$ContentBlockDataCopyWith(ContentBlockData _, $Res Function(ContentBlockData) __);
}


/// Adds pattern-matching-related methods to [ContentBlockData].
extension ContentBlockDataPatterns on ContentBlockData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HeadingData value)?  heading,TResult Function( TextData value)?  text,TResult Function( ImageData value)?  image,TResult Function( TableData value)?  table,TResult Function( ListData value)?  list,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HeadingData() when heading != null:
return heading(_that);case TextData() when text != null:
return text(_that);case ImageData() when image != null:
return image(_that);case TableData() when table != null:
return table(_that);case ListData() when list != null:
return list(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HeadingData value)  heading,required TResult Function( TextData value)  text,required TResult Function( ImageData value)  image,required TResult Function( TableData value)  table,required TResult Function( ListData value)  list,}){
final _that = this;
switch (_that) {
case HeadingData():
return heading(_that);case TextData():
return text(_that);case ImageData():
return image(_that);case TableData():
return table(_that);case ListData():
return list(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HeadingData value)?  heading,TResult? Function( TextData value)?  text,TResult? Function( ImageData value)?  image,TResult? Function( TableData value)?  table,TResult? Function( ListData value)?  list,}){
final _that = this;
switch (_that) {
case HeadingData() when heading != null:
return heading(_that);case TextData() when text != null:
return text(_that);case ImageData() when image != null:
return image(_that);case TableData() when table != null:
return table(_that);case ListData() when list != null:
return list(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text,  HeadingType headingType)?  heading,TResult Function( String text)?  text,TResult Function( String url,  String? caption)?  image,TResult Function( List<List<String>> headers,  List<List<String>> rows)?  table,TResult Function( String head,  ListType listType,  List<String> items)?  list,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HeadingData() when heading != null:
return heading(_that.text,_that.headingType);case TextData() when text != null:
return text(_that.text);case ImageData() when image != null:
return image(_that.url,_that.caption);case TableData() when table != null:
return table(_that.headers,_that.rows);case ListData() when list != null:
return list(_that.head,_that.listType,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text,  HeadingType headingType)  heading,required TResult Function( String text)  text,required TResult Function( String url,  String? caption)  image,required TResult Function( List<List<String>> headers,  List<List<String>> rows)  table,required TResult Function( String head,  ListType listType,  List<String> items)  list,}) {final _that = this;
switch (_that) {
case HeadingData():
return heading(_that.text,_that.headingType);case TextData():
return text(_that.text);case ImageData():
return image(_that.url,_that.caption);case TableData():
return table(_that.headers,_that.rows);case ListData():
return list(_that.head,_that.listType,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text,  HeadingType headingType)?  heading,TResult? Function( String text)?  text,TResult? Function( String url,  String? caption)?  image,TResult? Function( List<List<String>> headers,  List<List<String>> rows)?  table,TResult? Function( String head,  ListType listType,  List<String> items)?  list,}) {final _that = this;
switch (_that) {
case HeadingData() when heading != null:
return heading(_that.text,_that.headingType);case TextData() when text != null:
return text(_that.text);case ImageData() when image != null:
return image(_that.url,_that.caption);case TableData() when table != null:
return table(_that.headers,_that.rows);case ListData() when list != null:
return list(_that.head,_that.listType,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class HeadingData implements ContentBlockData {
  const HeadingData({required this.text, required this.headingType, final  String? $type}): $type = $type ?? 'heading';
  factory HeadingData.fromJson(Map<String, dynamic> json) => _$HeadingDataFromJson(json);

 final  String text;
 final  HeadingType headingType;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeadingDataCopyWith<HeadingData> get copyWith => _$HeadingDataCopyWithImpl<HeadingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeadingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeadingData&&(identical(other.text, text) || other.text == text)&&(identical(other.headingType, headingType) || other.headingType == headingType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,headingType);

@override
String toString() {
  return 'ContentBlockData.heading(text: $text, headingType: $headingType)';
}


}

/// @nodoc
abstract mixin class $HeadingDataCopyWith<$Res> implements $ContentBlockDataCopyWith<$Res> {
  factory $HeadingDataCopyWith(HeadingData value, $Res Function(HeadingData) _then) = _$HeadingDataCopyWithImpl;
@useResult
$Res call({
 String text, HeadingType headingType
});




}
/// @nodoc
class _$HeadingDataCopyWithImpl<$Res>
    implements $HeadingDataCopyWith<$Res> {
  _$HeadingDataCopyWithImpl(this._self, this._then);

  final HeadingData _self;
  final $Res Function(HeadingData) _then;

/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,Object? headingType = null,}) {
  return _then(HeadingData(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,headingType: null == headingType ? _self.headingType : headingType // ignore: cast_nullable_to_non_nullable
as HeadingType,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TextData implements ContentBlockData {
  const TextData({required this.text, final  String? $type}): $type = $type ?? 'text';
  factory TextData.fromJson(Map<String, dynamic> json) => _$TextDataFromJson(json);

 final  String text;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextDataCopyWith<TextData> get copyWith => _$TextDataCopyWithImpl<TextData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextData&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ContentBlockData.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextDataCopyWith<$Res> implements $ContentBlockDataCopyWith<$Res> {
  factory $TextDataCopyWith(TextData value, $Res Function(TextData) _then) = _$TextDataCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextDataCopyWithImpl<$Res>
    implements $TextDataCopyWith<$Res> {
  _$TextDataCopyWithImpl(this._self, this._then);

  final TextData _self;
  final $Res Function(TextData) _then;

/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TextData(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ImageData implements ContentBlockData {
  const ImageData({required this.url, this.caption, final  String? $type}): $type = $type ?? 'image';
  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);

 final  String url;
 final  String? caption;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageDataCopyWith<ImageData> get copyWith => _$ImageDataCopyWithImpl<ImageData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageData&&(identical(other.url, url) || other.url == url)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,caption);

@override
String toString() {
  return 'ContentBlockData.image(url: $url, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $ImageDataCopyWith<$Res> implements $ContentBlockDataCopyWith<$Res> {
  factory $ImageDataCopyWith(ImageData value, $Res Function(ImageData) _then) = _$ImageDataCopyWithImpl;
@useResult
$Res call({
 String url, String? caption
});




}
/// @nodoc
class _$ImageDataCopyWithImpl<$Res>
    implements $ImageDataCopyWith<$Res> {
  _$ImageDataCopyWithImpl(this._self, this._then);

  final ImageData _self;
  final $Res Function(ImageData) _then;

/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,Object? caption = freezed,}) {
  return _then(ImageData(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TableData implements ContentBlockData {
  const TableData({required final  List<List<String>> headers, required final  List<List<String>> rows, final  String? $type}): _headers = headers,_rows = rows,$type = $type ?? 'table';
  factory TableData.fromJson(Map<String, dynamic> json) => _$TableDataFromJson(json);

 final  List<List<String>> _headers;
 List<List<String>> get headers {
  if (_headers is EqualUnmodifiableListView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_headers);
}

 final  List<List<String>> _rows;
 List<List<String>> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableDataCopyWith<TableData> get copyWith => _$TableDataCopyWithImpl<TableData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TableDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableData&&const DeepCollectionEquality().equals(other._headers, _headers)&&const DeepCollectionEquality().equals(other._rows, _rows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_headers),const DeepCollectionEquality().hash(_rows));

@override
String toString() {
  return 'ContentBlockData.table(headers: $headers, rows: $rows)';
}


}

/// @nodoc
abstract mixin class $TableDataCopyWith<$Res> implements $ContentBlockDataCopyWith<$Res> {
  factory $TableDataCopyWith(TableData value, $Res Function(TableData) _then) = _$TableDataCopyWithImpl;
@useResult
$Res call({
 List<List<String>> headers, List<List<String>> rows
});




}
/// @nodoc
class _$TableDataCopyWithImpl<$Res>
    implements $TableDataCopyWith<$Res> {
  _$TableDataCopyWithImpl(this._self, this._then);

  final TableData _self;
  final $Res Function(TableData) _then;

/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? headers = null,Object? rows = null,}) {
  return _then(TableData(
headers: null == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as List<List<String>>,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<List<String>>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ListData implements ContentBlockData {
  const ListData({required this.head, required this.listType, required final  List<String> items, final  String? $type}): _items = items,$type = $type ?? 'list';
  factory ListData.fromJson(Map<String, dynamic> json) => _$ListDataFromJson(json);

 final  String head;
 final  ListType listType;
 final  List<String> _items;
 List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDataCopyWith<ListData> get copyWith => _$ListDataCopyWithImpl<ListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListData&&(identical(other.head, head) || other.head == head)&&(identical(other.listType, listType) || other.listType == listType)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,head,listType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ContentBlockData.list(head: $head, listType: $listType, items: $items)';
}


}

/// @nodoc
abstract mixin class $ListDataCopyWith<$Res> implements $ContentBlockDataCopyWith<$Res> {
  factory $ListDataCopyWith(ListData value, $Res Function(ListData) _then) = _$ListDataCopyWithImpl;
@useResult
$Res call({
 String head, ListType listType, List<String> items
});




}
/// @nodoc
class _$ListDataCopyWithImpl<$Res>
    implements $ListDataCopyWith<$Res> {
  _$ListDataCopyWithImpl(this._self, this._then);

  final ListData _self;
  final $Res Function(ListData) _then;

/// Create a copy of ContentBlockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? head = null,Object? listType = null,Object? items = null,}) {
  return _then(ListData(
head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,listType: null == listType ? _self.listType : listType // ignore: cast_nullable_to_non_nullable
as ListType,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
