import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class CommentsBloc {
  final _repository = Repository();
  final _commemtsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();

  //StreamGetter
  Stream<Map<int, Future<ItemModel>>> get itemWithComments =>
      _commentsOutput.stream;
  //Sink
  Function(int) get fetchItemWithComments => _commemtsFetcher.sink.add;

  CommentsBloc() {
    _commemtsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  _commentsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
        (Map<int, Future<ItemModel>> cache, int id, index) {
      print(id);
      cache[id] = _repository.fetchItem(id);
      cache[id]!.then((ItemModel item) {
        item.kids.forEach((kidId) => fetchItemWithComments(kidId));
      });
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  dispose() {
    _commemtsFetcher.close();
    _commentsOutput.close();
  }
}
