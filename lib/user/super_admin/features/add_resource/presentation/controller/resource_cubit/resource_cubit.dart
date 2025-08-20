import 'package:final_project_iti/core/routing/route_export.dart';

class ResourceCubit extends Cubit<ResourceState> {
  final AddResourceRepo repo;

  ResourceCubit(this.repo) : super(ResourceInitial());

  Future<void> addResource({
    required String title,
    required String description,
    required String type,
    required String url,
  }) async {
    emit(ResourceLoading());
    try {
      final resource = ResourceModel(
        id: const Uuid().v4(),
        title: title,
        description: description,
        type: type,
        url: url,
        createdAt: DateTime.now(),
      );

      await repo.addResource(resource);
      emit(ResourceSuccess());
    } catch (e) {
      emit(ResourceFailure(e.toString()));
    }
  }
}
