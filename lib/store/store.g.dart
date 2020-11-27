// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyStore on StoreBase, Store {
  final _$itemAtom = Atom(name: 'StoreBase.item');

  @override
  Map<String, dynamic> get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(Map<String, dynamic> value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  final _$StoreBaseActionController = ActionController(name: 'StoreBase');

  @override
  void change({dynamic field, dynamic value}) {
    final _$actionInfo =
        _$StoreBaseActionController.startAction(name: 'StoreBase.change');
    try {
      return super.change(field: field, value: value);
    } finally {
      _$StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
item: ${item}
    ''';
  }
}
