import 'dien_thoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon({
    required String maHoaDon,
    required DateTime ngayBan,
    required DienThoai dienThoaiBan,
    required int soLuongMua,
    required double giaBanThucTe,
    required String tenKhachHang,
    required String soDienThoaiKhach,
  })  : _maHoaDon = maHoaDon,
        _ngayBan = ngayBan,
        _dienThoaiBan = dienThoaiBan,
        _soLuongMua = soLuongMua,
        _giaBanThucTe = giaBanThucTe,
        _tenKhachHang = tenKhachHang,
        _soDienThoaiKhach = soDienThoaiKhach;

  // Getter/Setter với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isNotEmpty && value.startsWith('HD-') && value.length == 6) {
      _maHoaDon = value;
    } else {
      throw 'Mã hóa đơn không hợp lệ!';
    }
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isBefore(DateTime.now()) || value.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = value;
    } else {
      throw 'Ngày bán không thể sau ngày hiện tại!';
    }
  }

  DienThoai get dienThoaiBan => _dienThoaiBan;
  set dienThoaiBan(DienThoai value) {
    _dienThoaiBan = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value > 0 && value <= _dienThoaiBan.soLuongTon) {
      _soLuongMua = value;
    } else {
      throw 'Số lượng mua phải lớn hơn 0 và không vượt quá số lượng tồn kho!';
    }
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value > 0) {
      _giaBanThucTe = value;
    } else {
      throw 'Giá bán thực tế phải lớn hơn 0!';
    }
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isNotEmpty) {
      _tenKhachHang = value;
    } else {
      throw 'Tên khách hàng không được rỗng!';
    }
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    // Kiểm tra định dạng số điện thoại (đơn giản)
    RegExp regex = RegExp(r'^[0-9]{10}$');
    if (regex.hasMatch(value)) {
      _soDienThoaiKhach = value;
    } else {
      throw 'Số điện thoại khách hàng không hợp lệ!';
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    double loiNhuanCuaDienThoai = _dienThoaiBan.giaBan - _dienThoaiBan.giaNhap;
    return loiNhuanCuaDienThoai * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Điện thoại: ${_dienThoaiBan.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}');
  }
}
