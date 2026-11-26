import 'package:flutter/foundation.dart';

import '../models/strategy.dart';
import '../services/progress_storage.dart';

/// Holds completion state for the checklist and keeps it persisted.
class ProgressController extends ChangeNotifier {
  ProgressController({
    required this.strategies,
    required ProgressStorage storage,
  })  : _storage = storage,
        _completed = storage.load()
          ..retainAll(strategies.map((s) => s.id));

  final List<Strategy> strategies;
  final ProgressStorage _storage;
  final Set<String> _completed;

  int get total => strategies.length;
  int get completedCount => _completed.length;
  double get fraction => total == 0 ? 0 : completedCount / total;
  int get percent => (fraction * 100).round();
  bool get isAllDone => total > 0 && completedCount == total;

  bool isCompleted(String id) => _completed.contains(id);

  void setCompleted(String id, bool value) {
    final changed = value ? _completed.add(id) : _completed.remove(id);
    if (!changed) return;
    notifyListeners();
    _storage.save(_completed);
  }

  void reset() {
    if (_completed.isEmpty) return;
    _completed.clear();
    notifyListeners();
    _storage.save(_completed);
  }
}
