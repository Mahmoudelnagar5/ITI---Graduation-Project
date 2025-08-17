import '../../../../../../../core/routing/route_export.dart';
import '../../../data/add_item_repo/add_item_repo.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(AddItemInitial());

  static AddItemCubit of(context) => BlocProvider.of(context);

  // Controllers for text fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // List to store curriculum items
  List<String> curriculumItems = [];

  // Add new curriculum item
  void addCurriculumItem(String item) {
    if (item.trim().isNotEmpty) {
      curriculumItems.add(item.trim());
      emit(AddItemCurriculumItemsUpdated(curriculumItems));
    }
  }

  // Remove curriculum item
  void removeCurriculumItem(int index) {
    if (index >= 0 && index < curriculumItems.length) {
      curriculumItems.removeAt(index);
      emit(AddItemCurriculumItemsUpdated(curriculumItems));
    }
  }

  // Clear all data
  void clearData() {
    titleController.clear();
    descriptionController.clear();
    curriculumItems.clear();
    emit(AddItemInitial());
  }

  Future<void> addItem(String collectionName) async {
    try {
      emit(AddItemLoading());

      // Validate inputs
      if (titleController.text.trim().isEmpty) {
        emit(AddItemFailure('Title is required'));
        return;
      }

      if (descriptionController.text.trim().isEmpty) {
        emit(AddItemFailure('Description is required'));
        return;
      }

      if (curriculumItems.isEmpty) {
        emit(AddItemFailure('At least one curriculum item is required'));
        return;
      }

      await AddItemRepoImpl().addItem(
        collectionName: collectionName,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        contents: curriculumItems,
      );

      emit(AddItemSuccess());
      clearData(); // Clear form after successful save
    } catch (e) {
      emit(AddItemFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
