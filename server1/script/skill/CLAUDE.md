# CLAUDE.md — Dự án chỉnh sửa Skill VLTK Offline (Võ Lâm Truyền Kỳ)

Đây là ngữ cảnh nền tảng cho dự án chỉnh sửa/thiết kế skill của server VLTK
Offline. Đọc kỹ trước khi thao tác bất kỳ file `skills.txt`, `Missile.txt`,
hay file `.lua` nào trong dự án này.

## Cấu trúc dữ liệu tổng quan

Một skill hoàn chỉnh được lắp ráp từ **3 lớp dữ liệu**, phối hợp với file đồ
họa `.spr`:

1. **`skills.txt`** (Server/Settings/) — bảng liệt kê mọi skill, quy định
   trạng thái, cách tương tác, và chuỗi `LvlSetting1..20`/`LvlData1..20` tham
   chiếu sang file `.lua` tương ứng (`LvlSetScript`).
2. **`Missile.txt`** (cùng thư mục) — quy định hiệu ứng hình ảnh và va chạm
   vật lý của từng "viên đạn" (missile), tham chiếu qua `MissleId`.
3. **File `.lua`** (Server/Script/Skill/`<tên_môn_phái>.lua`) — chứa GIÁ TRỊ
   THỰC của skill (damage, cost, radius, event chain...). Tên bảng cố định
   `SKILLS = { tên_skill = { thuộc_tính = {...} } }`.

### Danh sách file `.lua` theo môn phái đã biết
```
wudang.lua / VoDang.lua  : Võ Đang       tianren.lua / Thiennhan.lua : Thiên Nhẫn
emei.lua       : Nga Mi              gaibang.lua    : Cái Bang
shaolin.lua    : Thiếu Lâm           wudu.lua       : Ngũ Độc
tangmen.lua    : Đường Môn           cuiyan.lua     : Thúy Yên
tianwang.lua   : Thiên Vương         kunlun.lua     : Côn Lôn
Huashan.lua    : Hoa Sơn (CHƯA từng phân tích, chỉ mới biết tên)
```

## ⚠️ NGUYÊN TẮC QUAN TRỌNG NHẤT: `.lua` LUÔN THẮNG

Khi 1 thuộc tính **đã có giá trị cụ thể** trong file `.lua`, giá trị đó
**LUÔN được ưu tiên tuyệt đối**, bất kể `skills.txt`/`Missile.txt` ghi gì
khác. Áp dụng cho:
- Chuỗi sự kiện `StartEvent`/`FlyEvent`/`CollideEvent`/`VanishedEvent`: nếu
  `.lua` đã set `skill_startevent[3] = {{1,ID},...}`, thì cột
  `StartSkillId` trong `skills.txt` bị **bỏ qua hoàn toàn**.
- `ChildSkillNum` (skills.txt) bị `missle_num`/`skill_misslenum_v` (.lua)
  ghi đè (vd `.lua` đặt 3, dù `skills.txt` ghi 6 thì vẫn chỉ ra 3 đạn).
- `Speed`/`LifeTime` (Missile.txt) bị `missle_speed_v`/`missle_lifetime_v`
  (.lua) ghi đè.

**Hệ quả thực hành:** muốn đổi hành vi 1 skill mà `.lua` đã có giá trị cứng,
PHẢI sửa trực tiếp trong `.lua` — chỉ sửa `skills.txt`/`Missile.txt` sẽ
KHÔNG có tác dụng gì. Đây là lỗi thao tác thường gặp nhất.

Ngược lại: 1 thuộc tính **có trong `.lua`** nhưng **KHÔNG được khai báo**
đúng tên trong cặp `LvlSetting`/`LvlData` của `skills.txt` sẽ **không được
áp dụng vào game** (luôn trả về rỗng) — cả 2 chiều đều cần khớp nhau.

## Quy tắc Vật lý (Ngoại công) vs Nguyên tố (Nội công)

Xác định qua cột `IsPhysical` trong `skills.txt` (0=nội công/nguyên tố,
1=ngoại công/vật lý):

- **Nội công (`IsPhysical=0`):** **mặc định** dùng **CHÍNH XÁC 1 hàm nguyên
  tố** tương ứng `CharClass` (xem bảng Ngũ Hành bên dưới). KHÔNG dùng
  `physicsenhance_p`. Đây vẫn là nguyên tắc xuyên suốt của dự án.
  - **Được phép phá lệ** — kể cả gắn `physicsdamage_v` (hệ Kim) lên skill nội
    công khác hệ — **nếu người thiết kế chủ đích muốn thế**. Đó là quyền quyết
    định của người dùng, KHÔNG phải lỗi, và KHÔNG được tự ý sửa lại.
  - **NHƯNG bắt buộc phải BÁO LẠI mỗi lần phát hiện:** nêu rõ `SkillId` +
    `IsPhysical` + `CharClass` + danh sách hàm đang có, rồi hỏi là cố ý hay gõ
    nhầm. Không im lặng bỏ qua, cũng không im lặng sửa. Lý do: người dùng muốn
    giữ quyền thiết kế nhưng vẫn cần được chặn khi lỡ tay.
- **Ngoại công (`IsPhysical=1`):** dùng `physicsenhance_p`, và **ĐƯỢC PHÉP**
  kết hợp thêm các hàm nguyên tố (`firedamage_v`, `colddamage_v`,
  `poisondamage_v`, `lightingdamage_v`) cùng lúc — khi đó gọi là **"X sát
  ngoại công"** (vd "Hỏa sát ngoại công", "Độc sát ngoại công") = sát
  thương nguyên tố phụ trợ gắn thêm cho đòn đánh vật lý. Đây là thiết kế
  hợp lệ, **không phải lỗi**.
- **NGOẠI LỆ DUY NHẤT — cấm tuyệt đối:** `physicsdamage_v` (hàm nguyên tố
  hệ Kim) **CHỈ được dùng cho skill nội công** (`IsPhysical=0`, Kim). TUYỆT
  ĐỐI không gắn vào skill ngoại công dù các hàm nguyên tố khác thì được
  phép. **Không nhầm `physicsdamage_v` với `physicsenhance_p`** — tên rất
  giống nhau nhưng bản chất khác hẳn (1 là nguyên tố Kim, 1 là % vật lý).

## Bảng Ngũ Hành (`CharClass`, cột S skills.txt) → hàm sát thương

| CharClass | Hành | Hàm sát thương | Độ tin cậy |
|---|---|---|---|
| 1 | Kim | `physicsdamage_v` (chỉ khi IsPhysical=0) | Xác nhận trực tiếp |
| 2 | Thủy | `colddamage_v` | Suy luận hợp lý, chưa xác nhận trực tiếp |
| 3 | Mộc | `poisondamage_v` | Suy luận hợp lý, chưa xác nhận trực tiếp |
| 4 | Hỏa | `firedamage_v` | Có bằng chứng (tên file AnimFile chứa "huo3") |
| 5 | Thổ | `lightingdamage_v` (Sét) | Xác nhận trực tiếp |

## `seriesdamage_p` (Ngũ hành tương khắc) — QUY TẮC CỨNG

- Ý nghĩa: tăng X% sát thương lên hệ ngũ hành **bị mình khắc**, đồng thời
  giảm X% sát thương lên hệ ngũ hành **khắc mình**.
- **TỐI ĐA 55%, KHÔNG BAO GIỜ được vượt**, trong bất kỳ skill/file `.lua`
  nào. Gặp giá trị vượt 55% → tự động điều chỉnh về đúng 55% mà không cần
  hỏi lại.
- Lưu ý: `magicdesc.ini` gốc của server có thể ghi sai/thiếu mô tả field
  này (từng phải tự sửa lại `magicdesc.ini` cho đúng "Ngũ hành tương khắc").

## Các cột/field hay bị hiểu nhầm

- **`TimePerCast`** (skills.txt, cột AF) = thời gian **HỒI CHIÊU**
  (cooldown), KHÔNG PHẢI thời gian xuất chiêu.
- **`addskilldamage1/2/3`** (.lua): chỉ số `[1]` là **1 SkillId khác** (tra
  tên trong `skills.txt`), `[3]` là **% cộng thêm theo cấp**. KHÔNG PHẢI ID
  vũ khí như tên gọi dễ gây hiểu nhầm.
- **`MisslesForm`** (skills.txt, cột T) — bản chuẩn mới nhất:
  `0`=Dạng tường phẳng, `1`=Đường thẳng, `2`=Bột/Mảnh vụn, `3`=Hình tròn,
  `4`=Vùng, `5`=Điểm, `6`=Ngay vị trí mục tiêu, `7`=Ngay vị trí bản thân,
  **`12`=Skill nền gọi skill chính** (xem ngay dưới).
- **`MisslesForm=12` — cặp "skill nền + skill chính"** (đã xác nhận thực tế):
  skill nền KHÔNG tự bắn đạn, mà dùng cột **`ChildSkillId` trỏ thẳng tới một
  `SkillId` khác** (KHÔNG phải MissleId — đây là chỗ rất dễ nhầm). SkillId
  được trỏ tới mới là **skill chính**, mới có `MissleId` và mới thực sự bắn
  đạn ra.
  - Chỉ cần **1 bảng `.lua` dùng chung** cho cả skill nền và skill chính.
  - Skill nền **KHÔNG mang sát thương** — nó chỉ là cổng kích hoạt. Cho nó
    thêm `addskilldamage` cũng không làm skill chính mạnh lên.
  - Trong bảng dùng chung, **KHÔNG khai báo** `skill_misslenum_v` và
    `skill_startevent` (sẽ áp nhầm lên cả hai vế).
  - Nếu skill chính còn gắn thêm tầng thì xử lý như mọi skill khác.
- **`Param2` khi `MisslesForm=3` (hình tròn) = BÁN KÍNH vòng tròn** (không
  phải góc): `Param2=0` → đạn toả RA từ tâm; `Param2>0` → đạn xuất phát từ
  rìa vòng tròn và HƯỚNG VÀO tâm — nên mục tiêu đứng ở tâm luôn ăn đủ 100%
  số đạn. Missile có `MoveKind=5` cũng chắc chắn trúng đủ số đạn phát ra.
- **`Param1`/`Param2`** (skills.txt) — CÒN 2 GIẢ THUYẾT CHƯA THỐNG NHẤT:
  (a) tài liệu mới: Param1=góc lệch giữa các tia đạn, Param2=khoảng cách
  đạn-người lúc xuất; (b) thực nghiệm cũ (có bằng chứng cụ thể từ nhiều
  skill thật): Param1=độ trễ thời gian (tuần tự), Param2=góc quạt dạng
  8-bit (0-255=360°). Khi phân tích, nêu rõ cả 2 khả năng, khuyến nghị test
  thực tế trong game để xác định.
- **`autoattackskill`/`autorescueskill`** (.lua, cơ chế tự động phản
  công/tự cứu): CHỈ hoạt động khi (a) `SkillStyle=3` (bị động) VÀ (b) skill
  đó đã được nhân vật **HỌC trực tiếp** (nằm trong danh sách skill đã học).
  KHÔNG kích hoạt nếu chỉ được gọi thoáng qua từ `StartEvent` của 1 skill
  chủ động khác — dù cú pháp đúng, dù `skill_desc` vẫn hiển thị đúng chữ
  (vì đó chỉ là hàm hiển thị text, không đại diện việc engine có thực sự
  kích hoạt hay không).

- **`skill_showevent`** (.lua) — **BITMASK 4 BIT**, KHÔNG phải cờ bật/tắt.
  Mỗi loại event có một mã riêng, nhiều event cùng bật ở 1 cấp thì **cộng
  dồn** mã lại:
  `skill_startevent`=**1**, `skill_flyevent`=**2**, `skill_collideevent`=**4**,
  `skill_vanishedevent`=**8**. Ví dụ có start+collide → `5`; fly+collide → `6`.
  - Chỉ dùng **param1**. Luôn viết dạng bậc thang (2 mốc trùng cấp:
    `{{1,0},{10,0},{10,6},{25,6}}` → 0 tới lv10, 6 từ lv11).
  - **BẮT BUỘC là tập con của các event thực sự tồn tại.** Bật bit cho event
    không có = vô nghĩa (kiểm chứng 1040 cặp skill-level: đúng 99,0%; ca duy
    nhất sai là lỗi copy-paste).
  - **KHÔNG phải cổng kích hoạt event** — mỗi event đã có cổng riêng ở `[1]`
    của chính nó. Đây chỉ là đánh dấu event nào được "trình diễn".
  - **CHỈ `skill_showevent` của TẦNG 1 là có tác dụng** — tức skill mà người
    chơi trực tiếp tung ra. Nó là **tuyệt đối và duy nhất** (đã test in-game).
    `skill_showevent` khai báo ở các tầng sau (tầng 2, 3…) **hoàn toàn vô
    nghĩa**, engine không đọc tới.
  - Và tầng 1 **chỉ mô tả được tầng do CHÍNH NÓ trực tiếp kích hoạt**. Tầng nằm
    sâu hơn trong chuỗi — gọi gián tiếp qua một tầng trung gian — **không có
    cách nào mô tả được**. Đây là giới hạn của cơ chế, không phải thiếu sót.
  - **Hệ quả:** KHÔNG cần khai báo, cũng KHÔNG cần wire `skill_showevent` cho
    tầng trung gian. Chỉ làm cho tầng 1.
  - Nếu skill không có event nào → **không khai báo** thuộc tính này.
- **`MissleHeight`** (missles.txt, cột 6) — độ cao của đạn khi xuất ra. Chiều
  cao tối đa của mục tiêu là **20**. Đặt `MissleHeight > 20` thì đạn **bay qua
  đầu**, không trúng ai → dùng làm **công tắc tắt sát thương của 1 tầng** mà
  không phải comment code. Chỉ chắc ăn khi missile **không có sát thương diện
  rộng** (`IsRangeDmg=0`); nếu `IsRangeDmg=1` và `DmgRange` lớn thì vẫn có thể
  gây sát thương lan — phải test lại.
- **`deadlystrike_p`** (% chí mạng) — **CHỈ xuất hiện ở kỹ năng NGOẠI CÔNG**
  (`IsPhysical=1`), không có ngoại lệ.
- **`poisondamage_v` có dạng 3 THAM SỐ** (khác hẳn các hàm nguyên tố còn lại):
  `{{sát_thương},{thời_lượng},{nhịp}}` — ví dụ
  `{{{1,6},{20,38}},{{1,60},{20,60}},{{1,10},{20,10}}}`. Khi cân bằng, **chỉ
  scale tham số thứ nhất**; tham số 2 và 3 là thời lượng/nhịp DoT, giữ nguyên.
- **`[1]` và `[3]` của một thuộc tính sát thương = cận DƯỚI và cận TRÊN** của
  khoảng ngẫu nhiên (không phải 2 giá trị trùng lặp). Muốn sát thương **phẳng**
  (không dao động) thì đặt `[1]` = `[3]`.

## Nguyên tắc cân bằng sát thương (skill mới vs skill gốc)

**1. So MAX-LEVEL với MAX-LEVEL.** Skill gốc có `MaxLevel=20`, skill Thất
Truyền có `MaxLevel=25` (đọc cột `MaxLevel` trong `skills.txt`). Hệ số phải đo:

> **N = (sức mạnh skill mới ở cấp 25) ÷ (sức mạnh skill gốc ở cấp 20)**

TUYỆT ĐỐI không so cấp 20 với cấp 20. Đây là lý do giá trị ở cấp 20 của skill
mới trông "thấp hơn kỳ vọng": mốc cuối chỉ đặt ở cấp 20 rồi để `Link()` ngoại
suy lên 25, và **chính giá trị cấp 25 mới là mục tiêu cân bằng**.

**2. Sát thương NHÂN theo số đạn trúng** (đã kiểm chứng in-game): trúng 1 đạn
×1, 2 đạn ×2, 3 đạn ×3. Công thức:
`giá trị mỗi đạn = (gốc × hệ_số) ÷ N`, với `N` = số đạn trúng **hiệu dụng**.
- Với skill bắn toả, lấy `N` thận trọng (2–3) để trường hợp xấu nhất vẫn mạnh
  hơn gốc — KHÔNG lấy "trúng đủ toàn bộ đạn" làm chuẩn.
- Ngoại lệ chắc chắn trúng đủ: `MisslesForm=3` với `Param2>0`, hoặc missile
  `MoveKind=5` → lấy `N` = số đạn thật.
- (`ByMissle` KHÔNG liên quan đến cơ chế này.)

**3. Chuỗi nhiều tầng phải tính NGÂN SÁCH TỔNG** — cộng sát thương của tất cả
các tầng rồi mới so với gốc. Không được cân riêng từng tầng.
Số lần sinh tầng con qua FlyEvent = `int(LifeTime ÷ FlyEventTime) + 1`
(ngoại lệ: khi `LifeTime == FlyEventTime` thì chỉ ra 1 lần).

**4. Dải hệ số thực tế đã được duyệt: ×1.2 – ×2.2.** Cao hơn dải này phải hỏi
lại trước khi áp dụng.

**5. Xác định đúng "bản gốc" — KHÔNG tin comment trong file.** Phải đối chiếu
`skills.txt`: cùng `MissleId`, `MisslesForm`, `ChildSkillNum`, `CharClass`,
`IsPhysical`, và thường cùng file icon `.spr`. (Đã từng ghi nhầm bản gốc trong
comment và tính ra hệ số ảo ×8.3 — thực tế chỉ ×1.44.)

## Hàm `Link()` và BẪY ngoại suy

Khi cấp **vượt quá mốc cuối cùng**, `Link()` **KHÔNG ghim giá trị** mà **ngoại
suy tuyến tính** theo độ dốc của đoạn cuối (nhánh `if(x > points[num][1])`):
`y(x) = (y2-y1)*(x-x1)/(x2-x1) + y1`

- **Dùng có chủ đích:** chốt mốc cuối ở cấp 20, để giá trị tự tăng đến cấp 25.
- **BẪY:** nếu hai mốc cuối quá gần nhau, độ dốc rất lớn và giá trị nổ tung.
  Ví dụ đã dính: `seriesdamage_p` với `{20,40},{21,45}` → cấp 25 ra **65%**
  (vượt trần 55); `skill_misslenum_v` ngoại suy từ 6 lên **7 đạn**.
- **Quy tắc cứng:** với mọi thuộc tính có **trần** (`seriesdamage_p` ≤55%,
  `skill_misslenum_v` phải khớp `ChildSkillNum`), **BẮT BUỘC** thêm mốc phẳng
  ở cấp ≥25; nếu còn lo thì thêm mốc giả `{30,X}` để chặn tuyệt đối.
- Lưu ý: giá trị trả về bị `floor()`, nên cổng dạng dốc `{{1,0},{20,1}}` thực
  chất TẮT suốt lv1–19 và chỉ BẬT ở lv20.
## Các lỗi cú pháp/dữ liệu thường gặp (đã từng phát hiện & sửa thật)

1. **"Comment nửa vời"**: chỉ comment (`--`) dòng ĐẦU của 1 khối nhiều
   dòng, các dòng còn lại bị lộ ra thành key trực tiếp của bảng cha → mất
   dữ liệu âm thầm hoặc đè lẫn nhau. Sửa: comment đủ MỌI dòng, hoặc dùng
   `--[[ ... ]]`.
2. **Thừa 1 dấu `}`**: đóng sớm 1 bảng đang mở → phá vỡ cấu trúc TOÀN BỘ
   phần còn lại của file (lỗi nghiêm trọng nhất). Phát hiện: đếm tổng số
   `{` và `}` toàn file (bỏ dòng comment) — không bằng nhau là có lỗi.
3. **Tên thuộc tính trong `LvlSetting` không khớp tên thật trong `.lua`**
   (vd `addskilldamage0` thay vì `addskilldamage2`): không lỗi cú pháp,
   chạy bình thường nhưng field đó LUÔN RỖNG — khó phát hiện nhất, chỉ qua
   đối chiếu thủ công.
4. **Giá trị bất thường so với quy luật chung** (vd `skill_cost_v` GIẢM
   theo cấp trong khi mọi skill khác đều tăng/giữ nguyên) — dấu hiệu gõ
   nhầm số liệu.
5. **Sao chép skill làm mẫu nhưng quên bật lại thuộc tính đã bị comment
   tắt** trong bản gốc trong khi các thuộc tính khác đã được chỉnh sửa có
   chủ đích.
6. **Trùng `SkillId`** giữa 2 nhóm skill không liên quan — engine dùng
   SkillId làm khóa tra cứu duy nhất, trùng ID gây xung đột dữ liệu.

## Quy trình kiểm tra bắt buộc trước khi bàn giao file `.lua`

1. **Đếm ngoặc `{`/`}` toàn file** (bỏ qua nội dung sau `--`) — phải bằng
   nhau tuyệt đối.
2. **Nạp thử bằng Lua interpreter thật** (không chỉ đếm ngoặc). Đây là bước
   DUY NHẤT bắt được lỗi tên thuộc tính sai sinh ra key trần (`3={...}`) —
   phép đếm ngoặc cho qua loại lỗi này.
   ```bash
   lua5.1 -e 'floor=math.floor; getn=table.getn; Include=function() end; dofile("file.lua"); for k in pairs(SKILLS) do print(k) end'
   ```
   *(`floor`/`getn` do engine tự cung cấp, Lua chuẩn không có — phải khai
   báo tay, nếu không sẽ báo lỗi giả.)*
   **Nếu máy KHÔNG có Lua** (tình trạng hiện tại của máy Windows này — không
   có `lua`, `python` thật hay `node`): bỏ qua bước này ở local, nhưng **bắt
   buộc** chạy quét cú pháp trên server sau khi đồng bộ và TRƯỚC khi reload.
3. **Đối chiếu tuyệt đối với bản gốc** khi chỉnh sửa file có sẵn: so sánh
   mã nguồn sau khi bỏ hết comment/khoảng trắng — phải khớp 100% ngoại trừ
   đúng những chỗ chủ đích thay đổi. Không được âm thầm làm mất skill/số
   liệu nào khi định dạng lại.
4. Kiểm tra `seriesdamage_p` không vượt 55% ở bất kỳ level nào.
5. Kiểm tra không có `physicsdamage_v` trên skill `IsPhysical=1`.
6. Kiểm tra `deadlystrike_p` không xuất hiện trên skill `IsPhysical=0`.
7. Kiểm tra `skill_showevent` là tập con của các event thực có, ở MỌI cấp.
8. Kiểm tra các thuộc tính có trần không bị `Link()` ngoại suy vượt ở cấp 25.

## Ghi chú về encoding (Windows/TCVN3)

Nhiều file gốc của dự án dùng **TCVN3** (mã `TCVN5712-1` trong `iconv`) cho
phần chú thích tiếng Việt, xen lẫn phần comment tiếng Trung ở encoding
khác (dữ liệu gốc từ server Trung Quốc). **Không tự tay ghép byte thủ
công** cho tiếng Việt có dấu — luôn dùng `iconv -f UTF-8 -t TCVN5712-1`
sau khi soạn nội dung bằng UTF-8 thường, để tránh lỗi ký tự. Nếu không
chắc chắn về encoding gốc của 1 file, ưu tiên viết **tiếng Việt KHÔNG DẤU**
trong code/comment mới thêm vào — an toàn tuyệt đối với mọi encoding.

## Phong cách làm việc mong muốn

- Khi chỉnh sửa file lớn, luôn xuất kèm tóm tắt rõ ràng: cái gì thay đổi,
  cái gì giữ nguyên, và bằng chứng đã kiểm tra (đếm ngoặc, nạp thử, so
  sánh gốc).
- Khi phát hiện nghi vấn (số liệu bất thường, cấu trúc lạ), chủ động nêu
  ra thay vì im lặng sửa hoặc im lặng bỏ qua.
- Khi có 2 hướng xử lý khả dĩ mà không chắc ý người dùng muốn gì (đặc biệt
  với việc merge/gộp dữ liệu giữa nhiều server, hoặc đổi ID/tên skill),
  hỏi rõ trước khi làm hàng loạt, tránh phải làm lại.
