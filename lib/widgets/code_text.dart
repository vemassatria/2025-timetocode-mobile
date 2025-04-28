import 'package:flutter/material.dart';

class CodeText extends StatelessWidget {
  final String data;

  const CodeText(this.data, {super.key});

  static final _baseStyle = TextStyle(
    fontFamily: 'Fira Code',
    fontSize: 12,
    color: const Color(0xFFDCDCAA),
    letterSpacing: 0.5,
    height: 1.5,
  );

  static final _keywordStyle = TextStyle(color: Color(0xFF569CD6));
  static final _typeStyle = TextStyle(color: Color(0xFF4EC9B0));
  static final _variableStyle = TextStyle(color: Color(0xFF9CDCFE));
  static final _stringStyle = TextStyle(color: Color(0xFFCE9178));
  static final _numberStyle = TextStyle(color: Color(0xFFB5CEA8));
  static final _controlFlowStyle = TextStyle(color: Color(0xFFC586C0));
  static final _commentStyle = TextStyle(color: Color(0xFF6A9955));

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
  };

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: _baseStyle, children: _parseText(data)),
    );
  }

  List<TextSpan> _parseText(String source) {
    final spans = <TextSpan>[];
    final lines = source.split('\n');
    bool inVariableDeclaration = false;
    final definedVariables = <String>{};

    for (int lineIndex = 0; lineIndex < lines.length; lineIndex++) {
      String line = lines[lineIndex];
      int position = 0;
      inVariableDeclaration = false;

      while (position < line.length) {
        if (position + 1 < line.length &&
            line[position] == '/' &&
            line[position + 1] == '/') {
          final comment = line.substring(position);
          spans.add(
            TextSpan(text: comment, style: _baseStyle.merge(_commentStyle)),
          );
          position = line.length;
          continue;
        }

        if (position < line.length && line[position] == '"') {
          int endQuote = _findClosingQuote(line, position, '"');
          final stringText = line.substring(position, endQuote + 1);
          spans.add(
            TextSpan(text: stringText, style: _baseStyle.merge(_stringStyle)),
          );
          position = endQuote + 1;
          continue;
        }

        if (position < line.length && line[position] == "'") {
          int endQuote = _findClosingQuote(line, position, "'");
          final stringText = line.substring(position, endQuote + 1);
          spans.add(
            TextSpan(text: stringText, style: _baseStyle.merge(_stringStyle)),
          );
          position = endQuote + 1;
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
            TextSpan(text: number, style: _baseStyle.merge(_numberStyle)),
          );
          position = end;
          continue;
        }

        if (position < line.length && isAlpha(line[position])) {
          int end = position + 1;

          while (end < line.length &&
              (isAlpha(line[end]) || isDigit(line[end]) || line[end] == '_')) {
            end++;
          }

          final word = line.substring(position, end);
          TextStyle? style;

          if (_keywords.contains(word)) {
            style = _keywordStyle;
          } else if (_types.contains(word)) {
            style = _typeStyle;
            inVariableDeclaration = true;
          } else if (_controlFlow.contains(word)) {
            style = _controlFlowStyle;
          } else if (inVariableDeclaration) {
            style = _variableStyle;
            definedVariables.add(word);
            inVariableDeclaration = false;
          } else if (definedVariables.contains(word)) {
            style = _variableStyle;
          }

          spans.add(
            TextSpan(
              text: word,
              style: style != null ? _baseStyle.merge(style) : _baseStyle,
            ),
          );
          position = end;
          continue;
        }

        spans.add(TextSpan(text: line[position].toString()));
        position++;
      }

      if (lineIndex < lines.length - 1) {
        spans.add(TextSpan(text: '\n'));
      }
    }

    return spans;
  }

  int _findClosingQuote(String text, int startPos, String quoteChar) {
    int pos = startPos + 1;
    while (pos < text.length) {
      if (text[pos] == '\\') {
        pos += 2;
        continue;
      }

      if (text[pos] == quoteChar) {
        return pos;
      }
      pos++;
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
            char.codeUnitAt(0) <= 'Z'.codeUnitAt(0)) ||
        char == '_';
  }
}
