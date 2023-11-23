part of 'load_data_cubit.dart';


sealed class LoadDataState extends Equatable {

  const LoadDataState();


  @override

  List<Object> get props => [];

}


final class LoadDataInitial extends LoadDataState {}


final class LoadDataProcessing extends LoadDataState {}


final class LoadDataSuccessfull extends LoadDataState {}

