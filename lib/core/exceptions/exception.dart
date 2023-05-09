import 'package:equatable/equatable.dart';

class BaseException extends Equatable implements Exception {
  final String? errorMessage;

  ///(optional) Function Name where it is called
  final String? functionKey;
  final dynamic causedby;
  final StackTrace? stackTrace;
  const BaseException({
    this.errorMessage,
    this.causedby,
    this.stackTrace,
    this.functionKey,
  });

  @override
  String toString() {
    return '\n ${super.toString()}: [message]: $functionKey $errorMessage \n [caused by]: ${causedby.toString()}';
  }

  @override
  List<Object?> get props => [
        functionKey,
        stackTrace,
        errorMessage,
        causedby,
      ];
}

///Exceptions regarding APIs
class ApiException extends BaseException {
  ///[functionKey] Function Name where it is called

  const ApiException({
    String? errorMessage,
    dynamic causedby,
    StackTrace? stackTrace,
    String? functionKey,
  }) : super(
          causedby: causedby,
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          functionKey: functionKey,
        );

  @override
  String toString() {
    return 'ApiException ${super.toString()}';
  }
}

///Exceptions regarding Repos
class RepoException extends BaseException {
  ///[functionKey] Function Name where it is called

  const RepoException({
    String? errorMessage,
    dynamic causedby,
    StackTrace? stackTrace,
    String? functionKey,
  }) : super(
          causedby: causedby,
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          functionKey: functionKey,
        );

  @override
  String toString() {
    return 'RepoException ${super.toString()}';
  }
}

///Unexpected Exceptions
class UnAuthorizedException extends ApiException {
  ///[functionKey] Function Name where it is called

  const UnAuthorizedException({
    String? errorMessage,
    dynamic causedby,
    StackTrace? stackTrace,
    String? functionKey,
  }) : super(
          causedby: causedby,
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          functionKey: functionKey,
        );

  @override
  String toString() {
    return 'UnAuthorizedException ${super.toString()}';
  }
}
