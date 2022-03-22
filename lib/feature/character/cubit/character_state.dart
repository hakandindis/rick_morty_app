part of 'character_cubit.dart';

enum PageStates { initial, waiting, failure, success }

class CharacterState extends Equatable {
  CharacterState({
    this.results = const [],
    this.pageStates = PageStates.initial,
  });

  final List<Results?> results;
  final PageStates pageStates;

  @override
  List<Object> get props => [results, pageStates];

  CharacterState copyWith({
    List<Results?>? results,
    PageStates? pageStates,
  }) {
    return CharacterState(
      results: results ?? this.results,
      pageStates: pageStates ?? this.pageStates,
    );
  }
}
