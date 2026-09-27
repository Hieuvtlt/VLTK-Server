Include("\\script\\dailogsys\\dailogsay.lua")
TitleLQ = "<color=Orange>PGaming: <color>"

function DailyMuster() -- Main
	local TbOp = {}
	tinsert(TbOp, "T¹i h¹ ®Õn ®Ó ®iÓm danh!/GoMuster")
	tinsert(TbOp, "T¹i h¹ muèn xem sè l­ît ®iÓm danh cña m×nh./MyTimesMuster")
	tinsert(TbOp, "Ta muèn t×m hiÓu vÒ ho¹t ®éng nµy./AboutMuster")
	tinsert(TbOp, "KÕt thóc ®èi tho¹i./OnCancel")
	Say(TitleLQ.."Nh»m khÝch lÖ tinh thÇn th­îng vâ cña c¸c vâsÜ trung nguyªn, tÆng th­ëng cho c¸c ®¹i hiÖp cã ý   chÝ kiªn c­êng, luyÖn tËp chuyªn cÇn, §éc c« minh chñ"
			.."®· ®em ®Õn nh÷ng phÇn th­ëng hÊp dÉn vµ phong phó <enter>dµnh tÆng cho nh÷ng ng­êi xøng ®¸ng nhÊt!", getn(TbOp), TbOp)
end

TbAwardDailyMuster = 
{
	[1] = 
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 440, 0, 0,0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[2] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[3] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[4] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[5] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [7] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [8] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [9] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[2] =
		{
			[1] = {Item = {6, 0, 1, 1, 0,0, 0}, ItemName = "Tr­êng mÖnh hoµn",},
			[2] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia bµo hoµn",},
			[3] = {Item = {6, 1, 440, 0, 0,0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[4] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[5] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[6] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[7] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[8] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			-- [5] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[3] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0, 0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[2] = {Item = {6, 0, 6, 1, 0, 0, 0}, ItemName = "Phi tèc hoµn",},
			[3] = {Item = {6, 0, 2, 1, 0, 0, 0}, ItemName = "Gia bµo hoµn",},
			[4] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[5] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			-- [7] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [8] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			
			-- [6] = {Item = {6, 1, 904, 1, 0, 0, 0}, ItemName = "Qu¶ Huy Hoµng (thÊp)",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[4] =
		{
			[1] = {Item = {6, 0, 3, 1, 0, 0, 0}, ItemName = "§¹i lùc hoµn",},
			[2] = {Item = {6, 0, 4, 1, 0, 0, 0}, ItemName = "Cao thiÓm hoµn",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0, 0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[6] = {Item = {6, 1, 23, 0, 0, 0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [3] = {Item = {6, 1, 15, 0, 0, 0, 0}, ItemName = "Phi Phong",},
			-- [6] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [7] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[5] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0, 0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [3] = {Item = {6, 1, 904, 1, 0, 0, 0}, ItemName = "Qu¶ Huy Hoµng (thÊp)",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[2] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			[3] = {Item = {6, 0, 3, 1, 0, 0, 0}, ItemName = "§¹i lùc hoµn",},
			[4] = {Item = {6, 0, 4, 1, 0, 0, 0}, ItemName = "Cao thiÓm hoµn",},
			[5] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[6] = {Item = {6, 0, 6, 1, 0, 0, 0}, ItemName = "Phi tèc hoµn",},
			-- [7] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[6] =
		{
			-- [1] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [5] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [6] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			[1] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[2] = {Item = {6, 1, 23, 0, 0, 0, 0}, ItemName = "ThiÕt la h¸n",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[6] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[7] =
		{
			-- [1] = {Item = {6, 1, 905, 1, 0, 0, 0}, ItemName = "Qu¶ Huy Hoµng (trung)",},
			-- [2] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [4] = {Item = {6, 1, 23, 0, 0, 0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[2] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[3] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[4] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[5] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[8] =
		{
			[1] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[2] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[3] = {Item = {6, 1, 23, 0, 0, 0, 0}, ItemName = "ThiÕt la h¸n",},
			[4] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[5] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[6] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[7] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [4] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [5] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[9] =
		{
			
			-- [2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			-- [3] = {Item = {6, 1, 125, 0, 0, 0, 0}, ItemName = "QuÕ Hoa Töu",},
			-- [4] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [6] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			-- [2] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[2] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[6] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [12] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [13] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [14] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[10] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[3] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[4] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[5] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[6] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[7] = {Item = {6, 1, 71, 0, 0, 0, 0}, ItemName = "Tiªn Th¶o Lé",},
			[8] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[9] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [3] = {Item = {6, 1, 124, 0, 0, 0, 0}, ItemName = "Phóc Duyªn Lé (§¹i)",},
			-- [6] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			-- [9] = {Item = {6, 1, 1257, 0, 0, 0, 0}, ItemName = "LÖnh bµi vinh dù Hµn thiÕt",},
			-- [10] = {Item = {6, 1, 1448, 0, 0, 0, 0}, ItemName = "M¹c B¾c TruyÒn Tèng LÖnh",},
			-- [14] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [15] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [16] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[11] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [4] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [5] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[2] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[3] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[4] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[5] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[12] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[6] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [5] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [9] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [10] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
			
		},
	[13] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [3] = {Item = {6, 1, 123, 0, 0, 0, 0}, ItemName = "Phóc Duyªn Lé (Trung)",},
			-- [4] = {Item = {6, 1, 906, 1, 0, 0, 0}, ItemName = "Qu¶ Huy Hoµng (cao)",},
			-- [6] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[1] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[14] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [2] = {Item = {6, 1, 1392, 0, 0, 0, 0}, ItemName = "Hép lÔ vËt v­ît ¶i",},
			-- [3] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			-- [4] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [5] = {Item = {6, 1, 71, 0, 0, 0, 0}, ItemName = "Tiªn Th¶o Lé",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[15] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[2] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[3] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[4] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[5] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[6] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [6] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[16] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[6] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [4] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [9] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [10] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[17] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[2] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[3] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[4] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[5] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[6] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [6] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[18] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[3] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[4] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[5] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[6] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			-- [3] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			-- [4] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [6] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[19] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[5] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[6] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [4] = {Item = {6, 1, 906, 1, 0, 0, 0}, ItemName = "Qu¶ Huy Hoµng (cao)",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[20] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[3] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[4] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[5] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[6] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[7] = {Item = {6, 1, 71, 0, 0, 0, 0}, ItemName = "Tiªn Th¶o Lé",},
			[8] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			[9] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[10] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [3] = {Item = {6, 1, 906, 0, 0, 0, 0}, ItemName = "Qu¶ Huy Hoµng (cao)",},
			-- [4] = {Item = {6, 1, 124, 0, 0, 0, 0}, ItemName = "Phóc Duyªn Lé (§¹i)",},
			-- [10] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [11] = {Item = {6, 1, 1257, 0, 0, 0, 0}, ItemName = "LÖnh bµi vinh dù Hµn thiÕt",},
			-- [12] = {Item = {6, 1, 1448, 0, 0, 0, 0}, ItemName = "M¹c B¾c TruyÒn Tèng LÖnh",},
			-- [16] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [17] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [18] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[21] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[1] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh s¬n hµ x· t¾c x100",},
			[3] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[6] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [4] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [5] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[22] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[3] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[4] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[5] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[6] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[7] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[8] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [5] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[23] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [2] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [5] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[2] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[3] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[24] =
		{
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[3] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[4] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[5] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[6] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[7] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[8] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[9] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			-- [2] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			-- [8] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [12] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [13] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [14] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[25] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [2] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[2] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[3] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[4] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[5] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[6] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[7] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[26] =
		{
			-- [2] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			-- [3] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[3] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[4] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[5] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[6] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[7] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[8] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[9] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [12] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [13] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [14] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[27] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [2] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[2] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[3] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[4] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[5] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[6] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[7] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[28] =
		{
			-- [2] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			[2] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[3] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[4] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[5] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[6] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[7] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[8] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[29] =
		{
			-- [1] = {Item = {6, 1, 23, 0, 0,0, 0}, ItemName = "ThiÕt la h¸n",},
			-- [2] = {Item = {6, 1, 400, 90, random(0,4), 0, 0}, ItemName = "S¸t thñ gi¶n",},
			[1] = {Item = {6, 1, 440, 0, 0, 0, 0}, ItemName = "M¶nh S¬n Hµ X· T¾c (100)",},
			[2] = {Item = {6, 1, 72, 0, 0, 0, 0}, ItemName = "Thiªn s¬n B¶o Lé",},
			[3] = {Item = {6, 1, 73, 0, 0, 0, 0}, ItemName = "B¸ch Qu¶ Lé",},
			[4] = {Item = {6, 1, 155, 0, 0,0, 0}, ItemName = "Phong V©n Chiªu th­",},
			[5] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[6] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[7] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			-- [10] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [11] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [12] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[30] =
		{
			[1] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			[2] = {Item = {6, 1, 71, 0, 0, 0, 0}, ItemName = "Tiªn Th¶o Lé",},
			[3] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[4] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[5] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[6] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[7] = {Item = {6, 1, 12, 0, 0, 0, 0}, ItemName = "Bµn Nh­îc T©m Kinh",},
			-- [6] = {Item = {6, 1, 124, 0, 0, 0, 0}, ItemName = "Phóc Duyªn Lé (§¹i)",},
			-- [2] = {Item = {6, 1, 2424, 4, 0, 0, 0}, ItemName = "§¹i Thµnh BÝ KÝp 90",},
			-- [4] = {Item = {6, 1, 26, 0, 0, 0, 0}, ItemName = "Vâ L©m MËt TÞch",},
			-- [5] = {Item = {6, 1, 22, 0, 0, 0, 0}, ItemName = "TÈy Tñy Kinh",},
			-- [7] = {Item = {6, 1, 1427, 0, 0, 0, 0}, ItemName = "Tö MÉu LÖnh",},
			-- [8] = {Item = {6, 1, 1448, 0, 0, 0, 0}, ItemName = "M¹c B¾c TruyÒn Tèng LÖnh",},
			-- [9] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [11] = {Item = {6, 1, 1257, 0, 0, 0, 0}, ItemName = "LÖnh bµi vinh dù Hµn thiÕt",},
			-- [16] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [17] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [18] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[40] =
		{
			[1] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			[2] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[3] = {Item = {6, 1, 71, 0, 0, 0, 0}, ItemName = "Tiªn Th¶o Lé",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[6] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[7] = {Item = {6, 1, 1427, 0, 0, 0, 0}, ItemName = "Tö MÉu LÖnh",},
			[8] = {Item = {6, 1, 12, 0, 0, 0, 0}, ItemName = "Bµn Nh­îc T©m Kinh",},
			-- [3] = {Item = {6, 1, 26, 0, 0, 0, 0}, ItemName = "Vâ L©m MËt TÞch",},
			-- [4] = {Item = {6, 1, 22, 0, 0, 0, 0}, ItemName = "TÈy Tñy Kinh",},
			-- [5] = {Item = {6, 1, 124, 0, 0, 0, 0}, ItemName = "Phóc Duyªn Lé (§¹i)",},
			-- [7] = {Item = {6, 1, 1448, 0, 0, 0, 0}, ItemName = "M¹c B¾c TruyÒn Tèng LÖnh",},
			-- [8] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [10] = {Item = {6, 1, 1257, 0, 0, 0, 0}, ItemName = "LÖnh bµi vinh dù Hµn thiÕt",},
			-- [15] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [16] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [17] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[50] =
		{
			[1] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			[2] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[3] = {Item = {6, 1, 12, 0, 0, 0, 0}, ItemName = "Bµn Nh­îc T©m Kinh",},
			[4] = {Item = {6, 1, 71, 0, 0, 0, 0}, ItemName = "Tiªn Th¶o Lé",},
			[5] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[6] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[7] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			-- [3] = {Item = {6, 1, 26, 0, 0, 0, 0}, ItemName = "Vâ L©m MËt TÞch",},
			-- [4] = {Item = {6, 1, 22, 0, 0, 0, 0}, ItemName = "TÈy Tñy Kinh",},
			-- [5] = {Item = {6, 1, 124, 0, 0, 0, 0}, ItemName = "Phóc Duyªn Lé (§¹i)",},
			-- [6] = {Item = {6, 1, 1427, 0, 0, 0, 0}, ItemName = "Tö MÉu LÖnh",},
			-- [7] = {Item = {6, 1, 1448, 0, 0, 0, 0}, ItemName = "M¹c B¾c TruyÒn Tèng LÖnh",},
			-- [8] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [10] = {Item = {6, 1, 1257, 0, 0, 0, 0}, ItemName = "LÖnh bµi vinh dù Hµn thiÕt",},
			-- [15] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [16] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [17] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
	[60] =
		{
			[1] = {Item = {4, 489, 0, 0, 0, 0, 0}, ItemName = "LÖnh bµi Phong L¨ng §é",},
			[2] = {Item = {6, 1, 910, 0, 0, 0, 0}, ItemName = "Bao D­îc hoµn",},
			[3] = {Item = {6, 1, 71, 0, 0, 0, 0}, ItemName = "Tiªn Th¶o Lé",},
			[4] = {Item = {6, 0, 6, 1, 0,0, 0}, ItemName = "Phi tèc hoµn",},
			[5] = {Item = {6, 0, 2, 1, 0,0, 0}, ItemName = "Gia Bµo hoµn",},
			[6] = {Item = {6, 0, 3, 1, 0,0, 0}, ItemName = "§¹i Lùc hoµn",},
			[7] = {Item = {6, 1, 1427, 0, 0, 0, 0}, ItemName = "Tö MÉu LÖnh",},
			[8] = {Item = {6, 1, 12, 0, 0, 0, 0}, ItemName = "Bµn Nh­îc T©m Kinh",},
			-- [3] = {Item = {6, 1, 124, 0, 0, 0, 0}, ItemName = "Phóc Duyªn Lé (§¹i)",},
			-- [5] = {Item = {6, 1, 1448, 0, 0, 0, 0}, ItemName = "M¹c B¾c TruyÒn Tèng LÖnh",},
			-- [6] = {Item = {6, 1, 2425, 4, 0, 0, 0}, ItemName = "§¹i Thµnh BÝ KÝp 120",},
			-- [7] = {Item = {6, 1, 1617, 0, 0,0, 0}, ItemName = "Viªm ®Õ lÖnh",},
			-- [9] = {Item = {6, 1, 1257, 0, 0, 0, 0}, ItemName = "LÖnh bµi vinh dù Hµn thiÕt",},
			-- [14] = {Item = {6, 1, 150, 1, random(0,4),0, 0}, ItemName = "Khæng T­íc Nguyªn Th¹ch",},
			-- [15] = {Item = {6, 1, 152, 1, random(0,4),0, 0}, ItemName = "Phï Dung Nguyªn Th¹ch",},
			-- [16] = {Item = {6, 1, 154, 1, random(0,4),0, 0}, ItemName = "Chung Nhò Nguyªn Th¹ch",},
		},
}

-- TbAwardDailyMusterEXP = {
	-- [10] = {10000000, "10 TriÖu"},
	-- [20] = {20000000, "20 TriÖu"},
	-- [30] = {30000000, "30 TriÖu"},
	-- [40] = {40000000, "40 TriÖu"},
	-- [50] = {50000000, "50 TriÖu"},
	-- [60] = {60000000, "60 TriÖu"},
-- }
TbAwardDailyMusterEXP = {
	[10] = {5000000, "5 TriÖu"},
	[20] = {10000000, "10 TriÖu"},
	[30] = {15000000, "15 TriÖu"},
	[40] = {20000000, "20 TriÖu"},
	[50] = {25000000, "25 TriÖu"},
	[60] = {30000000, "30 TriÖu"},
}

function Award2Player(Sel)
	Msg2Player("PhÇn th­ëng ®iÓm danh lÇn thø: <color=yellow>"..GetTask(4165))
	local SelExp = Sel
	if SelExp > 60 then SelExp = 60 end
	if(mod(SelExp, 10) == 0) then
		AddOwnExp(TbAwardDailyMusterEXP[SelExp][1])
		Msg2Player("<color=yellow>NhËn th­ëng thªm "..TbAwardDailyMusterEXP[SelExp][2].." ®iÓm kinh nghiÖm!")
		Msg2SubWorld("<color=yellow>Ng­êi ch¬i "..GetName().." ®iÓm danh lÇn thø "..GetTask(4165).." ®· nhËn th­ëng thªm "..TbAwardDailyMusterEXP[SelExp][2].." ®iÓm kinh nghiÖm!")
		AddLocalNews("<color=yellow>Ng­êi ch¬i "..GetName().." ®iÓm danh lÇn thø "..GetTask(4165).." ®· nhËn th­ëng thªm "..TbAwardDailyMusterEXP[SelExp][2].." ®iÓm kinh nghiÖm!")
	end
	if Sel > 30 and Sel < 40 then
		Sel = Sel - 30
	elseif Sel > 40 and Sel < 50 then
		Sel = Sel - 30
	elseif Sel > 50 and Sel < 60 then
		Sel = Sel - 30
	elseif Sel > 60 and Sel < 120 then
		Sel = Sel - 60
	end
	for Loop = 1, getn(TbAwardDailyMuster[Sel]) do
		-- local nItemIndex = AddItem(unpack(TbAwardDailyMuster[Sel][Loop].Item))
		local nItemIndex = AddItemNoStack(unpack(TbAwardDailyMuster[Sel][Loop].Item))
		if (TbAwardDailyMuster[Sel][Loop].Item[3] ~= 150 and TbAwardDailyMuster[Sel][Loop].Item[3] ~= 152 and TbAwardDailyMuster[Sel][Loop].Item[3] ~= 154) then
			SetItemBindState(nItemIndex, -2)
		end
		Msg2Player("<color=yellow>"..TbAwardDailyMuster[Sel][Loop].ItemName)
	end
	return Talk(1, "MyTimesMuster", TitleLQ.."§· tiÕn hµnh ®iÓm danh lÇn thø <color=green>"..GetTask(4165).."<color> thµnh c«ng!")
end

function ProcMusterDayTimes(DateMuster, NowDateMuster)
	local TD, ND = DateMuster, NowDateMuster
	local DTs, MonthTD, MonthND = 0, tonumber(strsub(TD, 3, 4)), tonumber(strsub(ND, 3, 4))
	if MonthND > MonthTD then
		if tonumber(strsub(TD, 5, 6)) == 30 or tonumber(strsub(TD, 5, 6)) == 31 then
			return tonumber(strsub(ND, 5, 6)) + (((MonthND - MonthTD) * 30) - 30)
		else
			return ((30 - tonumber(strsub(TD, 5, 6))) + tonumber(strsub(ND, 5, 6))) + (((MonthND - MonthTD) * 30) - 30)
		end
	else
		return ND - TD
	end
end

function GoMuster()
	local NowTimes, DateMuster, NowDateMuster = GetTask(4165), GetTask(4166), tonumber(date("%y%m%d"))
	if DateMuster >= NowDateMuster then
		return Say(TitleLQ.."H«m nay ®¹i hiÖp ®· tiÕn hµnh ®iÓm danh råi,h·y ®îi ®Õn h«m sau ®iÓm danh tiÕp, c¸c phÇn th­ëng  cña ngµy h«m sau cã thÓ xem ë môc xem sè l­ît ®iÓm   danh cña m×nh!", 1, "Ta biÕt råi!/OnCancel")
	end
	
	local checkNot = nil
	local checkNot_nowDay = tonumber(date("%d"))
	local checkNot_nowMonth = tonumber(date("%m"))
	
	if ((checkNot_nowMonth - 1) == 2) and (tonumber(date("%y")..(checkNot_nowMonth - 1).."28") > DateMuster) then
		checkNot = 1
		SetTask(4167, (NowDateMuster - ((tonumber(date("%y")..(checkNot_nowMonth - 1).."28") - DateMuster)) + 1))
	elseif (tonumber(date("%y")..(checkNot_nowMonth - 1).."30") > DateMuster) then
		checkNot = 1
		SetTask(4167, (NowDateMuster - ((tonumber(date("%y")..(checkNot_nowMonth - 1).."30") - DateMuster)) + 1))
	end
	
	------------------------------------------------------------------------------ FIX BUG IN MONTH 10.2017 ---------------------------------------------------------------------------------
		
		if (checkNot_nowMonth == 1 or checkNot_nowMonth == 2 or checkNot_nowMonth == 3 or checkNot_nowMonth == 4 or checkNot_nowMonth == 5 or checkNot_nowMonth == 6 or checkNot_nowMonth == 7 or checkNot_nowMonth == 8 or checkNot_nowMonth == 9 or checkNot_nowMonth == 10 or checkNot_nowMonth == 11 or checkNot_nowMonth == 12) and (GetTask(4167) <= 181230 or GetTask(4167) <= 190130 or GetTask(4167) <= 190228 or GetTask(4167) <= 190330 or GetTask(4167) <= 190430 or GetTask(4167) <= 190530 or GetTask(4167) <= 190630 or GetTask(4167) <= 190730 or GetTask(4167) <= 190830 or GetTask(4167) <= 190930 or GetTask(4167) <= 191030 or GetTask(4167) <= 191130 or GetTask(4167) <= 191230) then
			SetTask(4167, (NowDateMuster - 1))
		end
	------------------------------------------------------------------------------ FIX BUG IN MONTH 10.2017 ---------------------------------------------------------------------------------
	
	DateMuster = GetTask(4167)
	
	if (DateMuster < NowDateMuster - 1) and DateMuster ~= 0 then
		local MissDayTimes = ProcMusterDayTimes(DateMuster, NowDateMuster)
		return Say(TitleLQ.."VÞ ®¹i hiÖp ®· lì mÊt nhÞp ®iÓm danh liªn <enter>tôc cña m×nh, thêi gian ®iÓm danh lÇn tr­íc c¸ch ®©y ®· <color=yellow>"..MissDayTimes.."<color> ngµy, nÕu kh«ng ®iÓm danh bï th× sè lÇn ®iÓm <enter>danh míi sÏ b¾t ®Çu l¹i tõ ®Çu!", 3, 
							"Ngµi gióp ta ®iÓm danh bï l¹i c¸c ngµy ®· v¾ng!./RecompenseMuster",
							"Th«i, ta muèn ®iÓm danh l¹i tõ ®Çu./NewMuster",
							"Ngµi cho ta suy nghÜ l¹i ®·!/OnCancel"
							)
	end
	
	local a = (GetTask(4165) + 1)
	
	if a > 30 then
		if mod(a, 10) == 0 then
			a = (a > getn(TbAwardDailyMuster)) and getn(TbAwardDailyMuster) or a
		else
			a = (a - (floor(a/30) * 30))
		end
	end
	
	if CalcFreeItemCellCount() < getn(TbAwardDailyMuster[a]) then
		return Say(TitleLQ.."§Ó nhËn th­ëng yªu cÇu ®¹i hiÖp h·y s¾p xÕp l¹i hµnh trang cña m×nh, cßn Ýt nhÊt <color=green>"..(getn(TbAwardDailyMuster[a])).." <color>« trèng!",0)
	end
	SetTask(4165, GetTask(4165) + 1)
	SetTask(4166, NowDateMuster)
	return Award2Player(a)
end

function RecompenseMuster()
	local MissDayTimes = ProcMusterDayTimes(GetTask(4166), tonumber(date("%y%m%d")))
	Talk(2, "RecompenseMusterInput", TitleLQ.."§¹i hiÖp ®· bá lì mÊt <color=yellow>"..MissDayTimes.."<color> lÇn ®iÓm danh, v× <enter>vËy §éc c« minh chñ cÇn thu håi <color=yellow>"..MissDayTimes.."<color> <color=fire>Tö thñy tinh<color> ®Ó bï cho sè ngµy ®· bá.", "PhÇn th­ëng cña c¸c ngµy h«m tr­íc ®· bá sÏ kh«ng thÓnhËn l¹i, chØ cã thÓ nhËn phÇn th­ëng cña ngµy h«m <enter>nay th«i!")
end

function RecompenseMusterInput()
	local TimesLost =  ProcMusterDayTimes(GetTask(4166), tonumber(date("%y%m%d")))
	return GiveItemUI("§iÓm danh bï "..TimesLost.." lÇn","Xin ®Æt "..TimesLost.." Tö thñy tinh cho "..TimesLost.." lÇn ®iÓm danh bï", "RecompenseMusterSure", "OnCancel" );
end

function RecompenseMusterSure(Count)
	local TimesLost =  ProcMusterDayTimes(GetTask(4166), tonumber(date("%y%m%d")))
	local IdxItem
	if Count ~= TimesLost then
		return Say(TitleLQ.."§éc c« minh chñ chØ cÇn <color=yellow>"..TimesLost.."<color><color=fire> Tö thñy tinh!<color>", 2, "Ta nhÇm, ®Ó ta ®Æt l¹i/RecompenseMusterInput", "Ah, ta quªn mÊt, ®Ó ta ®i lÊy lÔ vËt./OnCancel")
	end
	for i = 1, Count do
		IdxItem = GetGiveItemUnit(i)
		G, D, P = GetItemProp(IdxItem)
		if G ~= 4 and D ~= 239 then
			return Say(TitleLQ.."§éc c« minh chñ chØ cÇn <color=yellow>"..TimesLost.."<color><color=fire> Tö thñy tinh!<color>", 2, "Ta nhÇm, ®Ó ta ®Æt l¹i/RecompenseMusterInput", "Ah, ta quªn mÊt, ®Ó ta ®i lÊy lÔ vËt./OnCancel")
		end
	end
	for i = 1, Count do
		IdxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(IdxItem);
	end
	SetTask(4165, GetTask(4165) + Count)
	SetTask(4166, tonumber(date("%y%m%d")))
	return Award2Player(GetTask(4165))
end

function NewMuster()
	return Say(TitleLQ.."§Ó tiÕn hµnh ®iÓm danh l¹i, toµn bé sè lÇn ®iÓm danh tr­íc ®©y sÏ bÞ xãa bá vµ trë vÒ vÞ trÝ xuÊt ph¸t, cßn rÊt nhiÒu phÇn th­ëng kh«ng thÓ ngê ®Õn ë ®»ng sau ng­¬i kh«ng hèi tiÕc µ?", 2, "Ta ®· suy nghÜ kü, muèn ®iÓm danh l¹i!/NewMusterSure", "Ngµi cho ta suy nghÜ l¹i c¸i ®·!/OnCancel")
end

function NewMusterSure()
	SetTask(4165, 1)
	SetTask(4166, tonumber(date("%y%m%d")))
	return Award2Player(GetTask(4165))
end

function MyTimesMuster()
	local a = (GetTask(4165) + 1)
	
	if a > 30 then
		if mod(a, 10) == 0 then
			a = (a > getn(TbAwardDailyMuster)) and getn(TbAwardDailyMuster) or a
		else
			a = (a - (floor(a/30) * 30))
		end
	end
	
	local StrItem = ""
	for i = 1, getn(TbAwardDailyMuster[a]) do 
		StrItem = StrItem..TbAwardDailyMuster[a][i].ItemName.."\n"
	end
	-- CreateNewSayEx(TitleLQ.."Tæng sè l­ît ®iÓm danh liªn tôc cña ®¹i hiÖp lµ: <color=green>"..Times.."<color>, PhÇn th­ëng cho lÇn ®iÓm danh kÕ tiÕp lµ:<enter><color=yellow>"..StrItem.."<color>", {{"Ta biÕt råi!", OnCancel},})
	CreateNewSayEx("<npc>Tæng sè l­ît ®iÓm danh liªn tôc cña ®¹i hiÖp lµ: <color=green>"..(GetTask(4165)).."<color>, PhÇn th­ëng cho lÇn ®iÓm danh kÕ tiÕp lµ:<enter><color=yellow>"..StrItem.."<color>", {{"Ta biÕt råi!", OnCancel},})
end

function AboutMuster()
	-- CreateNewSayEx(TitleLQ.."§iÓm danh h»ng ngµy sÏ nhËn ®­îc nh÷ng <color=green>phÇn  th­ëng phong phó<color>, cã gi¸ trÞ tõ §éc c« minh chñ, yªu  cÇu ng­êi ®iÓm danh ph¶i <color=yellow>liªn tôc<color> nÕu muèn nhËn phÇn  th­ëng cña ngµy tiÕp theo, nÕu trong ngµy tiÕp theo   kh«ng ®iÓm danh th× <color=yellow>tæng sè l­ît ®iÓm danh ®­îc sÏ b¾t®Çu l¹i tõ ®Çu<color>, §éc c« minh chñ cÇn nh÷ng ng­êi cã <enter>tÝnh kiªn tr× vµ khæ luyÖn!, danh s¸ch c¸c phÇn th­ëng®¹i hiÖp cã thÓ tham kh¶o ë <color=green>CÈm Nang §ång Hµnh<color>.", {{"Ta biÕt råi!", OnCancel},})
	CreateNewSayEx("<npc>§iÓm danh h»ng ngµy sÏ nhËn ®­îc nh÷ng <color=green>phÇn  th­ëng phong phó<color>, cã gi¸ trÞ tõ §éc c« minh chñ, yªu  cÇu ng­êi ®iÓm danh ph¶i <color=yellow>liªn tôc<color> nÕu muèn nhËn phÇn  th­ëng cña ngµy tiÕp theo, nÕu trong ngµy tiÕp theo   kh«ng ®iÓm danh th× <color=yellow>tæng sè l­ît ®iÓm danh ®­îc sÏ b¾t®Çu l¹i tõ ®Çu<color>, §éc c« minh chñ cÇn nh÷ng ng­êi cã <enter>tÝnh kiªn tr× vµ khæ luyÖn!, danh s¸ch c¸c phÇn th­ëng®¹i hiÖp cã thÓ tham kh¶o ë <color=green>CÈm Nang §ång Hµnh<color>.", {{"Ta biÕt råi!", OnCancel},})
end

function OnCancel() end