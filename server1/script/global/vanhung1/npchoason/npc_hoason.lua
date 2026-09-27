--Edit by Youtube PGaming   --

hoason_parserby = {

{625,987,1391,3114,"\\script\\changefeature\\npc\\box.lua","R­¬ng chøa ®å"},

{103,987,1360,3081,"\\script\\global\\pgaming\\npchoason\\tieugiac.lua","Tiªu Gi¸c"},

{1325,987,1435,3162,"\\script\\global\\pgaming\\npchoason\\phudung.lua","Phô Dung"},

{1326,987,1305,3018,"\\script\\global\\pgaming\\npchoason\\lanvanmi.lua","LËn V©n Mi"}, 

{1574,987,1552,3136,"\\script\\global\\pgaming\\npchoason\\dato.lua","§¸ To"}, 

{357,987,1559,3136,"\\script\\activitysys\\npcdailog.lua","Phong Th¸i Linh"}, 

{1442,987,1559,3151,"\\script\\global\\pgaming\\npchoason\\tophong.lua","T« Phãng"}, 

{1323,987,1537,3166,"\\script\\global\\pgaming\\npchoason\\bachniencotung.lua","B¸ch niªn cæ tïng"}, 

{103,987,1430,2965,"\\script\\global\\pgaming\\npchoason\\thammac.lua","ThÈm M¹c"},

{103,100,1351,3253,"\\script\\global\\pgaming\\npchoason\\thammac2.lua","ThÈm M¹c"},

{1764,987,1506,2880,"\\script\\global\\pgaming\\npchoason\\tumo.lua","Tö Mé"}, 

{243,1,1598,3316,"\\script\\global\\pgaming\\npchoason\\luuvienngoai.lua","L­u Viªn Ngo¹i"}, 

{103,987,1487,3066,"\\script\\global\\pgaming\\npchoason\\tieungoc.lua","Tiªu Ngäc"}, 

{603,167,1642,2503,"\\script\\global\\pgaming\\npchoason\\hachoangdan.lua","H¾c Hoµng §µn"}, 

{603,167,1510,2472,"\\script\\global\\pgaming\\npchoason\\hachoangdan.lua","H¾c Hoµng §µn"}, 

{603,167,1370,2508,"\\script\\global\\pgaming\\npchoason\\hachoangdan.lua","H¾c Hoµng §µn"}, 

{289,78,1573,3198,"\\script\\global\\pgaming\\npchoason\\nhacminhphi.lua","Nh¹c Minh Phi"}, 

{613,78,1469,3559,"\\script\\global\\pgaming\\npchoason\\ao.lua","TÊm ¸o Nhuèm m¸u"}, 

{352,100,1719,3164,"\\script\\global\\pgaming\\npchoason\\cogaikhoc.lua","C« g¸i khãc"}, 

{749,987,1478,2840,"\\script\\global\\pgaming\\npchoason\\thacnuoc.lua","                "}, 

{103,987,1277,3035,"\\script\\global\\pgaming\\npchoason\\macphongnhu.lua","M¹c Phong Nhø"}, 
}

function add_allnpc_hoason()
	hoason_hoasonbynpc(hoason_parserby)
end

function hoason_hoasonbynpc(Tab)
	for i = 1 , getn(Tab) do 
		SId = SubWorldID2Idx(Tab[i][2]);
		if (SId >= 0) then
			npcindex = AddNpc(Tab[i][1],1,SId,Tab[i][3]*32,Tab[i][4]*32,1,Tab[i][6]);
			SetNpcScript(npcindex, Tab[i][5]);
		end;
	end	
end;

