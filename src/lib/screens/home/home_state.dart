
import 'package:equatable/equatable.dart';

// Base class for HomeState
abstract class HomeState extends Equatable {
	const HomeState();

	@override
	List<Object> get props => [];
}

// Initial state for Home
class HomeInitial extends HomeState {
	const HomeInitial();
}

// Loading state for Home
class HomeLoading extends HomeState {
	const HomeLoading();
}

// Loaded state for Home with data
class HomeLoaded extends HomeState {
	final String data;

	const HomeLoaded(this.data);

	@override
	List<Object> get props => [data];
}

// Error state for Home with error message
class HomeError extends HomeState {
	final String errorMessage;

	const HomeError(this.errorMessage);

	@override
	List<Object> get props => [errorMessage];
}
