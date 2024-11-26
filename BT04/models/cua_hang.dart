import 'dien_thoai.dart';  // Import lớp DienThoai
import 'hoa_don.dart';  // Import lớp HoaDon

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor với tên và địa chỉ
  CuaHang({
    required String tenCuaHang,
    required String diaChi,
  })  : _tenCuaHang = tenCuaHang,
        _diaChi = diaChi;

  // Getter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Phương thức quản lý điện thoại

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    var index = _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index] = dienThoaiMoi;
    } else {
      throw 'Điện thoại không tồn tại!';
    }
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDienThoai) {
    var index = _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index].trangThai = false;
    } else {
      throw 'Điện thoại không tồn tại!';
    }
  }

  // Tìm kiếm điện thoại
  List<DienThoai> timKiemDienThoai({String? maDienThoai, String? tenDienThoai, String? hangSanXuat}) {
    return _danhSachDienThoai.where((dt) {
      bool match = true;
      if (maDienThoai != null && !dt.maDienThoai.contains(maDienThoai)) match = false;
      if (tenDienThoai != null && !dt.tenDienThoai.contains(tenDienThoai)) match = false;
      if (hangSanXuat != null && !dt.hangSanXuat.contains(hangSanXuat)) match = false;
      return match;
    }).toList();
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    for (var dt in _danhSachDienThoai) {
      print('Mã điện thoại: ${dt.maDienThoai}, Tên: ${dt.tenDienThoai}, Hãng: ${dt.hangSanXuat}, Giá bán: ${dt.giaBan}, Số lượng tồn: ${dt.soLuongTon}, Trạng thái: ${dt.trangThai ? 'Còn bán' : 'Ngừng bán'}');
    }
  }

  // Phương thức quản lý hóa đơn

  // Tạo hóa đơn mới và tự động cập nhật tồn kho
  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.soLuongMua > hoaDon.dienThoaiBan.soLuongTon) {
      throw 'Số lượng mua vượt quá số lượng tồn kho của điện thoại!';
    }
    hoaDon.dienThoaiBan.soLuongTon -= hoaDon.soLuongMua;
    _danhSachHoaDon.add(hoaDon);
  }

  // Tìm kiếm hóa đơn
  List<HoaDon> timKiemHoaDon({String? maHoaDon, DateTime? ngayBan, String? tenKhachHang}) {
    return _danhSachHoaDon.where((hd) {
      bool match = true;
      if (maHoaDon != null && !hd.maHoaDon.contains(maHoaDon)) match = false;
      if (ngayBan != null && hd.ngayBan != ngayBan) match = false;
      if (tenKhachHang != null && !hd.tenKhachHang.contains(tenKhachHang)) match = false;
      return match;
    }).toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      print('Mã hóa đơn: ${hd.maHoaDon}, Ngày bán: ${hd.ngayBan}, Khách hàng: ${hd.tenKhachHang}, Số lượng mua: ${hd.soLuongMua}, Tổng tiền: ${hd.tinhTongTien()}, Lợi nhuận: ${hd.tinhLoiNhuanThucTe()}');
    }
  }

  // Phương thức thống kê

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hoaDon.tinhTongTien();
      }
    }
    return tongDoanhThu;
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double tongLoiNhuan = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        tongLoiNhuan += hoaDon.tinhLoiNhuanThucTe();
      }
    }
    return tongLoiNhuan;
  }

  // Thống kê top điện thoại bán chạy
  List<DienThoai> thongKeTopDienThoaiBanChay() {
    // Sắp xếp điện thoại theo số lượng bán
    Map<DienThoai, int> dienThoaiBanChay = {};
    for (var hoaDon in _danhSachHoaDon) {
      if (dienThoaiBanChay.containsKey(hoaDon.dienThoaiBan)) {
        dienThoaiBanChay[hoaDon.dienThoaiBan] = dienThoaiBanChay[hoaDon.dienThoaiBan]! + hoaDon.soLuongMua;
      } else {
        dienThoaiBanChay[hoaDon.dienThoaiBan] = hoaDon.soLuongMua;
      }
    }

    // Sắp xếp danh sách theo số lượng bán giảm dần
    var topDienThoai = dienThoaiBanChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Trả về danh sách top điện thoại bán chạy
    return topDienThoai.map((entry) => entry.key).toList();
  }

  // Thống kê tồn kho
  void thongKeTonKho() {
    for (var dt in _danhSachDienThoai) {
      print('Mã điện thoại: ${dt.maDienThoai}, Tên: ${dt.tenDienThoai}, Số lượng tồn: ${dt.soLuongTon}');
    }
  }
}
