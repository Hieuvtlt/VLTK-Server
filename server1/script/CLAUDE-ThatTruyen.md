# CLAUDE.md — Bộ skill Thất Truyền (VLTK Offline)

Danh mục đầy đủ bộ **skill Thất Truyền** — 23 skill chính, trải 10 môn phái,
dải `SkillId` **1218–1276**.

## Quy ước chung

- **Phạm vi:** chỉ SkillId **1218–1276**. Ngoài dải này là skill gốc của server,
  chỉ dùng để tham khảo/đối chiếu, không can thiệp.
- **`MaxLevel` = 25** cho toàn bộ skill Thất Truyền (skill gốc chỉ có 20).
- **3 lớp dữ liệu:**
  - `settings\skills.txt` — bảng skill, cột `LvlSetScript` + 20 cặp
    `LvlSetting`/`LvlData` trỏ sang file `.lua`.
  - `settings\missles.txt` — hiệu ứng/va chạm của đạn, tra qua `MissleId`.
  - `script\skill\skillthattruyen\<môn_phái>.lua` — **giá trị thực**
    (`SKILLS = { tên_bảng = { thuộc_tính = {...} } }`).
- **`.lua` luôn thắng** `skills.txt`/`missles.txt`. Nhưng thuộc tính có trong
  `.lua` mà **không được khai báo** đúng tên trong cặp `LvlSetting`/`LvlData`
  thì luôn trả về **rỗng** — cả hai chiều đều phải khớp.
- **"Skill chính"** = skill người chơi trực tiếp tung ra (tầng 1). Các tầng con
  được sinh ra qua `skill_startevent`/`flyevent`/`collideevent`/`vanishedevent`
  hoặc qua `ChildSkillId` (với `MisslesForm=12`).

## Bảng 23 skill chính

| SkillId | Tên skill | Môn phái | File `.lua` | Bảng `.lua` | Loại | Ngũ hành | Dạng bắn |
|---|---|---|---|---|---|---|---|
| **1237** | 110 Phi long rồng xoáy (1) | Cái Bang | `caibang.lua` | `philong1` | Nội công | Hỏa | Vị trí mục tiêu |
| **1238** | Bổng (1) | Cái Bang | `caibang.lua` | `bong1` | Ngoại công | Hỏa | Đường thẳng |
| **1262** | Lôi động Cửu Thiên (1) | Côn Lôn | `conlon.lua` | `loidongct1` | Nội công | Thổ | Hình tròn |
| **1266** | Ngạo Tuyết Tiêu Phong (1) | Côn Lôn | `conlon.lua` | `ngaotuyettp1` | Ngoại công | Thổ | Đường thẳng |
| **1227** | 110 Phong Sương (1) | Nga Mi | `ngami.lua` | `phongsuong110_1` | Nội công | Thủy | Vị trí mục tiêu |
| **1230** | 110 3 Kiếm (1) | Nga Mi | `ngami.lua` | `bakiem110_1` | Ngoại công | Thủy | Đường thẳng |
| **1257** | Huyền Âm Trảm (1) | Ngũ Độc | `ngudoc.lua` | `huyenamtram1` | Ngoại công | Mộc | Đường thẳng |
| **1260** | Âm Phong Thực Cốt (1) | Ngũ Độc | `ngudoc.lua` | `amphongtc1` | Nội công | Mộc | Vị trí mục tiêu |
| **1224** | 110 Thiên ngoại LT (1) | Thiên Nhẫn | `thiennhan.lua` | `thienngoailt1` | Nội công | Hỏa | Vị trí mục tiêu |
| **1226** | 110 Vân Long Kích (1) | Thiên Nhẫn | `thiennhan.lua` | `vanlongkich` | Ngoại công | Hỏa | Bột/Mảnh |
| **1271** | Truy Tinh Trục Nguyệt (1) | Thiên Vương | `thienvuong.lua` | `truytinhtn` | Ngoại công | Kim | Skill nền |
| **1273** | Truy Phong Quyết (1) | Thiên Vương | `thienvuong.lua` | `truyphongquyet` | Ngoại công | Kim | Skill nền |
| **1275** | Phá Thiên Trảm (1) | Thiên Vương | `thienvuong.lua` | `phathientram` | Ngoại công | Kim | Skill nền |
| **1245** | Đạt Ma Độ Giang(1) | Thiếu Lâm | `thieulam.lua` | `damodugiang110` | Ngoại công | Kim | Skill nền |
| **1255** | Ngân Đao Xạ Nguyệt Trảm(1) | Thiếu Lâm | `thieulam.lua` | `ngandaoxnt110` | Ngoại công | Kim | Đường thẳng |
| **1256** | Hoành Tảo Thiên Quân(1) | Thiếu Lâm | `thieulam.lua` | `hoanhtaotq110` | Ngoại công | Kim | Vị trí bản thân |
| **1233** | 110 Băng tung vô ảnh TY(1) | Thúy Yên | `thuyyen.lua` | `bangtungvoanh110` | Ngoại công | Thủy | Đường thẳng |
| **1235** | 110 3 Tiên (1) | Thúy Yên | `thuyyen.lua` | `batien110_1` | Nội công | Thủy | Bột/Mảnh |
| **1218** | 110 Thiên Địa (1) | Võ Đang | `vodang.lua` | `thiendia1` | Nội công | Thổ | Vị trí mục tiêu |
| **1221** | 110 Nhân Kiếm (1) | Võ Đang | `vodang.lua` | `nhankiem1` | Ngoại công | Thổ | Tường phẳng |
| **1248** | Thiên Ngoại Phi Tiên (1) | Đường Môn | `duongmon.lua` | `thienngoaipt1` | Ngoại công | Mộc | Bột/Mảnh |
| **1251** | Bạo Vũ (1) | Đường Môn | `duongmon.lua` | `baovu1` | Ngoại công | Mộc | Vị trí mục tiêu |
| **1253** | Cửu Cung Phi Tinh(1) | Đường Môn | `duongmon.lua` | `cuucungpt1` | Ngoại công | Mộc | Bột/Mảnh |

## Chuỗi tầng

| Skill chính | Chuỗi kích hoạt | Các tầng con |
|---|---|---|
| **1218** 110 Thiên Địa (1) | Start->1219, Fly->1220 | `1219` 110 Thiên Địa (2) (thiendia2)<br>`1220` 110 Thiên Địa (3) (thiendia3) |
| **1221** 110 Nhân Kiếm (1) | Start->1222 | `1222` 110 Nhân Kiếm (2) (nhankiem2) |
| **1224** 110 Thiên ngoại LT (1) | Collide->1225, Vanished->363 | `1225` 110 Thiên ngoại LT (2) (thienngoailt2)<br>`363` *(skill gốc có sẵn)* |
| **1226** 110 Vân Long Kích (1) | *không có tầng* | — |
| **1227** 110 Phong Sương (1) | Start->1228, Fly->1229 | `1228` 110 Phong Sương (2) (phongsuong110_2)<br>`1229` 110 Phong Sương (3) (phongsuong110_3) |
| **1230** 110 3 Kiếm (1) | Start->329, Fly->1231, Collide->1232 | `329` *(skill gốc có sẵn)*<br>`1231` 110 3 Kiếm (2) (bakiem110_2)<br>`1232` 110 3 Kiếm (3) (bakiem110_3) |
| **1233** 110 Băng tung vô ảnh TY(1) | Fly->1234 | `1234` 110 Tia băng TY (2) (tiabang110_2) |
| **1235** 110 3 Tiên (1) | Fly->1236 | `1236` 110 3 Tiên (2) (batien110_2) |
| **1237** 110 Phi long rồng xoáy (1) | *không có tầng* | — |
| **1238** Bổng (1) | Fly->1239 | `1239` Bổng (2) (bong2) |
| **1245** Đạt Ma Độ Giang(1) | ChildSkill->1246 | `1246` Đạt Ma Độ Giang(2) (damodugiang110_2) |
| **1248** Thiên Ngoại Phi Tiên (1) | Start->1250 | `1250` Thiên Ngoại Phi Tiên (3) (thienngoaipt3) |
| **1251** Bạo Vũ (1) | Start->1252 | `1252` Lê Hoa (2) (lehoa2) |
| **1253** Cửu Cung Phi Tinh(1) | Start->1254 | `1254` Cửu Cung Phi Tinh( 2) (cuucungpt2) |
| **1255** Ngân Đao Xạ Nguyệt Trảm(1) | Collide->340 | `340` *(skill gốc có sẵn)* |
| **1256** Hoành Tảo Thiên Quân(1) | *không có tầng* | — |
| **1257** Huyền Âm Trảm (1) | Start->1258, Collide->1259 | `1258` Huyền Âm Trảm (2) (huyenamtram2)<br>`1259` Huyền Âm Trảm (3) (huyenamtram3) |
| **1260** Âm Phong Thực Cốt (1) | Start->1261, Vanished->354 | `1261` Âm Phong Thực Cốt (2) (amphongtc2)<br>`354` *(skill gốc có sẵn)* |
| **1262** Lôi động Cửu Thiên (1) | Start->1265, Fly->1264 | `1265` Lôi động Cửu Thiên (2) (loidongct2)<br>`1264` Lôi động Cửu Thiên (3) (loidongct3) |
| **1266** Ngạo Tuyết Tiêu Phong (1) | Fly->1267, Collide->373 | `1267` Ngạo Tuyết Tiêu Phong (2) (ngaotuyettp2)<br>`373` *(skill gốc có sẵn)* |
| **1271** Truy Tinh Trục Nguyệt (1) | ChildSkill->1272 | `1272` Truy Tinh Trục Nguyệt (2) (truytinhtn) |
| **1273** Truy Phong Quyết (1) | ChildSkill->1274 | `1274` Truy Phong Quyết (2) (truyphongquyet) |
| **1275** Phá Thiên Trảm (1) | ChildSkill->1276 | `1276` Phá Thiên Trảm (2) (phathientram) |

## Ghi chú riêng của bộ này

- **`MisslesForm=12` (1245, 1271, 1273, 1275)** — skill nền, **không tự bắn đạn
  và không mang sát thương**. Cột `ChildSkillId` trỏ thẳng tới một **`SkillId`
  khác** (KHÔNG phải MissleId); SkillId đó mới là skill chính thật sự có
  `MissleId` và bắn đạn. Skill nền dùng **chung một bảng `.lua`** với skill
  chính, nên trong bảng dùng chung **không khai báo** `skill_misslenum_v` và
  `skill_startevent`.
- **Tầng con trỏ ra ngoài dải Thất Truyền** — một số skill dùng lại skill gốc
  có sẵn làm tầng: `1230 → 329`, `1224 → 363`, `1255 → 340`, `1260 → 354`,
  `1266 → 373`. Không định nghĩa lại các skill này trong `skillthattruyen`.
- **7 skill chính không có tầng nào:** 1226, 1237, 1245, 1256, 1271, 1273, 1275.
  (1245/1271/1273/1275 là skill nền form 12 — tầng của chúng nằm ở skill chính.)
- **Hai bảng thụt đầu dòng bằng DẤU CÁCH thay vì tab** — `phongsuong110_3`
  (`ngami.lua`) và `batien110_2` (`thuyyen.lua`). Mọi script quét file theo
  mẫu `^\t<tên_bảng>` sẽ **bỏ sót hai bảng này**; phải dùng `^\s+` khi rà soát.
- **`skill_showevent`** chỉ có tác dụng ở **tầng 1**, và chỉ mô tả được tầng do
  chính nó trực tiếp kích hoạt. Hiện đã thiết kế đúng cho 16 skill chính có
  event; 7 skill chính không có event thì **không khai báo**.
