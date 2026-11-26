/// A single actionable growth strategy shown as a checklist card.
class Strategy {
  const Strategy({
    required this.id,
    required this.title,
    required this.description,
    required this.sourceLabel,
    required this.url,
  });

  /// Stable identifier persisted to local storage. Never reuse or renumber.
  final String id;
  final String title;

  /// Exactly two sentences of ten words each.
  final String description;
  final String sourceLabel;
  final String url;
}
