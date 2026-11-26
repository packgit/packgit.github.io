/// A single actionable growth strategy shown as a checklist card.
class Strategy {
  const Strategy({
    required this.id,
    required this.title,
    required this.description,
    required this.effort,
    required this.sourceLabel,
    required this.url,
  });

  /// Stable identifier persisted to local storage. Never reuse or renumber.
  final String id;
  final String title;

  /// Exactly two sentences of ten words each.
  final String description;

  /// Relative implementation effort from 1 (easiest) to 10 (hardest).
  final int effort;
  final String sourceLabel;
  final String url;
}
