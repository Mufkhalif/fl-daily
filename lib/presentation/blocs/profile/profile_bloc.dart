import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:klikdaily/domain/models/profile.dart';
import 'package:klikdaily/domain/repositories/fruit_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FruitRepository repository;

  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<FetchingProfile>((event, emit) async {
      emit(ProfileLoading());

      final result = await repository.getProfile();

      result.fold(
        (failure) => emit(ProfileError(failure.message)),
        (result) => emit(ProfileHasData(result)),
      );
    });
  }
}
