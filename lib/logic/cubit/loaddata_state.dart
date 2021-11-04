// ignore_for_file: must_be_immutable

part of 'loaddata_cubit.dart';

@immutable
abstract class LoaddataState {}

class LoaddataInitial extends LoaddataState {}

class LoaddataLoaded extends LoaddataState {
}

class LoaddataError extends LoaddataState {}
