import 'package:mobx/mobx.dart';

part 'store.g.dart';

class MyStore = StoreBase with _$MyStore;

abstract class StoreBase with Store {
  @observable
  Map<String, dynamic> item = {
    'list': [],
    'obj': {},
    'filter': [],
    'sort': [],
  };

  @action
  void change({field, value}) {
    item = {
      ...item,
      'obj': {...item['obj'], field: value}
    };
  }
}
