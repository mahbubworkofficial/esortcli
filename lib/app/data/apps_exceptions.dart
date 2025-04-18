class AppsExceptions implements Exception {
  final _message;
  final _prefix;
  AppsExceptions([this._message, this._prefix]);
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppsExceptions {
  InternetException([String? message])
      : super(message, 'No Internet');
}

class NetworkException extends AppsExceptions {
  NetworkException([String? message])
      : super(message, 'Network Exception');
}

class ServerException extends AppsExceptions {
  ServerException([String? message])
      : super(message, 'Server Exception');
}

class CacheException extends AppsExceptions {
  CacheException([String? message])
      : super(message, 'Cache Exception');
}

class FetchDataException extends AppsExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class UnauthorisedException extends AppsExceptions {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised');
}

class RequestTimeOut extends AppsExceptions {
  RequestTimeOut([String? message])
      : super(message, 'Request Time Out');
}

class InvalidUrlException extends AppsExceptions {
  InvalidUrlException([String? message])
      : super(message, 'Invalid Url');
}
class TimeoutException extends AppsExceptions {
  TimeoutException([String? message])
      : super(message, 'Time Out');
}