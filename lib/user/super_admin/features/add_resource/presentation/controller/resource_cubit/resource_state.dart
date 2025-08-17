abstract class ResourceState {}

class ResourceInitial extends ResourceState {}

class ResourceLoading extends ResourceState {}

class ResourceSuccess extends ResourceState {}

class ResourceFailure extends ResourceState {
  final String error;
  ResourceFailure(this.error);
}
