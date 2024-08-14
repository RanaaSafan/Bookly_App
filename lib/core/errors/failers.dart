abstract class Failers{
  final String error;

  Failers({required this.error});

}

class ErrorService extends Failers{
  ErrorService({required super.error});

}