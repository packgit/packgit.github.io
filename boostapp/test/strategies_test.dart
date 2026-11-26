import 'package:boostapp/data/strategies.dart';
import 'package:flutter_test/flutter_test.dart';

int _words(String s) => s.trim().split(RegExp(r'\s+')).length;

void main() {
  test('has 30 unique strategies with https links', () {
    expect(strategies.length, 30);
    expect(strategies.map((s) => s.id).toSet().length, 30);
    expect(strategies.map((s) => s.title).toSet().length, 30);
    for (final s in strategies) {
      expect(Uri.parse(s.url).scheme, 'https', reason: s.id);
    }
  });

  test('every description is two sentences of exactly ten words', () {
    for (final s in strategies) {
      final sentences = RegExp(r'[^.!?]+[.!?]')
          .allMatches(s.description)
          .map((m) => m.group(0)!.trim())
          .toList();
      expect(sentences.length, 2, reason: '${s.id}: ${s.description}');
      expect(sentences.join(' '), s.description, reason: s.id);
      for (final sentence in sentences) {
        expect(_words(sentence), 10, reason: '${s.id}: $sentence');
      }
    }
  });
}
