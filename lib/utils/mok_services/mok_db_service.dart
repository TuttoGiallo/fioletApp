class MokService {
  static const _defaultMokLoadDuration = Duration(seconds: 2);

  MokService._();

  ///used only for a new Service istance, non deve fare nulla perché richiamata prima della materia App!
  static MokService createForGetItRegistration() {
    return MokService._();
  }

  Future<void> loadRes({Duration duration = _defaultMokLoadDuration}) async {
    await Future.delayed(duration);
    return;
  }
}
