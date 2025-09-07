import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/presentation/widgets/drop_zone_target.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class CodeText extends ConsumerWidget {
  final String data;
  final bool isDragAndDrop;

  const CodeText({required this.data, this.isDragAndDrop = false, super.key});

  static final _baseStyle = TextStyle(
    fontFamily: 'Fira Code',
    fontSize: 12.sp,
    color: AppColors.gray1,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static final _dragAndDropStyle = TextStyle(
    fontFamily: 'Fira Code',
    fontSize: 16.sp,
    color: AppColors.gray1,
    letterSpacing: 0.5,
    height: 2,
  );

  static const _keywordStyle = TextStyle(color: Color(0xFF569CD6));
  static const _typeStyle = TextStyle(color: Color(0xFF4EC9B0));
  static const _variableStyle = TextStyle(color: Color(0xFF9CDCFE));
  static final _functionStyle = _baseStyle;
  static final _functionDragAndDropStyle = _dragAndDropStyle;
  static const _stringStyle = TextStyle(color: Color(0xFFCE9178));
  static const _numberStyle = TextStyle(color: Color(0xFFB5CEA8));
  static const _controlFlowStyle = TextStyle(color: Color(0xFFC586C0));
  static const _commentStyle = TextStyle(color: Color(0xFF6A9955));

  static const _keywords = {
    'void',
    'final',
    'true',
    'false',
    'null',
    'const',
    'var',
    'late',
    'static',
    'super',
    'this',
  };

  static const _types = {
    'int',
    'double',
    'String',
    'bool',
    'Map',
    'List',
    'Set',
    'Future',
    'Stream',
    'dynamic',
    'Object',
    'Widget',
  };

  static const _controlFlow = {
    'if',
    'else',
    'for',
    'while',
    'do',
    'switch',
    'case',
    'try',
    'catch',
    'finally',
    'return',
    'continue',
    'break',
    'throw',
    'assert',
    'await',
    'async',
    'yield',
    '#include',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        style: isDragAndDrop ? _dragAndDropStyle : _baseStyle,
        children: _parseText(data, ref),
      ),
      softWrap: false,
      overflow: TextOverflow.clip,
    );
  }

  List<InlineSpan> _parseText(String source, WidgetRef ref) {
    final spans = <InlineSpan>[];
    final lines = source.split('\n');
    bool inVariableDeclaration = false;
    bool expectingVariableAfterComma = false;
    final definedVariables = <String>{};
    final definedFunctions = <String>{};

    for (int lineIndex = 0; lineIndex < lines.length; lineIndex++) {
      String line = lines[lineIndex];
      int position = 0;
      inVariableDeclaration = false;
      expectingVariableAfterComma = false;

      while (position < line.length) {
        if (isDragAndDrop) {
          final RegExp codeIdDND = RegExp(r'\[([a-z0-9]{3})\]');
          final Match? match = codeIdDND.matchAsPrefix(line, position);

          if (match != null) {
            final String zoneId = match.group(1)!;
            spans.add(
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                baseline: TextBaseline.alphabetic,
                child: DropZoneTargetWidget(zoneId: zoneId),
              ),
            );
            position = match.end;
            continue;
          }
        }

        if (position + 1 < line.length &&
            line[position] == '/' &&
            line[position + 1] == '/') {
          final comment = line.substring(position);
          spans.add(
            TextSpan(
              text: comment,
              style: isDragAndDrop
                  ? _dragAndDropStyle.merge(_commentStyle)
                  : _baseStyle.merge(_commentStyle),
            ),
          );
          break;
        }

        if (position < line.length &&
            (line[position] == '"' || line[position] == "'")) {
          int endQuote = _findClosingQuote(line, position, line[position]);
          final stringText = line.substring(position, endQuote + 1);
          spans.add(
            TextSpan(
              text: stringText,
              style: isDragAndDrop
                  ? _dragAndDropStyle.merge(_stringStyle)
                  : _baseStyle.merge(_stringStyle),
            ),
          );
          position = endQuote + 1;
          continue;
        }

        if (position < line.length &&
            line[position] == ',' &&
            inVariableDeclaration) {
          spans.add(const TextSpan(text: ','));
          position++;
          expectingVariableAfterComma = true;
          continue;
        }

        if (position < line.length && line[position] == ';') {
          spans.add(const TextSpan(text: ';'));
          position++;
          inVariableDeclaration = false;
          expectingVariableAfterComma = false;
          continue;
        }

        if (position < line.length && isDigit(line[position])) {
          int end = position + 1;
          bool hasDecimal = false;
          while (end < line.length) {
            if (isDigit(line[end])) {
              end++;
            } else if (!hasDecimal && line[end] == '.') {
              hasDecimal = true;
              end++;
            } else {
              break;
            }
          }
          final number = line.substring(position, end);
          spans.add(
            TextSpan(
              text: number,
              style: isDragAndDrop
                  ? _dragAndDropStyle.merge(_numberStyle)
                  : _baseStyle.merge(_numberStyle),
            ),
          );
          position = end;
          continue;
        }

        if (position < line.length && isIdentifierStart(line[position])) {
          int end = position + 1;
          while (end < line.length && isIdentifierPart(line[end])) {
            end++;
          }

          final word = line.substring(position, end);
          TextStyle? style;
          bool isFunction = false;

          if (end < line.length && line[end] == '(') {
            isFunction = true;
            if (inVariableDeclaration) {
              definedFunctions.add(word);
              inVariableDeclaration = false;
            }
          }

          if (_keywords.contains(word)) {
            style = _keywordStyle;
            expectingVariableAfterComma = false;
          } else if (_types.contains(word)) {
            style = _typeStyle;
            inVariableDeclaration = true;
            expectingVariableAfterComma = false;
          } else if (_controlFlow.contains(word)) {
            style = _controlFlowStyle;
            expectingVariableAfterComma = false;
          } else if (isFunction) {
            style = isDragAndDrop ? _functionDragAndDropStyle : _functionStyle;
            expectingVariableAfterComma = false;
          } else if (inVariableDeclaration || expectingVariableAfterComma) {
            style = _variableStyle;
            definedVariables.add(word);
            expectingVariableAfterComma = false;
          } else if (definedVariables.contains(word)) {
            style = _variableStyle;
          } else if (definedFunctions.contains(word)) {
            style = isDragAndDrop ? _functionDragAndDropStyle : _functionStyle;
          }

          spans.add(
            TextSpan(
              text: word,
              style: style != null
                  ? isDragAndDrop
                        ? _dragAndDropStyle.merge(style)
                        : _baseStyle.merge(style)
                  : isDragAndDrop
                  ? _dragAndDropStyle
                  : _baseStyle,
            ),
          );
          position = end;
          continue;
        }

        spans.add(TextSpan(text: line[position]));
        position++;
      }

      if (lineIndex < lines.length - 1) {
        spans.add(const TextSpan(text: '\n'));
      }
    }
    return spans;
  }

  int _findClosingQuote(String text, int startPos, String quoteChar) {
    int pos = startPos + 1;
    while (pos < text.length) {
      if (text[pos] == '\\') {
        pos += 2;
      } else if (text[pos] == quoteChar) {
        return pos;
      } else {
        pos++;
      }
    }
    return text.length - 1;
  }

  bool isDigit(String char) {
    return char.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
        char.codeUnitAt(0) <= '9'.codeUnitAt(0);
  }

  bool isAlpha(String char) {
    return (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
            char.codeUnitAt(0) <= 'z'.codeUnitAt(0)) ||
        (char.codeUnitAt(0) >= 'A'.codeUnitAt(0) &&
            char.codeUnitAt(0) <= 'Z'.codeUnitAt(0));
  }

  bool isIdentifierStart(String char) {
    return isAlpha(char) || char == '_' || char == '#';
  }

  bool isIdentifierPart(String char) {
    return isAlpha(char) || isDigit(char) || char == '_' || char == '#';
  }
}
