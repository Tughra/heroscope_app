class BurcModel {
  String _burcAdi;
  String _burcTarihi;
  String _burcOzellikleri;
  String _kucukResim;
  String _buyukResim;


  String get burcAdi => _burcAdi;

  set burcAdi(String value) {
    _burcAdi = value;
  }


  BurcModel(this._burcAdi, this._burcTarihi, this._burcOzellikleri,
      this._kucukResim, this._buyukResim);

  String get burcTarihi => _burcTarihi;

  set burcTarihi(String value) {
    _burcTarihi = value;
  }

  String get burcOzellikleri => _burcOzellikleri;

  set burcOzellikleri(String value) {
    _burcOzellikleri = value;
  }

  String get kucukResim => _kucukResim;

  set kucukResim(String value) {
    _kucukResim = value;
  }

  String get buyukResim => _buyukResim;

  set buyukResim(String value) {
    _buyukResim = value;
  }
}
