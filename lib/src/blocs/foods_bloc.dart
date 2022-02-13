import '../models/search_item.dart';
import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class FoodsBloc {
  final _repository = Repository();
  final _foodsFetcher = PublishSubject<SearchItem>();

  Stream<SearchItem> get searchFoods => _foodsFetcher.stream;

  Future fetchSearchItem(String body) async {
    print(body);
    SearchItem x=SearchItem(totalHits: 0, currentPage: 0, totalPages: 0, foods: []);
    //_foodsFetcher.sink.add(x);
    //_foodsFetcher.sink.add(null);
    print('GGGGG');
    SearchItem searchFoods = await _repository.fetchSearchItem(body);
    print('HIII GAJA');
    print(searchFoods.toJson());
    _foodsFetcher.sink.add(searchFoods);
  }

  dispose() {
    _foodsFetcher.close();
  }
}

final foodsBloc = FoodsBloc();
