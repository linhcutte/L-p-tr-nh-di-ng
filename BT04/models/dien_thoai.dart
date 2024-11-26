class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai({
    required String maDienThoai,
    required String tenDienThoai,
    required String hangSanXuat,
    required double giaNhap,
    required double giaBan,
    required int soLuongTon,
    required bool trangThai,
  })  : _maDienThoai = maDienThoai,
        _tenDienThoai = tenDienThoai,
        _hangSanXuat = hangSanXuat,
        _giaNhap = giaNhap,
        _giaBan = giaBan,
        _soLuongTon = soLuongTon,
        _trangThai = trangThai;

  // Getter/Setter với validation
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isNotEmpty && value.startsWith('DT-') && value.length == 6) {
      _maDienThoai = value;
    } else {
      throw 'Mã điện thoại không hợp lệ!';
    }
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isNotEmpty) {
      _tenDienThoai = value;
    } else {
      throw 'Tên điện thoại không được rỗng!';
    }
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isNotEmpty) {
      _hangSanXuat = value;
    } else {
      throw 'Hãng sản xuất không được rỗng!';
    }
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value > 0) {
      _giaNhap = value;
    } else {
      throw 'Giá nhập phải lớn hơn 0!';
    }
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value > 0 && value > _giaNhap) {
      _giaBan = value;
    } else {
      throw 'Giá bán phải lớn hơn giá nhập và phải lớn hơn 0!';
    }
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value >= 0) {
      _soLuongTon = value;
    } else {
      throw 'Số lượng tồn kho phải >= 0!';
    }
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuanDuKien() {
    return (_giaBan - _giaNhap) * _soLuongTon;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn: $_soLuongTon');
    print('Trạng thái kinh doanh: ${_trangThai ? "Đang kinh doanh" : "Ngừng kinh doanh"}');
  }

  // Phương thức kiểm tra có thể bán không (còn hàng và đang kinh doanh)
  bool coTheBan() {
    return _soLuongTon > 0 && _trangThai;
  }
}
