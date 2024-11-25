
import '../model/Dienthoai.dart';
class HoaDon {
  String _mahd;
  DateTime _ngayban;
  String _sdtkh;
  int _slmua;
  double _giabantt;
  String _tenkh;
 
Dienthoai _dienthoaiban;
  HoaDon(this._mahd, this._ngayban, this._dienthoaiban, this._slmua, this._giabantt, this._tenkh, this._sdtkh);

  String get mahd => _mahd;
  set mahd(String mahd) {
    if (mahd.isNotEmpty && mahd.startsWith("HD-")) {
      _mahd = mahd;
    } else {
      throw ArgumentError('Mã hóa đơn không hợp lệ.');
    }
  }

  DateTime get ngayban => _ngayban;
  set ngayban(DateTime ngayban) {
    if (ngayban.isBefore(DateTime.now())) {
      _ngayban = ngayban;
    } else {
      throw ArgumentError('Ngày bán không thể là ngày tương lai.');
    }
  }

  int get slmua => _slmua;
  set slmua(int slmua) {
    if (slmua > 0 && slmua <= _dienthoaiban.sltk) {
      _slmua = slmua;
    } else {
      throw ArgumentError('Số lượng mua phải lớn hơn 0 và không vượt quá số lượng tồn kho.');
    }
  }

  double get giabantt => _giabantt;
  set giabantt(double giabantt) {
    if (giabantt > 0) {
      _giabantt = giabantt;
    } else {
      throw ArgumentError('Giá bán thực tế phải lớn hơn 0.');
    }
  }

  String get tenkh => _tenkh;
  set tenkh(String tenkh) {
    if (tenkh.isNotEmpty) {
      _tenkh = tenkh;
    } else {
      throw ArgumentError('Tên khách hàng không được để trống.');
    }
  }

  String get sdtkh => _sdtkh;
  set sdtkh(String sdtkh) {
    // Kiểm tra định dạng số điện thoại, ví dụ: 10 chữ số
    if (RegExp(r'^[0-9]{10}$').hasMatch(sdtkh)) {
      _sdtkh = sdtkh;
    } else {
      throw ArgumentError('Số điện thoại khách hàng không hợp lệ.');
    }
  }

  double tinhTongTien() {
    return _slmua * _giabantt;
  }

  double tinhLoiNhuanThucTe() {
    return (_giabantt - _dienthoaiban.gianhap) * _slmua;
  }

  void hienThongTin() {
    print('Thông tin hóa đơn:');
    print('Mã hóa đơn: $_mahd');
    print('Ngày bán: $_ngayban');
    print('Điện thoại bán:');
    _dienthoaiban.hienthithongtin();
    print('Số lượng mua: $_slmua');
    print('Giá bán thực tế: $_giabantt');
    print('Tên khách hàng: $_tenkh');
    print('Số điện thoại khách hàng: $_sdtkh');
  }
   double layGiaNhapDienThoai() {
    return _dienthoaiban.gianhap;
  }
 @override
String toString() {
    return "Mã hd: $_mahd, ngayban: $_ngayban, sdtkh: $_sdtkh, loluongmua: $_slmua, Giá bán thucte: $_giabantt, tenkh: $_tenkh";
}

}