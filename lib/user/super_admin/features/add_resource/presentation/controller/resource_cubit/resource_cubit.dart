import 'package:final_project_iti/user/super_admin/features/add_resource/data/add_resource_repo.dart';
import 'package:final_project_iti/user/super_admin/features/add_resource/data/models/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'resource_state.dart';
import 'package:uuid/uuid.dart';

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
