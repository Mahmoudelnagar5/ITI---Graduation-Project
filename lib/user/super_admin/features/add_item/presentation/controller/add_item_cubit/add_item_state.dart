part of 'add_item_cubit.dart';

@immutable
sealed class AddItemState {}

class AddItemInitial extends AddItemState {}

class AddItemLoading extends AddItemState {}

class AddItemSuccess extends AddItemState {}

class AddItemFailure extends AddItemState {
  final String error;
  AddItemFailure(this.error);
}

class AddItemCurriculumItemsUpdated extends AddItemState {
  final List<String> items;
  AddItemCurriculumItemsUpdated(this.items);
}
