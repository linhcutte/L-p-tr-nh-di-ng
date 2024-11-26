import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

class Test {
  // Hàm kiểm thử chức năng thêm điện thoại
  void kiemTraThemDienThoai() {
    print("** Kiểm thử thêm điện thoại **");

    // Tạo đối tượng CuaHang
    var cuaHang = CuaHang(tenCuaHang: 'Điện thoại XYZ', diaChi: 'Hà Nội');

    // Tạo điện thoại mới
    var dt1 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 14',
      hangSanXuat: 'Apple',
      giaNhap: 15000.0,
      giaBan: 20000.0,
      soLuongTon: 10,
      trangThai: true,
    );

    // Thêm điện thoại vào cửa hàng
    cuaHang.themDienThoai(dt1);

    // Hiển thị danh sách điện thoại
    cuaHang.hienThiDanhSachDienThoai();
  }

  // Hàm kiểm thử cập nhật thông tin điện thoại
  void kiemTraCapNhatDienThoai() {
    print("** Kiểm thử cập nhật thông tin điện thoại **");

    var cuaHang = CuaHang(tenCuaHang: 'Điện thoại XYZ', diaChi: 'Hà Nội');

    // Thêm điện thoại vào cửa hàng
    var dt1 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 14',
      hangSanXuat: 'Apple',
      giaNhap: 15000.0,
      giaBan: 20000.0,
      soLuongTon: 10,
      trangThai: true,
    );
    cuaHang.themDienThoai(dt1);

    // Cập nhật thông tin điện thoại
    var dt2 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 15',
      hangSanXuat: 'Apple',
      giaNhap: 16000.0,
      giaBan: 21000.0,
      soLuongTon: 12,
      trangThai: true,
    );
    cuaHang.capNhatDienThoai('DT-001', dt2);

    // Hiển thị danh sách điện thoại
    cuaHang.hienThiDanhSachDienThoai();
  }

  // Hàm kiểm thử tạo hóa đơn hợp lệ
  void kiemTraTaoHoaDon() {
    print("** Kiểm thử tạo hóa đơn **");

    var cuaHang = CuaHang(tenCuaHang: 'Điện thoại XYZ', diaChi: 'Hà Nội');

    // Tạo điện thoại
    var dt1 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 14',
      hangSanXuat: 'Apple',
      giaNhap: 15000.0,
      giaBan: 20000.0,
      soLuongTon: 10,
      trangThai: true,
    );
    cuaHang.themDienThoai(dt1);

    // Tạo hóa đơn
    var hoaDon1 = HoaDon(
      maHoaDon: 'HD-001',
      ngayBan: DateTime(2024, 11, 20),
      dienThoaiBan: dt1,
      soLuongMua: 2,
      giaBanThucTe: 19000.0,
      tenKhachHang: 'Nguyễn Văn A',
      soDienThoaiKhach: '0981234567',
    );

    // Tạo hóa đơn và cập nhật tồn kho
    cuaHang.taoHoaDon(hoaDon1);

    // Hiển thị danh sách hóa đơn
    cuaHang.hienThiDanhSachHoaDon();
  }

  // Hàm kiểm thử các ràng buộc khi tạo hóa đơn
  void kiemTraRangBuocHoaDon() {
    print("** Kiểm thử các ràng buộc khi tạo hóa đơn **");

    var cuaHang = CuaHang(tenCuaHang: 'Điện thoại XYZ', diaChi: 'Hà Nội');

    // Tạo điện thoại
    var dt1 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 14',
      hangSanXuat: 'Apple',
      giaNhap: 15000.0,
      giaBan: 20000.0,
      soLuongTon: 5,
      trangThai: true,
    );
    cuaHang.themDienThoai(dt1);

    try {
      // Tạo hóa đơn với số lượng mua vượt quá tồn kho
      var hoaDon1 = HoaDon(
        maHoaDon: 'HD-002',
        ngayBan: DateTime(2024, 11, 20),
        dienThoaiBan: dt1,
        soLuongMua: 6, // Vượt quá tồn kho
        giaBanThucTe: 19000.0,
        tenKhachHang: 'Nguyễn Văn B',
        soDienThoaiKhach: '0982345678',
      );
      cuaHang.taoHoaDon(hoaDon1);
    } catch (e) {
      print(e); // In ra lỗi khi không đủ hàng
    }
  }

  // Hàm kiểm thử tính toán tiền và lợi nhuận
  void kiemTraTinhToanTienLoiNhuan() {
    print("** Kiểm thử tính toán tiền và lợi nhuận **");

    var cuaHang = CuaHang(tenCuaHang: 'Điện thoại XYZ', diaChi: 'Hà Nội');

    // Tạo điện thoại
    var dt1 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 14',
      hangSanXuat: 'Apple',
      giaNhap: 15000.0,
      giaBan: 20000.0,
      soLuongTon: 10,
      trangThai: true,
    );
    cuaHang.themDienThoai(dt1);

    // Tạo hóa đơn
    var hoaDon1 = HoaDon(
      maHoaDon: 'HD-001',
      ngayBan: DateTime(2024, 11, 20),
      dienThoaiBan: dt1,
      soLuongMua: 2,
      giaBanThucTe: 19000.0,
      tenKhachHang: 'Nguyễn Văn A',
      soDienThoaiKhach: '0981234567',
    );

    // Tạo hóa đơn và cập nhật tồn kho
    cuaHang.taoHoaDon(hoaDon1);

    // Hiển thị tổng tiền và lợi nhuận của hóa đơn
    print("Tổng tiền: ${hoaDon1.tinhTongTien()}");
    print("Lợi nhuận: ${hoaDon1.tinhLoiNhuanThucTe()}");
  }

  // Hàm kiểm thử thống kê doanh thu theo thời gian
  void kiemTraDoanhThuTheoThoiGian() {
    print("** Kiểm thử thống kê doanh thu theo thời gian **");

    var cuaHang = CuaHang(tenCuaHang: 'Điện thoại XYZ', diaChi: 'Hà Nội');

    // Tạo điện thoại và hóa đơn
    var dt1 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 14',
      hangSanXuat: 'Apple',
      giaNhap: 15000.0,
      giaBan: 20000.0,
      soLuongTon: 10,
      trangThai: true,
    );
    cuaHang.themDienThoai(dt1);

    var hoaDon1 = HoaDon(
      maHoaDon: 'HD-001',
      ngayBan: DateTime(2024, 11, 20),
      dienThoaiBan: dt1,
      soLuongMua: 2,
      giaBanThucTe: 19000.0,
      tenKhachHang: 'Nguyễn Văn A',
      soDienThoaiKhach: '0981234567',
    );
    cuaHang.taoHoaDon(hoaDon1);

    // Thống kê doanh thu trong khoảng thời gian
    DateTime tuNgay = DateTime(2024, 11, 18);
    DateTime denNgay = DateTime(2024, 11, 21);
    print("Doanh thu từ $tuNgay đến $denNgay: ${cuaHang.tinhTongDoanhThu(tuNgay, denNgay)}");
  }

  // Hàm kiểm thử thống kê top điện thoại bán chạy
  void kiemTraTopDienThoaiBanChay() {
    print("** Kiểm thử thống kê top bán chạy **");

    var cuaHang = CuaHang(tenCuaHang: 'Điện thoại XYZ', diaChi: 'Hà Nội');

    var dt1 = DienThoai(
      maDienThoai: 'DT-001',
      tenDienThoai: 'iPhone 14',
      hangSanXuat: 'Apple',
      giaNhap: 15000.0,
      giaBan: 20000.0,
      soLuongTon: 10,
      trangThai: true,
    );
    var dt2 = DienThoai(
      maDienThoai: 'DT-002',
      tenDienThoai: 'Samsung Galaxy S22',
      hangSanXuat: 'Samsung',
      giaNhap: 13000.0,
      giaBan: 17000.0,
      soLuongTon: 5,
      trangThai: true,
    );
    var dt3 = DienThoai(
      maDienThoai: 'DT-003',
      tenDienThoai: 'Google Pixel 6',
      hangSanXuat: 'Google',
      giaNhap: 10000.0,
      giaBan: 13000.0,
      soLuongTon: 3,
      trangThai: true,
    );

    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);
    cuaHang.themDienThoai(dt3);

    // Thống kê top bán chạy
    cuaHang.thongKeTopDienThoaiBanChay();
  }
}

void main() {
  // Tạo đối tượng kiểm thử
  var test = Test();

  // Chạy các phương thức kiểm thử
  test.kiemTraThemDienThoai();
  test.kiemTraCapNhatDienThoai();
  test.kiemTraTaoHoaDon();
  test.kiemTraRangBuocHoaDon();
  test.kiemTraTinhToanTienLoiNhuan();
  test.kiemTraDoanhThuTheoThoiGian();
  test.kiemTraTopDienThoaiBanChay();
}
