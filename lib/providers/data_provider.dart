import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/idea_model.dart';
import '../services/services.dart';

final ideaDataProvider = FutureProvider<List<IdeaModel>>((ref) async {
  return ref.watch(ideaProvider).getIdeas();
});
