
import '../model/hoadon.dart';
import '../model/Dienthoai.dart';

class CuaHang {
  String _tench;
  String _diachi;
  List<Dienthoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];
  Dienthoai _dienthoaiban;

  CuaHang(this._tench, this._diachi, this._dienthoaiban){
      _danhSachDienThoai = [];
    _danhSachHoaDon = [];
  }
 List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Getter để truy cập danh sách điện thoại
  List<Dienthoai> get danhSachDienThoai => _danhSachDienThoai;
  // Phương thức quản lý điện thoại
  void themDienThoai(Dienthoai dienthoai) {
    if(dienthoai.trangthai) {
        _danhSachDienThoai.add(dienthoai);
         print("Đã thêm điện thoại mới vào cửa hàng.");
    }else {
    throw Exception("Trạng thái không hợp lệ. Trạng thái phải là 'kinhdoanh' hoặc 'khongkinhdoanh'.");
  }
    
  }

  void capNhatThongTinDienThoai(String maDienThoai, String tenMoi, String hangMoi) {
    for (var dt in _danhSachDienThoai) {
      if (dt.madt == maDienThoai) {
        dt.tendt = tenMoi;
        dt.hangx = hangMoi;
        break;
      }
    }
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    _danhSachDienThoai.removeWhere((dt) => dt.madt == maDienThoai);
  }

  List<Dienthoai> timKiemDienThoai(String searchString) {
    return _danhSachDienThoai.where((dt) => dt.madt.contains(searchString) || dt.tendt.contains(searchString) || dt.hangx.contains(searchString)).toList();
  }

  void hienThiDanhSachDienThoai() {
    for (var dt in _danhSachDienThoai) {
      dt.hienthithongtin();
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDonMoi(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);
    
  }

  List<HoaDon> timKiemHoaDon(String searchString) {
    return _danhSachHoaDon.where((hd) => hd.mahd.contains(searchString) || hd.ngayban.toString().contains(searchString) || hd.tenkh.contains(searchString)).toList();
  }

  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      hd.hienThongTin();
    }
  }

  // Phương thức thống kê
  double tinhTongDoanhThu(DateTime startDate, DateTime endDate) {
    double totalRevenue = 0;
    for (var hd in _danhSachHoaDon) {
      if (hd.ngayban.isAfter(startDate) && hd.ngayban.isBefore(endDate)) {
        totalRevenue += hd.giabantt;
      }
    }
    return totalRevenue;
  }

  double tinhTongLoiNhuan(DateTime startDate, DateTime endDate) {
  double totalProfit = 0;
  for (var hd in _danhSachHoaDon) {
    if (hd.ngayban.isAfter(startDate) && hd.ngayban.isBefore(endDate)) {
      double giaMua = hd.layGiaNhapDienThoai(); 
      totalProfit += (hd.giabantt - (giaMua * hd.slmua));
    }
  }
  return totalProfit;
}


  List<Dienthoai> topBanChay(int top) {
    _danhSachDienThoai.sort((a, b) => b.sltk.compareTo(a.sltk));
    return _danhSachDienThoai.take(top).toList();
  }

  Map<Dienthoai, int> baoCaoTonKho() {
    Map<Dienthoai, int> tonKho = {};
    for (var dt in _danhSachDienThoai) {
      if (dt.sltk > 0) {
        tonKho[dt] = dt.sltk;
      }
    }
    return tonKho;
  }
  @override
String toString() {
  return "dia chi: $_diachi, Tên cuahang: $_tench";
}

}