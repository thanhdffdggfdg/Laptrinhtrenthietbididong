
class Dienthoai {
  String _madt;
  String _tendt;
  String _hangx;
  double _gianhap;
  double _giaban;
  int _sltk;
  bool _trangthai;
  Dienthoai(this._madt, this._tendt, this._hangx, this._giaban, this._gianhap, this._sltk, this._trangthai);

  String get madt => _madt;
  String get tendt => _tendt;
  String get hangx => _hangx;
  double get gianhap => _gianhap;
  double get giaban => _giaban;
  int get sltk => _sltk;
  bool get trangthai => _trangthai;

set madt(String madt) {
    if (madt.isNotEmpty) {
      _madt = madt;
    }
  }
  set tendt(String tendt) {
    if (tendt.isNotEmpty) {
      _tendt = tendt;
    }
  }
  set hangx(String hangx) {
    if (hangx.isNotEmpty) {
      _hangx = hangx;
    }
  }
  set gianhap(double gianhap) {
    if (gianhap>=0 ) {
      _gianhap = gianhap;
    }
  }
  set giaban(double giaban) {
    if (giaban>=0 && giaban > _gianhap) {
      _giaban = giaban;
    }
  }
  set sltk(int sltk) {
    if (sltk>=0) {
      _sltk = sltk;
    }
  }
  double loinhuan() {
    return (_giaban - _gianhap) * _sltk;
  }
  bool ban() {
    return _trangthai && _sltk > 0;
  }
  void hienthithongtin(){
    print('Mã điện thoại: $_madt');
    print('Tên điện thoại: $_tendt');
    print('hang: $_hangx');
     print('gianhap: $_gianhap');
    print('giaban $_giaban');
     print('soluong: $_sltk');
     print('Trạng thái: ${_trangthai ? 'kinh doanh' : 'ko kinh doanh'}');
  }
@override
String toString() {
  return "Mã sản phẩm: $madt, Tên sản phẩm: $tendt, Thương hiệu: $hangx, Giá nhập: $gianhap, Giá bán: $giaban, Số lượng: $sltk, trangthai: $trangthai";
}

}