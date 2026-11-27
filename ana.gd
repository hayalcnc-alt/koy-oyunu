extends Node3D
# Köyden İndim Şehire — Godot deneme sürümü: köy zemini, kamera, binalar, inekler.

const MALZEME := {"AhsapKoyu": "#5a3d27", "AhsapAcik": "#a67c53", "Tas": "#a7a298", "KabaTas": "#858077", "Siva": "#ece3d0", "Cam": "#26343a", "Cicek": "#a8434f", "Demir": "#4a4f55", "Kiremit": "KIREMIT", "Toprak": "#6e5034", "Ates": "#ff7a1a", "Su": "#2f5f70", "KumasYesil": "#4f6b3f", "Cim": "#6f8f3e", "KayaTas": "#bdb7ac", "Kumas": "#d9c9a8", "KumasKirmizi": "#a83a2e", "KumasMavi": "#3e5f8a", "KumasSari": "#d9a83a", "Elma": "#c4302b", "Sebze": "#6a9a2c", "Cuval": "#c4a160", "Bugday": "#c9a24a", "Yaprak": "#2f5a24", "Marul": "#6a9a2c", "Kursun": "#8d99a3", "Altin": "#d4a933", "Asfalt": "#2e2e30", "Lastik": "#161616", "Beton": "#6e6e6a", "Ic": "#2e2b28", "Bakir": "#b0652a", "Mdf": "#c9a06a", "Beyaz": "#e8e6e0", "Sac": "#7d848b", "Servi": "#1f3a1f", "Patika": "#7a6a50", "Mermer": "#d8d6cf", "Panel": "#1c2c5a", "SeraCam": "#b9d6dc"}
const CATI := ["#9c4b35", "#8a4232", "#a8603f", "#5d646c", "#6e4b33"]
const OLCEK := {"fenisleri": 1.86, "kooperatif": 1.86, "hayiryeri": 2.9, "liman": 5.9, "meydan": 2.9, "karacadir": 1.0, "yukyeri": 1.82, "cadir": 1.5, "apartman": 0.92, "lokma": 0.42, "site": 1.86, "rezidans": 1.86, "hastane": 2.9, "universite": 2.9, "stadyum": 2.9, "esnafodasi": 1.86, "bayi": 1.86, "muhasebe": 0.92, "dayibasi": 0.92, "besi": 1.86, "karakol": 1.86, "itfaiye": 1.86, "fabrika": 1.86, "otogar": 1.86, "lise": 1.86, "saglik": 1.86, "belediye": 1.86, "gunes": 1, "ruzgar": 0.7, "maden": 0.9, "kuyumcu": 0.86, "sera": 0.9, "hamam": 1.86, "sifa": 0.86, "han": 1.86, "tarla": 0.96, "keresteci": 0.86, "kovan": 0.84, "elma": 0.66, "armut": 0.66, "atcilik": 1.86, "degirmen": 0.84, "firin": 0.84, "mandira": 0.84, "dokuma": 0.84, "kumes": 1.9, "ahir": 1.9, "agil": 1.9, "kahvehane": 1.86, "bakkal": 0.86, "berber": 0.86, "okul": 1.86, "park": 1.86, "hal": 2.9, "lojman": 0.96, "mezarlik": 1.86, "mezar": 0.33, "elektrikci": 0.86, "bobinaj": 0.86, "torna": 0.86, "cnc": 1.86, "benzinlik": 1.86, "cami": 1.86, "muhtar": 1.86, "ambar": 1.82, "bahce": 1.0, "ev": 1.0, "demirci": 1.0, "kuyu": 0.9, "oduncu": 1.0, "ocak": 1.0, "pazar": 2.0}
const TIPMAP := {"ece3d0": "siva", "e2d4b6": "siva", "4b3222": "ahsap", "8a6241": "ahsap", "a67c53": "ahsap", "5a3d27": "ahsap", "5b3a22": "ahsap", "7a4a2c": "ahsap", "5e3d26": "ahsap", "a7a298": "tas", "858077": "tas", "bdb7ac": "tas", "9c4b35": "kiremit", "8a4232": "kiremit", "a8603f": "kiremit", "5d646c": "kiremit", "6e4b33": "kiremit", "56606b": "kiremit", "8a4a33": "kiremit", "c49b45": "saman", "d9bc6a": "saman", "c4a160": "saman", "6e5034": "toprak", "9b8a72": "toprak", "6f8f3e": "cim", "4a4f55": "metal", "7d848b": "metal", "26343a": "cam", "2f5f70": "su", "ff7a1a": "ates", "e6e0d2": "kumas", "8c3b32": "kumas", "3e5a7a": "kumas", "b08a3a": "kumas", "4f6b3f": "kumas", "6b4a6e": "kumas", "d9534f": "kumas", "f0b429": "kumas", "8a6a48": "toprak", "7a5a3a": "toprak", "5c4128": "toprak", "6a4a30": "toprak", "4a3524": "toprak"}
const TRI := {"siva": ["siva", 1.4, 0.95, 1.35], "tas": ["tas", 2.4, 0.92, 1.35], "kaya": ["kaya", 1.8, 0.9, 1.35], "ahsap": ["ahsap", 2.2, 0.82, 1.35], "kiremit": ["kiremit", 3.0, 0.78, 1.5], "saman": ["saman", 2.6, 0.95, 1.35], "toprak": ["toprak", 1.2, 0.98, 1.35], "cim": ["cim", 0.22, 0.96, 1.35], "kum": ["kum", 0.6, 0.97, 1.35], "yaprak": ["yaprak", 2.4, 0.85, 1.25], "metal": ["metal", 2.0, 0.42, 1.1], "kumas": ["kumas", 4.0, 0.95, 1.15], "cam": ["", 1.0, 0.12, 1.35], "su": ["", 1.0, 0.1, 1.35], "duz": ["", 1.0, 0.8, 1.35], "kabuk": ["kabuk", 3.5, 0.92, 1.35]}
const BOY := {"ev": 1, "gunes": 1, "ruzgar": 1, "maden": 1, "kuyumcu": 1, "sera": 1, "hamam": 2, "sifa": 1, "han": 2, "kahvehane": 2, "bakkal": 1, "berber": 1, "okul": 2, "benzinlik": 2, "bahce": 1, "tarla": 1, "ambar": 2, "oduncu": 1, "ocak": 1, "kumes": 2, "degirmen": 1, "demirci": 1, "esnafodasi": 2, "kooperatif": 2, "bayi": 2, "muhasebe": 1, "dayibasi": 1, "besi": 2, "ahir": 2, "kuyu": 1, "firin": 1, "pazar": 2, "mandira": 1, "agil": 2, "kovan": 1, "elma": 1, "armut": 1, "dokuma": 1, "balikci": 1, "iskele": 1, "asfalt": 1, "yol": 1, "kopru": 1, "cit": 1, "muhtar": 2, "meydan": 3, "park": 2, "cami": 2, "mezarlik2": 2, "mezarlik": 2, "atcilik": 2, "keresteci": 1, "elektrikci": 1, "bobinaj": 1, "torna": 1, "cnc": 2, "hal": 3, "hayiryeri": 3, "liman": 3, "cadir": 1, "apartman": 1, "hastane": 3, "universite": 3, "stadyum": 3, "site": 2, "rezidans": 2, "teras": 1, "lojman": 1, "lamba": 1, "lise": 2, "saglik": 2, "otogar": 2, "fabrika": 2, "karakol": 2, "itfaiye": 2, "imar_konut": 2, "imar_carsi": 2, "imar_sanayi": 2, "fenisleri": 2, "belediye": 2, "kale": 3}
const KARO := 1.0
const HAYVAN_TUR := {"ahir": ["hayvan_inek", 2, 1.1, 0.18], "agil": ["hayvan_koyun", 2, 1.1, 0.18], "kumes": ["hayvan_tavuk", 3, 1.2, 0.35]}
var hayvanlar := []
const WN := 126
const YARI := 63.0
const N := 24
# [model, x, z, boy (karo), dönüş (0-3)]
const BINALAR := [
	["ev", 9, 10, 1, 0], ["ev", 11, 10, 1, 0], ["ev", 13, 10, 1, 0], ["ev", 9, 13, 1, 2],
	["muhtar", 11, 13, 2, 2], ["ambar", 14, 13, 2, 2], ["ahir", 6, 6, 2, 0], ["kumes", 9, 6, 1, 0],
	["agil", 11, 6, 2, 0], ["mandira", 14, 6, 1, 0], ["firin", 15, 10, 1, 0], ["degirmen", 17, 6, 1, 0],
	["kuyu", 12, 12, 1, 0], ["tarla", 5, 14, 2, 0], ["tarla", 5, 17, 2, 0], ["tarla", 8, 17, 2, 0],
]
const AGACLAR := [[3, 4, "elma"], [4, 9, "armut"], [18, 13, "elma"], [19, 9, "armut"], [16, 17, "elma"], [2, 12, "elma"], [20, 4, "armut"]]

var kamera: Camera3D
var hedef := Vector3(12, 0, 11)
var mesafe := 17.0
var aci_y := deg_to_rad(45.0)
var dokunuslar := {}
var inekler := []
var kare := 0
var gunes: DirectionalLight3D
var ortam_e: Environment
var saat_arg := -1.0
var dokun_arg := Vector2(-1, -1)
var insa_arg := ""
var onay_arg := false
var dugme_arg := false
var sec_arg := -1
const GUN_SN := 2880.0
const SAAT_SN := 120.0
const GUNDUZ_PAY := 0.8
var ekran_yolu := ""
var mesafe_arg := 0.0
var kayit_adi := "ornek"
var hedef_arg := Vector3.ZERO

func _ready():
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--ekran="): ekran_yolu = a.substr(8)
		if a.begins_with("--dokun="): var q = a.substr(8).split(","); dokun_arg = Vector2(float(q[0]), float(q[1]))
		if a.begins_with("--insa="): insa_arg = a.substr(7)
		if a.begins_with("--onay"): onay_arg = true
		if a.begins_with("--dugme"): dugme_arg = true
		if a.begins_with("--sec="): sec_arg = int(a.substr(6))
		if a.begins_with("--saat="): saat_arg = float(a.substr(7))
		if a.begins_with("--kayit="): kayit_adi = a.substr(8)
		if a.begins_with("--mesafe="): mesafe_arg = float(a.substr(9))
		if a.begins_with("--hedef="): var p = a.substr(8).split(","); hedef_arg = Vector3(float(p[0]), 0, float(p[1]))
	cevre_kur()
	if hedef_arg != Vector3.ZERO: hedef = hedef_arg
	if kayit_adi != "": web_kaydi_ciz(kayit_adi)
	else:
		zemin_kur()
		for b in BINALAR: bina_koy(b[0], b[1], b[2], b[3], b[4])
		for t in AGACLAR: model_koy(t[2], Vector3(t[0] + 0.5, 0, t[1] + 0.5), float(OLCEK.get(t[2], 1.0)), randf() * TAU)
		inek_koy(3)
		doga_kur()
	kamera = Camera3D.new(); kamera.fov = 35; add_child(kamera)
	arayuz_kur()
	if ekran_yolu == "": kayit_yukle()
	if mesafe_arg > 0: mesafe = mesafe_arg
	if hedef_arg != Vector3.ZERO: hedef = hedef_arg
	kamera_guncelle()

func cevre_kur():
	# web oyunundaki ışık: ACES ton eşleme, sıcak güneş, gök/toprak yarım küre ışığı
	var g := DirectionalLight3D.new(); gunes = g; g.rotation_degrees = Vector3(-50, 35, 0); g.light_energy = 0.8; g.light_color = Color.html("#ffe6c4")
	g.shadow_enabled = true; g.directional_shadow_max_distance = 40; g.shadow_blur = 1.5; add_child(g)
	var ortam := WorldEnvironment.new(); var e := Environment.new()
	e.background_mode = Environment.BG_COLOR; e.background_color = Color.html("#d3e1e6")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR; e.ambient_light_color = Color.html("#a9ad9f"); e.ambient_light_energy = 0.24
	e.tonemap_mode = Environment.TONE_MAPPER_LINEAR; e.tonemap_exposure = 1.0
	e.adjustment_enabled = true; e.adjustment_saturation = 1.15; e.adjustment_contrast = 1.05
	e.fog_enabled = true; e.fog_light_color = Color.html("#d3e1e6"); e.fog_density = 0.003
	ortam.environment = e; add_child(ortam); ortam_e = e

func web_kaydi_ciz(ad: String):
	# web oyununun kaydını aç: arazi karoları + binalar aynı yerlerinde
	var yol_ := "res://kayitlar/%s.json" % ad
	if ad == "ornek" and FileAccess.file_exists("user://koy.json"): yol_ = "user://koy.json"
	var v = JSON.parse_string(FileAccess.get_file_as_string(yol_))
	if not v is Dictionary: push_error("kayıt okunamadı"); return
	kayit_v = v
	if v.get("zaman") != null:  # kapalıyken geçen süre inşaata sayılır
		var gec: float = max(0.0, (simdi_ms() - float(v["zaman"])) / 1000.0)
		for b in v["b"]:
			if b.get("insa") is Dictionary: b["insa"]["t"] = float(b["insa"]["t"]) + gec
	for b in v["b"]:
		var bx: int = BOY.get(b["tip"], 1)
		for dz in bx:
			for dx in bx: karo_bina[(int(b["z"]) + dz) * WN + int(b["x"]) + dx] = b
	var t: Array = v["t"]
	arazi_t = t
	# kara karoları tek ağda; deniz düz su; dere (4) suyla
	var st := SurfaceTool.new(); st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for z in WN:
		for x in WN:
			var k := int(t[z * WN + x])
			if k == 0 or k == 4: continue
			var x0 := x - YARI; var z0 := z - YARI
			for p in [Vector3(x0, 0, z0), Vector3(x0 + 1, 0, z0), Vector3(x0, 0, z0 + 1), Vector3(x0 + 1, 0, z0), Vector3(x0 + 1, 0, z0 + 1), Vector3(x0, 0, z0 + 1)]:
				st.set_normal(Vector3.UP); st.add_vertex(p)
	var kara := MeshInstance3D.new(); kara.mesh = st.commit(); add_child(kara)
	var mt := StandardMaterial3D.new(); mt.roughness = 1.0
	mt.albedo_texture = load("res://doku/cim.png"); mt.uv1_triplanar = true; mt.uv1_world_triplanar = true; mt.uv1_scale = Vector3.ONE * 0.22
	var cc := Color.html("#7b9443"); mt.albedo_color = Color(cc.r * 0.92, cc.g * 0.95, cc.b * 0.7); kara.material_override = mt
	# deniz: kara maskesini bulanıklaştır (kıyıya uzaklık), web'deki su shader'ı
	var img := Image.create(WN, WN, false, Image.FORMAT_RF)
	var km := PackedFloat32Array(); km.resize(WN * WN)
	for i in WN * WN: km[i] = 1.0 if int(t[i]) > 0 else 0.0  # dere kara sayılır: köpük çıkmasın
	for gec in 3:
		var y2 := PackedFloat32Array(); y2.resize(WN * WN)
		for z in WN:
			for x in WN:
				var top := 0.0; var say := 0
				for dz in [-1, 0, 1]:
					for dx in [-1, 0, 1]:
						var xx: int = x + dx; var zz: int = z + dz
						if xx < 0 or zz < 0 or xx >= WN or zz >= WN: say += 1; continue
						top += km[zz * WN + xx]; say += 1
				y2[z * WN + x] = top / say
		km = y2
	for z in WN:
		for x in WN: img.set_pixel(x, z, Color(km[z * WN + x], 0, 0))
	var su := MeshInstance3D.new(); var pm := PlaneMesh.new(); pm.size = Vector2(420, 420); pm.subdivide_width = 170; pm.subdivide_depth = 170; su.mesh = pm; su.position.y = -0.24
	var sm := ShaderMaterial.new(); sm.shader = load("res://su.gdshader"); sm.set_shader_parameter("kara", ImageTexture.create_from_image(img)); su.material_override = sm; add_child(su)
	# kıyı: denize bakan karolar kum, kara kenarlarında toprak yan duvar
	var kum_st := SurfaceTool.new(); kum_st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var yan_st := SurfaceTool.new(); yan_st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var yanb := kutu_m(1.0, 0.6, 1.0)
	for z in WN:
		for x in WN:
			var k := int(t[z * WN + x]); if k == 0 or k == 4: continue
			var kiyi := false; var kiyid := false
			for d in [[1, 0], [-1, 0], [0, 1], [0, -1]]:
				var xx: int = x + d[0]; var zz: int = z + d[1]
				var kt := 0 if (xx < 0 or zz < 0 or xx >= WN or zz >= WN) else int(t[zz * WN + xx])
				if kt == 0: kiyid = true
				if kt == 0 or kt == 4: kiyi = true
			var cx := x + 0.5 - YARI; var cz := z + 0.5 - YARI
			if kiyi: parca(yan_st, yanb, Transform3D(Basis(), Vector3(cx, -0.302, cz)), Color.html("#7a5c3e"))
			if kiyid:
				for p in [Vector3(-0.5, 0.004, -0.5), Vector3(0.5, 0.004, -0.5), Vector3(-0.5, 0.004, 0.5), Vector3(0.5, 0.004, -0.5), Vector3(0.5, 0.004, 0.5), Vector3(-0.5, 0.004, 0.5)]:
					kum_st.set_normal(Vector3.UP); kum_st.add_vertex(Vector3(cx, 0, cz) + p)
	# dere: dere karolarında akan su (web: -0.13, denize komşuysa -0.2)
	var d_st := SurfaceTool.new(); d_st.begin(Mesh.PRIMITIVE_TRIANGLES); var dere_var := false
	for z in WN:
		for x in WN:
			if int(t[z * WN + x]) != 4: continue
			dere_var = true
			var dy := -0.13
			for dz in [-1, 0, 1]:
				for dx in [-1, 0, 1]:
					var xx: int = x + dx; var zz: int = z + dz
					if xx >= 0 and zz >= 0 and xx < WN and zz < WN and int(t[zz * WN + xx]) == 0: dy = -0.2
			var cx := x + 0.5 - YARI; var cz := z + 0.5 - YARI
			for p in [Vector3(-0.5, 0, -0.5), Vector3(0.5, 0, -0.5), Vector3(-0.5, 0, 0.5), Vector3(0.5, 0, -0.5), Vector3(0.5, 0, 0.5), Vector3(-0.5, 0, 0.5)]:
				d_st.set_normal(Vector3.UP); d_st.add_vertex(Vector3(cx, dy, cz) + p)
	if dere_var:
		var dm := MeshInstance3D.new(); dm.mesh = d_st.commit(); add_child(dm)
		var dmt := ShaderMaterial.new(); dmt.shader = load("res://dere.gdshader"); dm.material_override = dmt
	var kum := MeshInstance3D.new(); kum.mesh = kum_st.commit(); add_child(kum)
	var kmt := StandardMaterial3D.new(); kmt.roughness = 1.0; kmt.albedo_texture = load("res://doku/kum.png"); kmt.uv1_triplanar = true; kmt.uv1_world_triplanar = true; kmt.uv1_scale = Vector3.ONE * 0.6; kmt.albedo_color = Color.html("#cdb588"); kum.material_override = kmt
	var yan := MeshInstance3D.new(); yan.mesh = yan_st.commit(); add_child(yan)
	var ymt := StandardMaterial3D.new(); ymt.roughness = 1.0; ymt.vertex_color_use_as_albedo = true; ymt.albedo_texture = load("res://doku/toprak.png"); ymt.uv1_triplanar = true; ymt.uv1_world_triplanar = true; ymt.uv1_scale = Vector3.ONE * 1.2; yan.material_override = ymt
	var yol := StandardMaterial3D.new(); yol.roughness = 1.0; yol.albedo_texture = load("res://doku/toprak.png"); yol.uv1_triplanar = true; yol.uv1_world_triplanar = true; yol.uv1_scale = Vector3.ONE * 1.2
	var tc := Color.html("#9b8a72"); yol.albedo_color = Color(tc.r * 1.2, tc.g * 1.1, tc.b)
	var yst := SurfaceTool.new(); yst.begin(Mesh.PRIMITIVE_TRIANGLES)
	var ilk_ev = null
	var serit := {}
	var kasaba: bool = v.get("kasaba", false) == true
	donem_kip = "s" if v.get("sehir", false) == true else ("k" if kasaba else "")
	for b in v["b"]:
		var tip: String = b["tip"]
		if b.get("insa") != null and tip in ["yol", "asfalt", "kopru", "cit", "lamba", "teras"]: continue
		if tip in ["yol", "asfalt", "kopru", "cit"]:
			serit[int(b["z"]) * WN + int(b["x"])] = b
			continue
		if tip == "cami": pass  # camiye dokunma: olduğu gibi çiz
		var model := tip
		if tip == "ev" and kasaba: model = "evsehir" if v.get("sehir", false) == true else "evkasaba"
		if tip in ["lamba", "teras"]:
			var bx: int = BOY.get(tip, 1)
			proc_bina(tip, Vector3(b["x"] + bx / 2.0 - YARI, 0, b["z"] + bx / 2.0 - YARI), int(b.get("rot", 0)))
			continue
		if not FileAccess.file_exists("res://modeller/%s.glb" % model): continue
		var boy: int = BOY.get(tip, 1)
		bina_koy_dunya(model, Vector3(b["x"] + boy / 2.0 - YARI, 0, b["z"] + boy / 2.0 - YARI), int(b.get("rot", 0)), int(b["id"]))
		bina_gorunum(b)
		if b.get("insa") != null and int(b["insa"].get("hedef", 1)) == 1: continue
		if tip == "tarla": ekin_yenile(b)
		if tip in HAYVAN_TUR: hayvan_koy(tip, Vector3(b["x"] + boy / 2.0 - YARI, 0, b["z"] + boy / 2.0 - YARI), HAYVAN_TUR[tip][1] + int(b.get("lv", 1)) - 1)
		if tip == "ev" and ilk_ev == null: ilk_ev = Vector3(b["x"] - YARI, 0, b["z"] - YARI)
	yol_serit = serit; yol_kasaba = kasaba
	yol_ciz(serit, t, kasaba)
	hale_kur()
	koylu_koy(serit, 28)
	dag_kur(t)
	web_orman(t)
	if ilk_ev != null and hedef_arg == Vector3.ZERO: hedef = ilk_ev

const M32 := 0xFFFFFFFF
func hash32(n: int) -> float:
	# web oyunundaki hash() ile birebir aynı (çatı rengi vb. aynı çıksın)
	n = n & M32
	n = ((n ^ 61) ^ (n >> 16)) & M32
	n = (n + (n << 3)) & M32
	n = (n ^ (n >> 4)) & M32
	n = (n * 0x27d4eb2d) & M32
	n = (n ^ (n >> 15)) & M32
	return n / 4294967295.0
func rnd(i: int, k: int) -> float: return hash32(i * 131 + k * 7919 + 17)

const EKIN_DIZ := {"karpuz": 2, "kabak": 2, "lahana": 2, "sogan": 4, "sarimsak": 4, "cilek": 3}
var _ekin := {}
var _ekin_mat: StandardMaterial3D
func parca(st: SurfaceTool, pm: PrimitiveMesh, tr: Transform3D, renk: Color):
	var a := pm.get_mesh_arrays()
	var v: PackedVector3Array = a[Mesh.ARRAY_VERTEX]; var nn: PackedVector3Array = a[Mesh.ARRAY_NORMAL]; var ix: PackedInt32Array = a[Mesh.ARRAY_INDEX]
	for i in ix:
		st.set_color(renk); st.set_normal((tr.basis * nn[i]).normalized()); st.add_vertex(tr * v[i])
func kutu_m(sx, sy, sz) -> BoxMesh: var b := BoxMesh.new(); b.size = Vector3(sx, sy, sz); return b
func sil_m(r1, r2, h, n := 6) -> CylinderMesh: var c := CylinderMesh.new(); c.top_radius = r1; c.bottom_radius = r2; c.height = h; c.radial_segments = n; c.rings = 1; return c
func ekin_mesh(tip: String, as_: int) -> Mesh:
	# web oyunundaki ekinModel ile aynı yerleşim: 4x4 bitki
	var k := tip + str(as_)
	if _ekin.has(k): return _ekin[k]
	var st := SurfaceTool.new(); st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var s: float = [0.25, 0.55, 1.0][as_]
	for r in 4:
		for c in 4:
			var x := -0.3 + c * 0.2 + (r % 2) * 0.05; var z := -0.3 + r * 0.2; var j := (r * 4 + c) * 0.37
			if tip == "bugday":
				for q in 3:
					var ox := sin(j + q) * 0.035; var oz := cos(j * 2 + q) * 0.035; var h := 0.32 * s * (0.85 + 0.15 * sin(j + q * 2))
					var bz := Basis.from_euler(Vector3(sin(j + q) * 0.12, j, 0))
					parca(st, kutu_m(0.012, h, 0.012), Transform3D(bz, Vector3(x + ox, 0.07 + h / 2, z + oz)), Color.html("#7c9a3a") if as_ < 2 else Color.html("#c49b45"))
					if as_ == 2: parca(st, kutu_m(0.022, 0.07, 0.022), Transform3D(bz, Vector3(x + ox, 0.07 + h + 0.03, z + oz)), Color.html("#d9bc6a"))
			elif tip == "misir":
				var h := 0.5 * s
				parca(st, sil_m(0.012, 0.016, h, 5), Transform3D(Basis(), Vector3(x, 0.07 + h / 2, z)), Color.html("#5f8a2e"))
				for q in 2:
					parca(st, kutu_m(0.16 * s, 0.01, 0.035), Transform3D(Basis.from_euler(Vector3(0, j + q * 2, -0.5 if q else 0.5)), Vector3(x + (0.05 if q else -0.05) * s, 0.07 + h * (0.45 + q * 0.2), z)), Color.html("#6e9a34"))
				if as_ == 2:
					parca(st, sil_m(0.018, 0.022, 0.1, 6), Transform3D(Basis.from_euler(Vector3(0, 0, 0.25)), Vector3(x + 0.025, 0.07 + h * 0.6, z)), Color.html("#e2b83a"))
					parca(st, sil_m(0.0, 0.012, 0.07, 4), Transform3D(Basis(), Vector3(x, 0.07 + h + 0.03, z)), Color.html("#c9a35a"))
			elif tip == "havuc":
				for q in 3:
					parca(st, kutu_m(0.02, 0.14 * s, 0.01), Transform3D(Basis.from_euler(Vector3(0.25, q * 1.1, 0)), Vector3(x + sin(q * 2) * 0.02, 0.07 + 0.07 * s, z + cos(q * 2) * 0.02)), Color.html("#4f8a2a"))
				if as_ == 2: parca(st, sil_m(0.0, 0.03, 0.05, 6), Transform3D(Basis.from_euler(Vector3(PI, 0, 0)), Vector3(x, 0.075, z)), Color.html("#e0701e"))
			else:
				if (r + c) % 2: continue
				var sm := SphereMesh.new(); sm.radius = 0.07 * s + 0.02; sm.height = sm.radius * 2; sm.radial_segments = 8; sm.rings = 4
				parca(st, sm, Transform3D(Basis().scaled(Vector3(1.2, 0.8, 1.2)), Vector3(x, 0.07 + 0.07 * s, z)), Color.html("#3f7a2a"))
	var me := st.commit()
	if _ekin_mat == null:
		_ekin_mat = StandardMaterial3D.new(); _ekin_mat.vertex_color_use_as_albedo = true; _ekin_mat.roughness = 0.9
	me.surface_set_material(0, _ekin_mat)
	_ekin[k] = me
	return me

func ekin_koy(e: Dictionary, merkez: Vector3, kap: Node3D = null):
	var simdi := Time.get_unix_time_from_system() * 1000.0
	var f: float = (simdi - float(e["bas"])) / max(1.0, float(e["bit"]) - float(e["bas"]))
	var as_ := 2 if f >= 1 else (1 if f >= 0.45 else 0)
	var tip: String = e["tip"]
	if FileAccess.file_exists("res://modeller/ekin_%s.glb" % tip):
		var n: int = EKIN_DIZ.get(tip, 3); var ara := 0.84 / n; var sc: float = [0.45, 0.78, 1.0][as_]
		var ad := "ekin_%s" % tip if as_ == 2 else "ekin_%s_y" % tip
		for r in n:
			for c in n:
				var j := r * 7 + c * 3 + tip.length()
				var p := Vector3(-0.42 + ara * (c + 0.5) + sin(j) * ara * 0.08, 0.07, -0.42 + ara * (r + 0.5) + cos(j) * ara * 0.08)
				var mk := model_koy(ad, merkez + p, sc, j * 1.37)
				if kap and mk: mk.reparent(kap)
		return
	var mi := MeshInstance3D.new(); mi.mesh = ekin_mesh(tip, as_); mi.position = merkez
	if kap: kap.add_child(mi)
	else: add_child(mi)

func hayvan_koy(tip: String, merkez: Vector3, n: int):
	# web'deki gibi: ağıl/ahır/kümes içinde dolaşan hayvanlar (merkeze göre ±0.55, -0.1..0.9)
	var H: Array = HAYVAN_TUR[tip]
	for i in n:
		var yer := Vector3(randf_range(-0.55, 0.55), 0.04, randf_range(-0.1, 0.9))
		var d := model_koy(H[0], merkez + yer, float(H[2]), randf() * TAU)
		if d: hayvanlar.append({"d": d, "m": merkez, "h": yer, "bekle": randf() * 3, "hiz": float(H[3])})

var kosH := PackedFloat32Array()
func dag_kur(t: Array):
	# web yukseklikKur + dagMeshYap: dağ karolarında kenardan uzaklığa göre yükseklik
	var H := PackedFloat32Array(); H.resize(WN * WN); var q := []
	for i in WN * WN: H[i] = 1e9 if int(t[i]) == 5 else 0.0
	for i in WN * WN:
		if int(t[i]) != 5: continue
		var x := i % WN; var z := i / WN
		for d in [[1, 0], [-1, 0], [0, 1], [0, -1]]:
			var xx: int = x + d[0]; var zz: int = z + d[1]
			var kt := int(t[zz * WN + xx]) if (xx >= 0 and zz >= 0 and xx < WN and zz < WN) else -1
			if kt != 5: H[i] = 1; q.append(i); break
	var h := 0
	while h < q.size():
		var i: int = q[h]; h += 1; var x := i % WN; var z := i / WN
		for d in [[1, 0], [-1, 0], [0, 1], [0, -1]]:
			var xx: int = x + d[0]; var zz: int = z + d[1]
			if xx < 0 or zz < 0 or xx >= WN or zz >= WN: continue
			var j := zz * WN + xx
			if H[j] > H[i] + 1: H[j] = H[i] + 1; q.append(j)
	for i in WN * WN:
		if int(t[i]) == 5: H[i] = min(7.5, pow(H[i], 1.15) * 0.95) * (0.8 + rnd(i, 501) * 0.4) + 0.3
	kosH.resize((WN + 1) * (WN + 1))
	for cz in WN + 1:
		for cx in WN + 1:
			var top := 0.0; var n := 0; var hepsi := true
			for d in [[-1, -1], [0, -1], [-1, 0], [0, 0]]:
				var x: int = cx + d[0]; var z: int = cz + d[1]
				if x < 0 or z < 0 or x >= WN or z >= WN: hepsi = false; continue
				var i := z * WN + x
				if int(t[i]) != 5: hepsi = false
				else: top += H[i]; n += 1
			kosH[cz * (WN + 1) + cx] = top / n if (hepsi and n > 0) else 0.0
	# ağ: her dağ karosu iki üçgen; renk eğim ve yüksekliğe göre (çim → kaya → kar)
	var st := SurfaceTool.new(); st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var var_ := false
	var KH := func(cx, cz): return kosH[clamp(cz, 0, WN) * (WN + 1) + clamp(cx, 0, WN)]
	for i in WN * WN:
		if int(t[i]) != 5: continue
		var_ = true
		var x := i % WN; var z := i / WN
		for c in [[x, z], [x + 1, z], [x, z + 1], [x + 1, z], [x + 1, z + 1], [x, z + 1]]:
			var cx: int = c[0]; var cz: int = c[1]
			var hh: float = KH.call(cx, cz)
			var nrm := Vector3(-(KH.call(cx + 1, cz) - KH.call(cx - 1, cz)) * 0.5, 1.0, -(KH.call(cx, cz + 1) - KH.call(cx, cz - 1)) * 0.5).normalized()
			var dik := 1.0 - nrm.y; var r := rnd(cz * (WN + 1) + cx, 77)
			var col := Color.html("#55692e")
			col = col.lerp(Color.html("#5e5a52") if r < 0.5 else Color.html("#6b665d"), smoothstep(0.22, 0.5, dik + hh * 0.09))
			if hh > 6.4 + r * 0.6: col = col.lerp(Color.html("#eef1f2"), smoothstep(0.0, 0.25, 0.6 - dik))
			if hh < 0.35: col = col.lerp(Color.html("#7b9443"), 0.7)
			st.set_color(col); st.set_normal(nrm); st.add_vertex(Vector3(cx - YARI, hh, cz - YARI))
	if not var_: return
	var mi := MeshInstance3D.new(); mi.mesh = st.commit(); add_child(mi)
	var mt := StandardMaterial3D.new(); mt.vertex_color_use_as_albedo = true; mt.roughness = 0.96
	mt.albedo_texture = load("res://doku/kaya.png"); mt.uv1_triplanar = true; mt.uv1_world_triplanar = true; mt.uv1_scale = Vector3.ONE * 0.9
	mi.material_override = mt

func yerY(wx: float, wz: float) -> float:
	if kosH.is_empty(): return 0.0
	var fx := wx + YARI; var fz := wz + YARI
	if fx < 0 or fz < 0 or fx >= WN or fz >= WN: return 0.0
	var x := int(floor(fx)); var z := int(floor(fz)); var u := fx - x; var v := fz - z
	var K := func(a, b): return kosH[(z + b) * (WN + 1) + x + a]
	return (K.call(0, 0) * (1 - u) + K.call(1, 0) * u) * (1 - v) + (K.call(0, 1) * (1 - u) + K.call(1, 1) * u) * v

# --- web Parca benzeri: renge göre gruplanmış parçalar, malzeme web'deki gibi renkten (doku dahil)
var _pc := {}
func pc_ekle(pm: PrimitiveMesh, renk: String, pos: Vector3, rot := Vector3.ZERO, olc := Vector3.ONE):
	var hx := renk.trim_prefix("#").to_lower()
	if not _pc.has(hx): var st := SurfaceTool.new(); st.begin(Mesh.PRIMITIVE_TRIANGLES); _pc[hx] = st
	parca(_pc[hx], pm, Transform3D(Basis.from_euler(rot).scaled(olc), pos), Color.WHITE)
func pc_bitir() -> Node3D:
	var kok := Node3D.new()
	for hx in _pc:
		var mi := MeshInstance3D.new(); mi.mesh = _pc[hx].commit()
		if not _malz.has(hx): _malz[hx] = malz_yap(hx)
		mi.material_override = _malz[hx]; kok.add_child(mi)
	_pc = {}
	return kok
func kure_m(r: float) -> SphereMesh: var m := SphereMesh.new(); m.radius = r; m.height = r * 2; m.radial_segments = 6; m.rings = 3; return m

func proc_bina(tip: String, m: Vector3, rot: int):
	# GLB'si olmayan web binaları (modelProsedur): yerel parçaları döndürüp dünyaya ekle
	var bz := Basis(Vector3.UP, rot * PI / 2)
	var E := func(pm, renk, p, r := Vector3.ZERO, o := Vector3.ONE):
		var tr := Transform3D(bz * Basis.from_euler(r).scaled(o), m + bz * p)
		var hx: String = renk.trim_prefix("#").to_lower()
		if not _pc.has(hx): var st := SurfaceTool.new(); st.begin(Mesh.PRIMITIVE_TRIANGLES); _pc[hx] = st
		parca(_pc[hx], pm, tr, Color.WHITE)
	if tip == "lamba":
		var o := 0.42
		E.call(sil_m(0.05, 0.06, 0.04, 8), "#858077", Vector3(o, 0.02, o)); E.call(sil_m(0.016, 0.02, 0.7, 8), "#2b2b2e", Vector3(o, 0.37, o))
		E.call(kutu_m(0.12, 0.02, 0.02), "#2b2b2e", Vector3(o - 0.05, 0.72, o)); E.call(sil_m(0.0, 0.06, 0.05, 4), "#2b2b2e", Vector3(o - 0.1, 0.735, o))
		E.call(kutu_m(0.055, 0.07, 0.055), "#ffd98a", Vector3(0.32, 0.675, 0.42))
		lamba_yer.append(m + bz * Vector3(0.32, 0.02, 0.42))
	elif tip == "teras":
		E.call(kutu_m(0.8, 0.06, 0.74), "#858077", Vector3(0, 0.03, 0)); E.call(kutu_m(0.66, 0.36, 0.6), "#a7a298", Vector3(0, 0.24, -0.02))
		E.call(kutu_m(0.7, 0.04, 0.64), "#858077", Vector3(0, 0.44, -0.02)); E.call(kutu_m(0.64, 0.3, 0.58), "#ece3d0", Vector3(0, 0.61, -0.02))
		E.call(kutu_m(0.7, 0.04, 0.64), "#bdb7ac", Vector3(0, 0.78, -0.02))
		for q in [[0, 0.29, 0.7, 0.03], [0, -0.33, 0.7, 0.03], [-0.34, -0.02, 0.03, 0.64], [0.34, -0.02, 0.03, 0.64]]: E.call(kutu_m(q[2], 0.09, q[3]), "#e2d4b6", Vector3(q[0], 0.845, q[1]))
		E.call(kutu_m(0.22, 0.2, 0.18), "#8a6241", Vector3(-0.16, 0.9, -0.18))
		var pr := PrismMesh.new(); pr.size = Vector3(0.28, 0.08, 0.24); E.call(pr, "#9c4b35", Vector3(-0.16, 1.04 + 0.04, -0.18))
		for k in 3: E.call(kutu_m(0.035, 0.035, 0.01), "#2a1d14", Vector3(-0.23 + k * 0.07, 0.93, -0.088))
		E.call(kutu_m(0.24, 0.015, 0.05), "#a67c53", Vector3(-0.16, 0.86, -0.07)); E.call(kutu_m(0.14, 0.24, 0.02), "#5b3a22", Vector3(0.1, 0.18, 0.285))
		E.call(kutu_m(0.12, 0.12, 0.02), "#26343a", Vector3(-0.18, 0.27, 0.285))
		for x in [-0.16, 0.16]: E.call(kutu_m(0.12, 0.14, 0.02), "#26343a", Vector3(x, 0.62, 0.275))
		for k in 6: E.call(kutu_m(0.1, 0.03, 0.08), "#bdb7ac", Vector3(0.38, 0.08 + k * 0.12, -0.25 + k * 0.08))

var yol_serit := {}
var yol_kasaba := false
var yol_kok: Node3D = null
func yol_yenile():
	if yol_kok: yol_kok.queue_free(); yol_kok = null
	yol_ciz(yol_serit, arazi_t, yol_kasaba)
func yol_ciz(serit: Dictionary, t: Array, kasaba: bool):
	# web yolCiz: toprak yol (tekerlek izleri, çukur, çakıl), ahşap köprü
	var yon := [[1, 0], [-1, 0], [0, 1], [0, -1]]
	var var_ := func(x, z, tipler): var b = serit.get(z * WN + x); return b != null and b["tip"] in tipler
	for i in serit:
		var b: Dictionary = serit[i]; var x: int = i % WN; var z: int = i / WN
		var c := Vector3(x + 0.5 - YARI, 0, z + 0.5 - YARI); var r := rnd(int(b["id"]), 9); var id := int(b["id"])
		if b["tip"] == "yol":
			var renk := "#8a6a48" if r < 0.5 else "#7a5a3a"
			pc_ekle(kutu_m(0.64, 0.02, 0.64), renk, c + Vector3(0, 0.01, 0))
			for d in yon:
				var a: int = d[0]; var dd: int = d[1]
				if var_.call(x + a, z + dd, ["yol", "kopru", "asfalt"]):
					pc_ekle(kutu_m(0.5 if a else 0.64, 0.02, 0.64 if a else 0.5), renk, c + Vector3(a * 0.25, 0.01, dd * 0.25))
					for sg in [-0.14, 0.14]:
						pc_ekle(kutu_m(0.5 if a else 0.035, 0.022, 0.035 if a else 0.5), "#5c4128", c + Vector3(a * 0.25 + (0.0 if a else sg), 0.012, dd * 0.25 + (sg if a else 0.0)))
			if r < 0.16: pc_ekle(sil_m(0.16, 0.18, 0.012, 12), "#4a3524", c + Vector3((rnd(id, 10) - 0.5) * 0.2, 0.024, (rnd(id, 11) - 0.5) * 0.2), Vector3.ZERO, Vector3(1.2, 1, 0.8))
			for q in 3: pc_ekle(kure_m(0.018), "#9b8a72", c + Vector3((rnd(id, 20 + q) - 0.5) * 0.5, 0.02, (rnd(id, 30 + q) - 0.5) * 0.5))
		elif b["tip"] == "asfalt":
			pc_ekle(kutu_m(1.0, 0.03, 1.0), "#3d3d3f" if r < 0.5 else "#424245", c + Vector3(0, 0.015, 0))
			var bag := 0
			for d in yon:
				var a: int = d[0]; var dd: int = d[1]
				if var_.call(x + a, z + dd, ["yol", "kopru", "asfalt"]):
					bag += 1; pc_ekle(kutu_m(0.28 if a else 0.045, 0.006, 0.045 if a else 0.28), "#f2f0e6", c + Vector3(a * 0.3, 0.033, dd * 0.3))
				else:
					pc_ekle(kutu_m(0.07 if a else 1.0, 0.06, 1.0 if a else 0.07), "#b9b6ae", c + Vector3(a * 0.465, 0.03, dd * 0.465))
			if bag == 4 and kasaba:
				pc_ekle(sil_m(0.4, 0.4, 0.004, 24), "#f2f0e6", c + Vector3(0, 0.031, 0)); pc_ekle(sil_m(0.37, 0.37, 0.006, 24), "#3f3f41", c + Vector3(0, 0.032, 0))
				pc_ekle(sil_m(0.22, 0.23, 0.05, 20), "#d8d4cc", c + Vector3(0, 0.05, 0)); pc_ekle(sil_m(0.2, 0.2, 0.012, 20), "#4f8a3c", c + Vector3(0, 0.078, 0))
				for k in 6:
					var aa := k / 6.0 * TAU; pc_ekle(kure_m(0.03), "#e05a6a" if k % 2 else "#f0c419", c + Vector3(cos(aa) * 0.13, 0.09, sin(aa) * 0.13))
				pc_ekle(sil_m(0.008, 0.01, 0.45, 6), "#cfcfcf", c + Vector3(0, 0.3, 0)); pc_ekle(kutu_m(0.012, 0.09, 0.14), "#d62828", c + Vector3(0, 0.47, 0.07))
			elif bag != 2: pc_ekle(kutu_m(0.07, 0.006, 0.07), "#f2f0e6", c + Vector3(0, 0.033, 0))
		elif b["tip"] == "cit":
			for d in yon:
				var a: int = d[0]; var dd: int = d[1]
				if var_.call(x + a, z + dd, ["cit"]): continue
				var e := c + Vector3(a * 0.48, 0, dd * 0.48)
				for y in [0.1, 0.2]: pc_ekle(kutu_m(0.025 if a else 1.0, 0.03, 1.0 if a else 0.025), "#8a6241", e + Vector3(0, y, 0))
				for s2 in [-0.48, 0.0, 0.48]: pc_ekle(kutu_m(0.04, 0.26, 0.04), "#5a3d27", e + Vector3(0.0 if a else s2, 0.13, s2 if a else 0.0))
		elif b["tip"] == "kopru" and kasaba:
			var T := func(xx, zz): return int(t[zz * WN + xx]) if (xx >= 0 and zz >= 0 and xx < WN and zz < WN) else -1
			var xe: bool = not (T.call(x + 1, z) == 4 and T.call(x - 1, z) == 4) and (T.call(x + 1, z) != 4 or T.call(x - 1, z) != 4)
			var L := 1.04; var W := 0.8
			pc_ekle(kutu_m(L if xe else W, 0.08, W if xe else L), "#b4b0a8", c + Vector3(0, 0.06, 0)); pc_ekle(kutu_m(L if xe else W - 0.1, 0.012, W - 0.1 if xe else L), "#3d3d3f", c + Vector3(0, 0.105, 0))
			pc_ekle(kutu_m(L * 0.3 if xe else 0.03, 0.004, 0.03 if xe else L * 0.3), "#f2f0e6", c + Vector3(0, 0.112, 0))
			for sg in [-1, 1]:
				pc_ekle(kutu_m(L if xe else 0.05, 0.1, 0.05 if xe else L), "#c8c4bc", c + Vector3(0.0 if xe else sg * W / 2, 0.16, sg * W / 2 if xe else 0.0))
				pc_ekle(kutu_m(L if xe else 0.055, 0.015, 0.055 if xe else L), "#9a968e", c + Vector3(0.0 if xe else sg * W / 2, 0.215, sg * W / 2 if xe else 0.0))
			pc_ekle(kutu_m(0.12 if xe else W * 0.7, 0.4, W * 0.7 if xe else 0.12), "#a8a49c", c + Vector3(0, -0.18, 0))
		elif b["tip"] == "kopru" and not kasaba:
			var T := func(xx, zz): return int(t[zz * WN + xx]) if (xx >= 0 and zz >= 0 and xx < WN and zz < WN) else -1
			var xe: bool = not (T.call(x + 1, z) == 4 and T.call(x - 1, z) == 4) and (T.call(x + 1, z) != 4 or T.call(x - 1, z) != 4)
			var L := 1.1; var W := 0.62
			for k in 9:
				var o := -L / 2 + (k + 0.5) * L / 9
				pc_ekle(kutu_m(L / 9 - 0.012 if xe else W, 0.04, W if xe else L / 9 - 0.012), "#8b6b45" if k % 2 else "#7a5c3a", c + Vector3(o if xe else 0.0, 0.05 + sin((o / L + 0.5) * PI) * 0.06, 0.0 if xe else o))
			for sg in [-1, 1]:
				for o in [-0.5, 0.0, 0.5]:
					pc_ekle(kutu_m(0.04, 0.3, 0.04), "#5a3d27", c + Vector3(o if xe else sg * W / 2, 0.15 + (0.0 if o else 0.06), sg * W / 2 if xe else o))
				pc_ekle(kutu_m(L if xe else 0.035, 0.035, 0.035 if xe else L), "#8a6241", c + Vector3(0.0 if xe else sg * W / 2, 0.29, sg * W / 2 if xe else 0.0))
				for o in [-0.45, 0.45]:
					pc_ekle(sil_m(0.035, 0.04, 0.4, 6), "#5a3d27", c + Vector3(o if xe else sg * W / 2, -0.15, sg * W / 2 if xe else o))
	yol_kok = pc_bitir(); add_child(yol_kok)

# --- köylüler: web insanYap gibi parçalı (gövde/kol/bacak), yollarda yürür
var koyluler := []
var donem_kip := ""
var _yol_komsu := {}
func insan_yap(ad: String) -> Dictionary:
	var gr := Node3D.new(); var ust := Node3D.new(); ust.position.y = 0.112; gr.add_child(ust)
	var gv := sahne_yukle("insan_%s_govde" % ad); gv.position.y = -0.112; ust.add_child(gv)
	var uzuv := func(parca_ad, x, y, ana):
		var g := Node3D.new(); g.position = Vector3(x, y, 0); g.add_child(sahne_yukle("insan_%s_%s" % [ad, parca_ad])); ana.add_child(g); return g
	var bL = uzuv.call("bacak", -0.022, 0.112, gr); var bR = uzuv.call("bacak", 0.022, 0.112, gr)
	var kL = uzuv.call("kol", -0.056, 0.126, ust); var kR = uzuv.call("kol", 0.056, 0.126, ust)
	kL.rotation.z = -0.1; kR.rotation.z = 0.1
	for m in gr.find_children("*", "MeshInstance3D", true, false): m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	return {"gr": gr, "bL": bL, "bR": bR, "kL": kL, "kR": kR}

func koylu_koy(serit: Dictionary, n: int):
	var yollar := []
	for i in serit:
		if serit[i]["tip"] in ["yol", "kopru", "asfalt"]: yollar.append(i)
	if yollar.is_empty(): return
	for i in yollar:
		var x: int = i % WN; var z: int = i / WN; var l := []
		for d in [[1, 0], [-1, 0], [0, 1], [0, -1]]:
			var j: int = (z + d[1]) * WN + x + d[0]
			if serit.has(j) and serit[j]["tip"] in ["yol", "kopru", "asfalt"]: l.append(j)
		_yol_komsu[i] = l
	# kameraya yakın yollardan başla
	yollar.sort_custom(func(a, b): return Vector2(a % WN - YARI, a / WN - YARI).distance_squared_to(Vector2(hedef.x, hedef.z)) < Vector2(b % WN - YARI, b / WN - YARI).distance_squared_to(Vector2(hedef.x, hedef.z)))
	for k in n:
		var kadin := k % 2 == 1
		var ad := ("k" if kadin else "e") + str((k >> 1) % 4)
		if donem_kip != "" and randf() < (0.85 if donem_kip == "s" else 0.55): ad += donem_kip
		var ins := insan_yap(ad)
		var i: int = yollar[min(yollar.size() - 1, k * 3)]
		var p := Vector3(i % WN + 0.5 - YARI + randf_range(-0.2, 0.2), 0, i / WN + 0.5 - YARI + randf_range(-0.2, 0.2))
		add_child(ins.gr); ins.gr.position = p
		ins["karo"] = i; ins["hedef"] = p; ins["faz"] = randf() * TAU; ins["bekle"] = randf() * 2; ins["hiz"] = randf_range(0.22, 0.3)
		koyluler.append(ins)

func koylu_adim(dt: float):
	for k in koyluler:
		var gr: Node3D = k.gr
		var fark: Vector3 = k.hedef - gr.position; fark.y = 0
		if k.bekle > 0:
			k.bekle -= dt
			for u in [k.bL, k.bR, k.kL, k.kR]: u.rotation.x = lerp(u.rotation.x, 0.0, dt * 6)
			continue
		if fark.length() < 0.04:
			var l: Array = _yol_komsu.get(k.karo, [])
			if l.is_empty() or randf() < 0.08: k.bekle = randf_range(1, 4); continue
			var j: int = l[randi() % l.size()]; k.karo = j
			k.hedef = Vector3(j % WN + 0.5 - YARI + randf_range(-0.22, 0.22), 0, j / WN + 0.5 - YARI + randf_range(-0.22, 0.22))
			continue
		gr.position += fark.normalized() * min(fark.length(), k.hiz * dt)
		gr.rotation.y = lerp_angle(gr.rotation.y, atan2(fark.x, fark.z), dt * 8)
		k.faz += dt * 9.0
		var sl := sin(k.faz) * 0.5
		k.bL.rotation.x = sl; k.bR.rotation.x = -sl; k.kL.rotation.x = -sl * 0.8; k.kR.rotation.x = sl * 0.8

func web_orman(t: Array):
	# web araziKur ile aynı: t=2 orman karosunda 2-3 ağaç (yarısı çam), t=3 kayalık
	var liste := {"cam": [], "mese": [], "kaya": []}
	for z in WN:
		for x in WN:
			var i := z * WN + x; var k := int(t[i])
			var px := x + 0.5 - YARI; var pz := z + 0.5 - YARI
			if k == 2:
				var n := 2 + int(floor(rnd(i, 5) * 1.99))
				for k2 in n:
					var ox := (rnd(i, 10 + k2) - 0.5) * (0.55 if n > 1 else 0.2); var oz := (rnd(i, 20 + k2) - 0.5) * (0.55 if n > 1 else 0.2)
					var sc := (0.8 if n > 1 else 1.05) * (0.8 + rnd(i, 30 + k2) * 0.45)
					var bz := Basis.from_euler(Vector3((rnd(i, 45 + k2) - 0.5) * 0.08, rnd(i, 40 + k2) * TAU, (rnd(i, 46 + k2) - 0.5) * 0.08)).scaled(Vector3(sc, sc * (0.9 + rnd(i, 47 + k2) * 0.25), sc))
					liste["cam" if rnd(i, 50 + k2) < 0.5 else "mese"].append(Transform3D(bz, Vector3(px + ox, 0, pz + oz)))
			elif k == 5:
				var h0 := yerY(px, pz)
				if h0 < 2.4 and rnd(i, 610) < 0.3:
					var sc := 0.75 + rnd(i, 611) * 0.4; var ox := (rnd(i, 612) - 0.5) * 0.5; var oz := (rnd(i, 613) - 0.5) * 0.5
					liste["cam"].append(Transform3D(Basis(Vector3.UP, rnd(i, 614) * TAU).scaled(Vector3.ONE * sc), Vector3(px + ox, yerY(px + ox, pz + oz) - 0.05, pz + oz)))
				elif rnd(i, 620) < 0.35:
					var sc := 0.9 + rnd(i, 621) * 1.1; var ox := (rnd(i, 622) - 0.5) * 0.6; var oz := (rnd(i, 623) - 0.5) * 0.6
					liste["kaya"].append(Transform3D(Basis.from_euler(Vector3(rnd(i, 624) * 0.6, rnd(i, 625) * 6, 0)).scaled(Vector3(sc, sc * 0.7, sc)), Vector3(px + ox, yerY(px + ox, pz + oz) + 0.02, pz + oz)))
			elif k == 3:
				var n := 1 + int(floor(rnd(i, 5) * 2.5))
				for k2 in n:
					var sc := (0.8 if n > 1 else 1.25) * (0.8 + rnd(i, 30 + k2) * 0.5)
					var bz := Basis.from_euler(Vector3(rnd(i, 41 + k2) * 0.5, rnd(i, 42 + k2) * 6, 0)).scaled(Vector3(sc, sc * 0.75, sc))
					liste["kaya"].append(Transform3D(bz, Vector3(px + (rnd(i, 10 + k2) - 0.5) * 0.5, 0.05 * sc, pz + (rnd(i, 20 + k2) - 0.5) * 0.5)))
	for ad in liste:
		var l: Array = liste[ad]; if l.is_empty(): continue
		var mm := MultiMesh.new(); mm.transform_format = MultiMesh.TRANSFORM_3D; mm.mesh = dogal_mesh(ad); mm.instance_count = l.size()
		for j in l.size(): mm.set_instance_transform(j, l[j])
		var mmi := MultiMeshInstance3D.new(); mmi.multimesh = mm; add_child(mmi)

var bina_dugum := {}  # bina id -> {kok, s, olcek}
func bina_koy_dunya(ad: String, poz: Vector3, rot: int, id := 0):
	cati_sec = int(floor(rnd(id, 3) * CATI.size()))
	var s := sahne_yukle(ad); if s == null: return
	var kok := Node3D.new(); kok.add_child(s); add_child(kok)
	s.scale = Vector3.ONE * float(OLCEK.get(ad, 1.0))
	if id > 0: bina_dugum[id] = {"kok": kok, "s": s, "o": float(OLCEK.get(ad, 1.0))}
	kok.position = poz; kok.rotation.y = rot * PI / 2
	for m in s.find_children("*", "MeshInstance3D", true, false): m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON

func zemin_kur():
	# çim: hafif dalgalı renkli büyük düzlem + toprak yollar
	var m := MeshInstance3D.new(); var pm := PlaneMesh.new(); pm.size = Vector2(N * 3, N * 3); m.mesh = pm
	var mt := StandardMaterial3D.new(); mt.roughness = 1.0
	mt.albedo_texture = load("res://doku/cim.png"); mt.uv1_triplanar = true; mt.uv1_world_triplanar = true; mt.uv1_scale = Vector3.ONE * 0.22
	var cc := Color.html("#7b9443"); mt.albedo_color = Color(cc.r * 0.92, cc.g * 0.95, cc.b * 0.7)
	m.material_override = mt
	m.position = Vector3(N / 2.0, 0, N / 2.0); add_child(m)
	var yol := StandardMaterial3D.new(); yol.roughness = 1.0; yol.albedo_texture = load("res://doku/toprak.png"); yol.uv1_triplanar = true; yol.uv1_world_triplanar = true; yol.uv1_scale = Vector3.ONE * 1.2
	var tc := Color.html("#9b8a72"); yol.albedo_color = Color(tc.r * 1.2, tc.g * 1.1, tc.b * 1.0)
	for s in [[Vector3(12, 0.01, 12), Vector3(14, 0.02, 1)], [Vector3(12.5, 0.011, 9), Vector3(1, 0.02, 8)], [Vector3(10, 0.012, 9), Vector3(10, 0.02, 1)]]:
		var y := MeshInstance3D.new(); var bm := BoxMesh.new(); bm.size = s[1]; y.mesh = bm; y.material_override = yol; y.position = s[0]; add_child(y)

var _onbellek := {}
func sahne_yukle(ad: String) -> Node3D:
	if not _onbellek.has(ad):
		var doc := GLTFDocument.new(); var st := GLTFState.new()
		if doc.append_from_file("res://modeller/%s.glb" % ad, st) != OK: return null
		_onbellek[ad] = [doc, st]
	var c = _onbellek[ad]
	var sh: Node3D = c[0].generate_scene(c[1])
	if not ad in ["inek", "cam", "mese", "cali", "kaya"]: duz_golge(sh)
	renk_uygula(sh)
	return sh

var _malz := {}
var _doku := {}
func malz_yap(hx: String) -> StandardMaterial3D:
	# web oyunundaki gibi: renge göre doku türü (sıva, taş, ahşap, kiremit…), üç yönlü (triplanar) doku
	var t: String = TIPMAP.get(hx.to_lower(), "duz")
	var d: Array = TRI.get(t, ["", 1.0, 0.85, 1.35])
	var mt := StandardMaterial3D.new()
	var c := Color.html("#" + hx)
	mt.roughness = d[2]
	if d[0] != "":
		if not _doku.has(d[0]): _doku[d[0]] = load("res://doku/%s.png" % d[0])
		mt.albedo_texture = _doku[d[0]]
		mt.uv1_triplanar = true; mt.uv1_scale = Vector3.ONE * float(d[1])
		var pk: float = min(float(d[3]), 1.0); c = Color(c.r * pk, c.g * pk, c.b * pk)
	mt.albedo_color = c
	if t == "cam": mt.metallic = 0.3; mt.roughness = 0.12
	return mt
var cati_sec := 0
var _duz := {}
func duz_golge(n: Node):
	# web'deki gibi binalarda keskin (düz) yüz gölgelendirmesi
	for m in n.find_children("*", "MeshInstance3D", true, false):
		var me: Mesh = m.mesh
		if me == null: continue
		if _duz.has(me): m.mesh = _duz[me]; continue
		var yeni := ArrayMesh.new()
		for i in me.get_surface_count():
			var st := SurfaceTool.new(); st.create_from(me, i); st.deindex(); st.generate_normals()
			st.set_material(me.surface_get_material(i)); st.commit(yeni)
		_duz[me] = yeni; m.mesh = yeni

func renk_uygula(n: Node):
	# Blender modellerinde renk, malzeme adında saklı: K_rrggbb
	for m in n.find_children("*", "MeshInstance3D", true, false):
		var me: Mesh = m.mesh
		if me == null: continue
		for i in me.get_surface_count():
			var eski: Material = me.surface_get_material(i)
			var ad: String = eski.resource_name if eski else ""
			var p := ad.find("K_")
			var hx := ""
			if p >= 0 and ad.length() >= p + 8: hx = ad.substr(p + 2, 6)
			else:
				var temiz := ad.split(".")[0]
				hx = MALZEME.get(temiz, "#b0a898")
				if hx == "KIREMIT": hx = CATI[cati_sec]
				hx = hx.trim_prefix("#")
			if not _malz.has(hx): _malz[hx] = malz_yap(hx)
			m.set_surface_override_material(i, _malz[hx])

func aabb_bul(n: Node) -> AABB:
	var a := AABB(); var ilk := true
	for m in n.find_children("*", "MeshInstance3D", true, false):
		var b: AABB = m.global_transform * m.get_aabb() if m.is_inside_tree() else m.transform * m.get_aabb()
		if ilk: a = b; ilk = false
		else: a = a.merge(b)
	return a

func model_koy(ad: String, poz: Vector3, olcek: float, don := 0.0) -> Node3D:
	var s := sahne_yukle(ad); if s == null: return null
	var kok := Node3D.new(); kok.add_child(s); add_child(kok)
	kok.position = poz; kok.rotation.y = don; kok.scale = Vector3.ONE * olcek
	for m in s.find_children("*", "MeshInstance3D", true, false): m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	return kok

func bina_koy(ad: String, x: int, z: int, boy: int, rot: int):
	cati_sec = (x * 7 + z * 3) % CATI.size()
	var s := sahne_yukle(ad); if s == null: return
	var kok := Node3D.new(); kok.add_child(s); add_child(kok)
	s.scale = Vector3.ONE * float(OLCEK.get(ad, 1.0))
	kok.position = Vector3(x + boy / 2.0, 0, z + boy / 2.0); kok.rotation.y = rot * PI / 2
	for m in s.find_children("*", "MeshInstance3D", true, false): m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON

func dogal_mesh(ad: String) -> Mesh:
	# GLB'deki tek nesnenin ağını al, malzeme adındaki rengi yüzeylere işle (MultiMesh için)
	var sh := sahne_yukle(ad)
	var mi: MeshInstance3D = sh.find_children("*", "MeshInstance3D", true, false)[0]
	var me: ArrayMesh = mi.mesh.duplicate()
	for i in me.get_surface_count():
		var o: Material = mi.get_surface_override_material(i)
		if o: me.surface_set_material(i, o)
	sh.free()
	return me

func dolu_mu(x: float, z: float) -> bool:
	for b in BINALAR:
		if x > b[1] - 0.3 and x < b[1] + b[3] + 0.3 and z > b[2] - 0.3 and z < b[2] + b[3] + 0.3: return true
	if abs(z - 12.0) < 0.8 and x > 4.5 and x < 19.5: return true
	if abs(x - 12.5) < 0.8 and z > 4.5 and z < 13.5: return true
	if abs(z - 9.0) < 0.8 and x > 4.5 and x < 15.5: return true
	return false

func doga_kur():
	var rng := RandomNumberGenerator.new(); rng.seed = 42
	var turler := [["cam", 140, 0.6, 1.05], ["mese", 90, 0.55, 0.9], ["cali", 160, 0.6, 1.1], ["kaya", 70, 0.5, 1.2]]
	for t in turler:
		var konumlar := []
		var deneme := 0
		while konumlar.size() < t[1] and deneme < 5000:
			deneme += 1
			var x := rng.randf_range(-14, N + 14); var z := rng.randf_range(-14, N + 14)
			var ic := x > 2 and x < N - 2 and z > 2 and z < N - 2
			# köyün içinde seyrek, çevresinde sık orman
			if ic and (rng.randf() < 0.85 or dolu_mu(x, z)): continue
			konumlar.append(Vector3(x, 0, z))
		var mm := MultiMesh.new(); mm.transform_format = MultiMesh.TRANSFORM_3D; mm.mesh = dogal_mesh(t[0]); mm.instance_count = konumlar.size()
		for i in konumlar.size():
			var o: float = rng.randf_range(t[2], t[3])
			var tr := Transform3D(Basis(Vector3.UP, rng.randf() * TAU).scaled(Vector3(o, o * rng.randf_range(0.9, 1.15), o)), konumlar[i])
			mm.set_instance_transform(i, tr)
		var mmi := MultiMeshInstance3D.new(); mmi.multimesh = mm; mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON; add_child(mmi)

func inek_koy(n: int):
	for i in n:
		var k := model_koy("inek", Vector3(6.7 + randf() * 0.5, 0, 7.3 + randf() * 0.3), 1.0, randf() * TAU)
		if k: inekler.append({"d": k, "hedef": k.position, "bekle": randf() * 3})

var ust_etiket: Label
var bilgi_panel: PanelContainer
var bilgi_baslik: Label
var bilgi_yazi: Label
var BINA_BILGI := {}
var karo_bina := {}   # karo indeksi -> bina sözlüğü (dokunma için)
var kayit_v := {}
var arazi_t: Array = []

func noktali(n: int) -> String:
	var s := str(n); var o := ""
	while s.length() > 3: o = "." + s.substr(s.length() - 3) + o; s = s.substr(0, s.length() - 3)
	return s + o

func kisalt(n: float) -> String:
	if n >= 1e6: return "%.1fm" % (n / 1e6)
	if n >= 1e4: return str(int(n / 1000)) + "b"
	return str(int(n))

func kutu_stil(renk: Color, yaricap := 18) -> StyleBoxFlat:
	var st := StyleBoxFlat.new(); st.bg_color = renk; st.set_corner_radius_all(yaricap)
	st.content_margin_left = 18; st.content_margin_right = 18; st.content_margin_top = 10; st.content_margin_bottom = 10
	return st

func arayuz_kur():
	BINA_BILGI = JSON.parse_string(FileAccess.get_file_as_string("res://bina.json"))
	VERI = JSON.parse_string(FileAccess.get_file_as_string("res://urun.json"))
	var cl := CanvasLayer.new(); add_child(cl)
	# üst panel: köy adı, nüfus, kaynaklar
	var p := PanelContainer.new(); p.position = Vector2(16, 16); cl.add_child(p)
	p.add_theme_stylebox_override("panel", kutu_stil(Color(0.29, 0.2, 0.13, 0.9)))
	ust_etiket = Label.new(); ust_etiket.add_theme_font_size_override("font_size", 28); ust_etiket.add_theme_color_override("font_color", Color(1, 0.96, 0.88)); p.add_child(ust_etiket)
	ust_guncelle()
	# alt menü: Siparişler, İNŞA, Ambar (şimdilik görsel)
	var alt := HBoxContainer.new(); alt.set_anchors_preset(Control.PRESET_BOTTOM_WIDE); alt.offset_top = -150; alt.offset_bottom = -30; alt.alignment = BoxContainer.ALIGNMENT_CENTER; alt.add_theme_constant_override("separation", 26); cl.add_child(alt)
	for d in [["Siparişler", Color(0.98, 0.93, 0.82)], ["İNŞA", Color(0.86, 0.67, 0.3)], ["Ambar", Color(0.98, 0.93, 0.82)]]:
		var bt := Button.new(); bt.text = d[0]; bt.custom_minimum_size = Vector2(170 if d[0] == "İNŞA" else 150, 110)
		bt.add_theme_font_size_override("font_size", 30); bt.add_theme_color_override("font_color", Color(0.29, 0.2, 0.13))
		var sb := kutu_stil(d[1], 55); sb.border_color = Color(0.45, 0.32, 0.18); sb.set_border_width_all(5)
		bt.add_theme_stylebox_override("normal", sb); bt.add_theme_stylebox_override("hover", sb); bt.add_theme_stylebox_override("pressed", sb)
		alt.add_child(bt)
		if d[0] == "İNŞA": bt.pressed.connect(insa_ac)
		if d[0] == "Ambar": bt.pressed.connect(ambar_ac)
	_kok_cl = cl
	yer_panel = HBoxContainer.new(); yer_panel.set_anchors_preset(Control.PRESET_BOTTOM_WIDE); yer_panel.offset_top = -300; yer_panel.offset_bottom = -180; yer_panel.alignment = BoxContainer.ALIGNMENT_CENTER; yer_panel.add_theme_constant_override("separation", 20); yer_panel.visible = false; cl.add_child(yer_panel)
	for d in [["İptal", Color(0.85, 0.35, 0.3)], ["Döndür", Color(0.98, 0.93, 0.82)], ["Yerleştir", Color(0.35, 0.7, 0.35)]]:
		var bt := Button.new(); bt.text = d[0]; bt.custom_minimum_size = Vector2(190, 100); bt.add_theme_font_size_override("font_size", 32)
		var sb := kutu_stil(d[1], 40); bt.add_theme_stylebox_override("normal", sb); bt.add_theme_stylebox_override("hover", sb); bt.add_theme_stylebox_override("pressed", sb)
		bt.add_theme_color_override("font_color", Color(0.2, 0.14, 0.08)); yer_panel.add_child(bt)
		if d[0] == "İptal": bt.pressed.connect(yerlestir_iptal)
		elif d[0] == "Döndür": bt.pressed.connect(func(): hayalet_rot = (hayalet_rot + 1) % 4; hayalet_tasi(hayalet_karo))
		else: bt.pressed.connect(yerlestir_onay)
	# bina bilgi paneli (dokununca alttan açılır)
	bilgi_panel = PanelContainer.new(); bilgi_panel.set_anchors_preset(Control.PRESET_BOTTOM_WIDE); bilgi_panel.offset_top = -720; bilgi_panel.offset_bottom = -170; bilgi_panel.offset_left = 16; bilgi_panel.offset_right = -16
	bilgi_panel.add_theme_stylebox_override("panel", kutu_stil(Color(1.0, 0.97, 0.9, 0.97), 26)); bilgi_panel.visible = false; cl.add_child(bilgi_panel)
	var vb := VBoxContainer.new(); vb.add_theme_constant_override("separation", 12); bilgi_panel.add_child(vb)
	var ust := HBoxContainer.new(); vb.add_child(ust)
	bilgi_baslik = Label.new(); bilgi_baslik.add_theme_font_size_override("font_size", 40); bilgi_baslik.add_theme_color_override("font_color", Color(0.25, 0.17, 0.1)); bilgi_baslik.size_flags_horizontal = Control.SIZE_EXPAND_FILL; ust.add_child(bilgi_baslik)
	var kapat := Button.new(); kapat.text = " X "; kapat.add_theme_font_size_override("font_size", 32); kapat.pressed.connect(func(): bilgi_panel.visible = false); ust.add_child(kapat)
	bilgi_yazi = Label.new(); bilgi_yazi.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; bilgi_yazi.add_theme_font_size_override("font_size", 28); bilgi_yazi.add_theme_color_override("font_color", Color(0.3, 0.24, 0.18)); vb.add_child(bilgi_yazi)
	eylem_kutu = VBoxContainer.new(); eylem_kutu.add_theme_constant_override("separation", 8); vb.add_child(eylem_kutu)

# --- İNŞA: liste → yerleştirme önizlemesi → onay; kaynak düşülür, köy kaydedilir
var insa_panel: PanelContainer
var yer_panel: HBoxContainer
var secili_tip := ""
var hayalet: Node3D
var hayalet_karo := Vector2i.ZERO
var hayalet_rot := 0
var _kok_cl: CanvasLayer

func yeter(cost: Dictionary) -> bool:
	var res: Dictionary = kayit_v.get("res", {})
	for k in cost:
		if not k in ["altin", "odun", "tas"]: return false
		if float(res.get(k, 0)) < float(cost[k]): return false
	return true

func maliyet_yazi(cost: Dictionary) -> String:
	var ad := {"altin": "altın", "odun": "odun", "tas": "taş"}; var l := []
	for k in cost: l.append("%s %s" % [kisalt(float(cost[k])), ad.get(k, k)])
	return ", ".join(l)

func insa_ac():
	if insa_panel: insa_panel.queue_free()
	bilgi_panel.visible = false
	insa_panel = PanelContainer.new(); insa_panel.set_anchors_preset(Control.PRESET_FULL_RECT); insa_panel.offset_top = 300; insa_panel.offset_bottom = -170; insa_panel.offset_left = 16; insa_panel.offset_right = -16
	insa_panel.add_theme_stylebox_override("panel", kutu_stil(Color(1.0, 0.97, 0.9, 0.98), 26)); _kok_cl.add_child(insa_panel)
	var vb := VBoxContainer.new(); insa_panel.add_child(vb)
	var ust := HBoxContainer.new(); vb.add_child(ust)
	var bl := Label.new(); bl.text = "İnşa"; bl.add_theme_font_size_override("font_size", 42); bl.add_theme_color_override("font_color", Color(0.25, 0.17, 0.1)); bl.size_flags_horizontal = Control.SIZE_EXPAND_FILL; ust.add_child(bl)
	var kp := Button.new(); kp.text = " X "; kp.add_theme_font_size_override("font_size", 32); kp.pressed.connect(func(): insa_panel.queue_free(); insa_panel = null); ust.add_child(kp)
	var sc := ScrollContainer.new(); sc.size_flags_vertical = Control.SIZE_EXPAND_FILL; vb.add_child(sc)
	var liste := VBoxContainer.new(); liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL; liste.add_theme_constant_override("separation", 8); sc.add_child(liste)
	var klv := int(kayit_v.get("lv", 1) if kayit_v.get("lv") != null else 1)
	var sira: Array = YOL_TIP.duplicate(); for k in BINA_BILGI: if not k in YOL_TIP: sira.append(k)
	for tip in sira:
		var bb: Dictionary = BINA_BILGI[tip]
		if bb.get("gizli", false) or tip in ["cit", "lamba", "teras", "cami"]: continue
		if tip == "kopru" and yol_kasaba: continue
		if not tip in YOL_TIP and not FileAccess.file_exists("res://modeller/%s.glb" % tip): continue
		if int(bb.get("lv", 1)) > klv: continue
		var bt := Button.new(); bt.alignment = HORIZONTAL_ALIGNMENT_LEFT
		bt.text = "%s   ·   %s" % [bb["ad"], maliyet_yazi(bb.get("cost", {}))]
		bt.add_theme_font_size_override("font_size", 28); bt.disabled = not yeter(bb.get("cost", {}))
		bt.pressed.connect(func(): yerlestir_basla(tip))
		liste.add_child(bt)

func yerlestir_basla(tip: String):
	if insa_panel: insa_panel.queue_free(); insa_panel = null
	secili_tip = tip; hayalet_rot = 0
	if hayalet: hayalet.queue_free()
	hayalet = Node3D.new(); add_child(hayalet)
	if not tip in YOL_TIP: var s := sahne_yukle(tip); s.scale = Vector3.ONE * float(OLCEK.get(tip, 1.0)); hayalet.add_child(s)
	var zemin := MeshInstance3D.new(); var bx: int = BOY.get(tip, 1); var pm := PlaneMesh.new(); pm.size = Vector2(bx, bx); zemin.mesh = pm; zemin.position.y = 0.03; zemin.name = "zemin"
	var zm := StandardMaterial3D.new(); zm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED; zm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA; zemin.material_override = zm; hayalet.add_child(zemin)
	hayalet_tasi(Vector2i(int(floor(hedef.x + YARI)), int(floor(hedef.z + YARI))))
	yer_panel.visible = true

func yer_uygun(x: int, z: int, bx: int) -> bool:
	for dz in bx:
		for dx in bx:
			var xx := x + dx; var zz := z + dz
			if xx < 0 or zz < 0 or xx >= WN or zz >= WN: return false
			if int(arazi_t[zz * WN + xx]) != (4 if secili_tip == "kopru" else 1): return false
			if karo_bina.has(zz * WN + xx): return false
	return true

func hayalet_tasi(k: Vector2i):
	var bx: int = BOY.get(secili_tip, 1)
	hayalet_karo = k
	hayalet.position = Vector3(k.x + bx / 2.0 - YARI, 0, k.y + bx / 2.0 - YARI); hayalet.rotation.y = hayalet_rot * PI / 2
	var ok := yer_uygun(k.x, k.y, bx)
	(hayalet.get_node("zemin").material_override as StandardMaterial3D).albedo_color = Color(0.3, 0.9, 0.3, 0.45) if ok else Color(0.95, 0.25, 0.2, 0.45)

func yerlestir_onay():
	var bx: int = BOY.get(secili_tip, 1); var bb: Dictionary = BINA_BILGI[secili_tip]
	if not yer_uygun(hayalet_karo.x, hayalet_karo.y, bx) or not yeter(bb.get("cost", {})): return
	var res: Dictionary = kayit_v["res"]
	for kk in bb.get("cost", {}): res[kk] = float(res[kk]) - float(bb["cost"][kk])
	var yid := 1
	for b in kayit_v["b"]: yid = max(yid, int(b["id"]) + 1)
	var yeni := {"id": yid, "tip": secili_tip, "x": hayalet_karo.x, "z": hayalet_karo.y, "rot": hayalet_rot, "lv": 1, "insa": {"t": 0.0, "top": float(bb.get("sure", 5)), "hedef": 1}}
	if secili_tip in YOL_TIP:
		# yol hemen döşenir; yerleştirme açık kalır, sıradaki karoya dokunup devam edilir
		yeni["insa"] = null; kayit_v["b"].append(yeni)
		karo_bina[hayalet_karo.y * WN + hayalet_karo.x] = yeni; yol_serit[hayalet_karo.y * WN + hayalet_karo.x] = yeni
		yol_yenile(); hayalet_tasi(hayalet_karo); ust_guncelle(); kayit_yaz_koy(); return
	kayit_v["b"].append(yeni)
	for dz in bx:
		for dx in bx: karo_bina[(hayalet_karo.y + dz) * WN + hayalet_karo.x + dx] = yeni
	var m := Vector3(hayalet_karo.x + bx / 2.0 - YARI, 0, hayalet_karo.y + bx / 2.0 - YARI)
	bina_koy_dunya(secili_tip, m, hayalet_rot, yid); bina_gorunum(yeni)
	yerlestir_iptal(); ust_guncelle(); kayit_yaz_koy()

const YOL_TIP := ["yol", "asfalt", "kopru"]
func yol_eylem(b: Dictionary, klv: int):
	var k: int = int(b["z"]) * WN + int(b["x"]); var bb := b
	if b["tip"] == "yol" and klv >= int(BINA_BILGI["asfalt"].get("lv", 12)):
		var c: Dictionary = BINA_BILGI["asfalt"]["cost"]
		eylem_dugme("Asfalta çevir ← %s" % maliyet_yazi(c), func():
			if not yeter(c): return
			for r in c: kayit_v["res"][r] = float(kayit_v["res"][r]) - float(c[r])
			bb["tip"] = "asfalt"; yol_yenile(); ust_guncelle(); kayit_yaz_koy(); bina_goster(bb), yeter(c))
	if b["tip"] != "kopru":
		eylem_dugme("Yolu kaldır", func():
			kayit_v["b"].erase(bb); karo_bina.erase(k); yol_serit.erase(k); yol_yenile(); kayit_yaz_koy(); bilgi_panel.visible = false)
func yerlestir_iptal():
	if hayalet: hayalet.queue_free(); hayalet = null
	secili_tip = ""; yer_panel.visible = false

func kayit_yaz_koy():
	if kayit_v.is_empty() or kayit_adi != "ornek": return
	var f := FileAccess.open("user://koy.json", FileAccess.WRITE)
	kayit_v["zaman"] = simdi_ms()
	if f: f.store_string(JSON.stringify(kayit_v))

# --- çiftlik: ekim/hasat, hayvan besle/topla, ambar
var VERI := {}
var tarla_kap := {}   # bina id -> Node3D (ekin görseli)
var tarla_as := {}    # bina id -> aşama
func simdi_ms() -> float: return Time.get_unix_time_from_system() * 1000.0
func ekin_asama(b: Dictionary) -> int:
	var e = b.get("ekin")
	if not e is Dictionary: return -1
	var f: float = (simdi_ms() - float(e["bas"])) / max(1.0, float(e["bit"]) - float(e["bas"]))
	return 2 if f >= 1 else (1 if f >= 0.45 else 0)
func ekin_yenile(b: Dictionary):
	var id := int(b["id"]); var as_ := ekin_asama(b)
	if tarla_as.get(id, -9) == as_ and tarla_kap.has(id): return
	tarla_as[id] = as_
	if tarla_kap.has(id): tarla_kap[id].queue_free()
	var kap := Node3D.new(); add_child(kap); tarla_kap[id] = kap
	if as_ >= 0:
		var boy: int = BOY.get("tarla", 1)
		var e: Dictionary = (b["ekin"] as Dictionary).duplicate(); e["bas"] = 0; e["bit"] = 1
		# aşamayı ekin_koy'a doğrudan geçirmek için zamanı ayarla
		var sim := simdi_ms(); e["bas"] = sim - (0.0 if as_ == 0 else (0.5 if as_ == 1 else 1.0)) * 1000.0; e["bit"] = e["bas"] + 1000.0
		ekin_koy(e, Vector3(b["x"] + boy / 2.0 - YARI, 0, b["z"] + boy / 2.0 - YARI), kap)
func env_ekle(k: String, n: int):
	var env: Dictionary = kayit_v.get("env", {}); kayit_v["env"] = env
	env[k] = int(env.get(k, 0)) + n
	if int(env[k]) <= 0: env.erase(k)
func urun_ad(k: String) -> String: return str(VERI.get("urun", {}).get(k, {}).get("ad", k))
var eylem_kutu: VBoxContainer
func eylem_dugme(yazi: String, f: Callable, acik := true):
	var bt := Button.new(); bt.text = yazi; bt.add_theme_font_size_override("font_size", 25); bt.clip_text = true; bt.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS; bt.custom_minimum_size = Vector2(0, 52); bt.disabled = not acik; bt.pressed.connect(f); eylem_kutu.add_child(bt)
func ciftlik_eylem(b: Dictionary):
	for c in eylem_kutu.get_children(): c.queue_free()
	var klv := int(kayit_v.get("lv", 1) if kayit_v.get("lv") != null else 1)
	if b["tip"] in YOL_TIP: yol_eylem(b, klv); return
	if b.get("insa") != null:
		var ins: Dictionary = b["insa"]
		var pb := ProgressBar.new(); pb.max_value = float(ins["top"]); pb.value = float(ins["t"]); pb.show_percentage = false; pb.custom_minimum_size = Vector2(0, 26); eylem_kutu.add_child(pb)
		eylem_dugme("%s… %s kaldı" % ["Yükseltiliyor" if int(ins["hedef"]) > 1 else "İnşa ediliyor", sure_yazi(int(ceil(float(ins["top"]) - float(ins["t"]))))], func(): pass, false)
		return
	var ml := int(BINA_BILGI.get(b["tip"], {}).get("maxlv", 1))
	if int(b.get("lv", 1)) < ml:
		var c := yuk_maliyet(b["tip"], int(b.get("lv", 1)) + 1); var bb := b
		var yt := true
		for k in c: if sahip(k) < float(c[k]): yt = false
		eylem_dugme("⬆ Seviye %d ← %s" % [int(b.get("lv", 1)) + 1, girdi_yazi(c)], func(): yukselt(bb), yt)
	if b["tip"] == "tarla":
		var as_ := ekin_asama(b)
		if as_ < 0:
			var sc := ScrollContainer.new(); sc.custom_minimum_size = Vector2(0, 220); eylem_kutu.add_child(sc)
			var vb := VBoxContainer.new(); vb.size_flags_horizontal = Control.SIZE_EXPAND_FILL; sc.add_child(vb)
			for tip in VERI["ekin"]:
				var e: Dictionary = VERI["ekin"][tip]
				if int(e["lv"]) > klv: continue
				var bt := Button.new(); bt.text = "Ek: %s · %d altın · %s" % [urun_ad(tip), int(e["tohum"]), sure_yazi(int(e["sure"]))]; bt.add_theme_font_size_override("font_size", 26)
				bt.disabled = float(kayit_v["res"].get("altin", 0)) < float(e["tohum"])
				bt.pressed.connect(func(): ek(b, tip)); vb.add_child(bt)
		elif as_ < 2:
			var kalan: float = (float(b["ekin"]["bit"]) - simdi_ms()) / 1000.0
			eylem_dugme("%s büyüyor · %s kaldı" % [urun_ad(b["ekin"]["tip"]), sure_yazi(int(kalan))], func(): pass, false)
		else:
			eylem_dugme("Hasat et (+2 %s)" % urun_ad(b["ekin"]["tip"]), func(): hasat(b))
	elif VERI.get("tarif", {}).has(b["tip"]):
		uretim_eylem(b, klv)
	elif VERI["hayvan"].has(b["tip"]):
		var H: Dictionary = VERI["hayvan"][b["tip"]]
		hayvan_hazirla(b)
		var ac := 0; var uret := 0; var hazir := 0; var t := simdi_ms()
		for h in b["hayvan"]:
			if h.get("bit") == null: ac += 1
			elif float(h["bit"]) <= t: hazir += 1
			else: uret += 1
		var yem_var := int(kayit_v.get("env", {}).get(H["yem"], 0))
		eylem_dugme("%d %s: %d aç, %d üretiyor, %d hazır" % [b["hayvan"].size(), H["ad"], ac, uret, hazir], func(): pass, false)
		eylem_dugme("Besle (%s: %d var)" % [urun_ad(H["yem"]), yem_var], func(): besle(b), ac > 0 and yem_var > 0)
		eylem_dugme("Topla (+%d %s)" % [hazir, urun_ad(H["urun"])], func(): hayvan_topla(b), hazir > 0)
func yuk_maliyet(tip: String, lv: int) -> Dictionary:
	# web yukMaliyet ile aynı
	var c := {}; var k := 1.5 if lv == 2 else (2.5 if lv == 3 else 2.5 * pow(1.55, lv - 3))
	var cost: Dictionary = BINA_BILGI[tip].get("cost", {})
	for r in cost: c[r] = int(round(float(cost[r]) * k))
	c["alet"] = int(c.get("alet", 0)) + (2 if lv == 2 else (6 if lv == 3 else 6 + 4 * (lv - 3)))
	if tip == "ambar":
		if lv <= 4: c.erase("alet")
		else: c["alet"] = 3 * (lv - 4)
	if tip == "ev" and lv >= 4: c["tas"] = 25 * (lv - 3); c["kereste"] = 4 * (lv - 3)
	return c
func yukselt(b: Dictionary):
	var lv := int(b.get("lv", 1)); var c := yuk_maliyet(b["tip"], lv + 1)
	for k in c: if sahip(k) < float(c[k]): return
	for k in c: harca(k, float(c[k]))
	b["insa"] = {"t": 0.0, "top": round(float(BINA_BILGI[b["tip"]].get("sure", 5)) * (1.5 if lv == 1 else 2.2)), "hedef": lv + 1}
	bina_gorunum(b); ust_guncelle(); kayit_yaz_koy(); bina_goster(b)
var secili_b = null
func insa_adim(dt: float):
	var yenile: bool = secili_b != null and secili_b.get("insa") != null
	for b in kayit_v.get("b", []):
		if b.get("insa") == null: continue
		var ins: Dictionary = b["insa"]; ins["t"] = float(ins["t"]) + dt
		if float(ins["t"]) >= float(ins["top"]):
			var yeni: bool = int(ins["hedef"]) == 1
			b["lv"] = int(ins["hedef"]); b["insa"] = null
			bina_gorunum(b)
			var tip: String = b["tip"]; var boy: int = BOY.get(tip, 1)
			var m := Vector3(b["x"] + boy / 2.0 - YARI, 0, b["z"] + boy / 2.0 - YARI)
			if tip in HAYVAN_TUR: hayvan_koy(tip, m, HAYVAN_TUR[tip][1] if yeni else 1)
			if tip == "tarla" and yeni: ekin_yenile(b)
			kayit_yaz_koy()
		else: bina_gorunum(b)
	if yenile and bilgi_panel.visible: bina_goster(secili_b)
func bina_gorunum(b: Dictionary):
	# web binaCiz: inşaatta iskele, yeni binada gövde yerden yükselir; apartman 4-5. kat
	var d = bina_dugum.get(int(b["id"])); if d == null: return
	var kok: Node3D = d.kok; var s: Node3D = d.s; var o: float = d.o
	var ins = b.get("insa"); var lvg := int(b.get("lv", 1))
	if ins != null and int(ins["hedef"]) > 1: lvg = int(ins["hedef"]) - 1
	var sy := 1.0
	if b["tip"] == "apartman" and lvg > 3: sy = 1.0 + (lvg - 3) / 3.0
	if ins != null and int(ins["hedef"]) == 1: sy *= 0.08 + 0.92 * clamp(float(ins["t"]) / float(ins["top"]), 0.0, 1.0)
	s.scale = Vector3(o, o * sy, o)
	var isk = kok.get_node_or_null("iskele")
	if ins != null and isk == null:
		isk = iskele_yap(BOY.get(b["tip"], 1)); isk.name = "iskele"; kok.add_child(isk)
	elif ins == null and isk != null: isk.queue_free()
var _isk_malz: Array = []
func iskele_yap(boy: int) -> Node3D:
	# web iskele(): dört direk, iki kat kuşak, çapraz destek
	if _isk_malz.is_empty(): _isk_malz = [malz_yap("6b4e32"), malz_yap("8a6a45")]
	var n := Node3D.new(); var h := 0.7; var w := boy * 0.46
	var kut := func(sx: Vector3, p: Vector3, mt: Material, rz := 0.0):
		var mi := MeshInstance3D.new(); var bm := BoxMesh.new(); bm.size = sx; mi.mesh = bm; mi.material_override = mt; mi.position = p; mi.rotation.z = rz; n.add_child(mi)
	for sx in [-1, 1]:
		for sz in [-1, 1]: kut.call(Vector3(0.035, h, 0.035), Vector3(sx * w, h / 2, sz * w), _isk_malz[0])
	for y in [0.3, 0.62]:
		for sz in [-1, 1]:
			kut.call(Vector3(w * 2 + 0.06, 0.03, 0.08), Vector3(0, y, sz * w), _isk_malz[1])
			kut.call(Vector3(0.08, 0.03, w * 2 + 0.06), Vector3(sz * w, y, 0), _isk_malz[1])
	kut.call(Vector3(0.025, 0.7, 0.025), Vector3(0, 0.35, w), _isk_malz[0], 0.9)
	return n
func sahip(k: String) -> float:
	if k in ["altin", "odun", "tas"]: return float(kayit_v["res"].get(k, 0))
	return float(kayit_v.get("env", {}).get(k, 0))
func harca(k: String, n: float):
	if k in ["altin", "odun", "tas"]: kayit_v["res"][k] = float(kayit_v["res"].get(k, 0)) - n
	else: env_ekle(k, -int(n))
func girdi_yazi(g: Dictionary) -> String:
	var l := []
	for k in g: l.append("%d %s" % [int(g[k]), {"odun": "odun", "tas": "taş", "altin": "altın"}.get(k, urun_ad(k).to_lower())])
	return " + ".join(l)
func uretim_eylem(b: Dictionary, klv: int):
	# web TARIF: girdileri harca, sıraya koy; süresi dolanı topla (sıra en çok 2+lv)
	if not b.get("kuyruk") is Array: b["kuyruk"] = []
	var t := simdi_ms(); var hazir := 0
	for q in b["kuyruk"]:
		if float(q["bit"]) <= t: hazir += 1
	var kmax := 2 + int(b.get("lv", 1))
	eylem_dugme("Sıra: %d / %d   ·   Hazır: %d" % [b["kuyruk"].size(), kmax, hazir], func(): pass, false)
	if hazir > 0: eylem_dugme("Topla (%d ürün)" % hazir, func(): uretim_topla(b))
	for r in VERI["tarif"][b["tip"]]:
		if int(r.get("lv", 0)) > klv: continue
		var yeter_ := true
		for k in r["girdi"]:
			if sahip(k) < float(r["girdi"][k]): yeter_ = false
		var rr: Dictionary = r
		eylem_dugme("%s ← %s · %s" % [urun_ad(r["urun"]), girdi_yazi(r["girdi"]), sure_yazi(int(r["sure"]))], func(): uretim_ekle(b, rr), yeter_ and b["kuyruk"].size() < kmax)
func uretim_ekle(b: Dictionary, r: Dictionary):
	for k in r["girdi"]: harca(k, float(r["girdi"][k]))
	var son := simdi_ms()
	if b["kuyruk"].size() > 0: son = max(son, float(b["kuyruk"][-1]["bit"]))
	b["kuyruk"].append({"u": r["urun"], "bas": son, "bit": son + float(r["sure"]) * 1000.0})
	ust_guncelle(); kayit_yaz_koy(); bina_goster(b)
func uretim_topla(b: Dictionary):
	var t := simdi_ms(); var kalan := []
	for q in b["kuyruk"]:
		if float(q["bit"]) <= t: env_ekle(q["u"], 1)
		else: kalan.append(q)
	b["kuyruk"] = kalan; kayit_yaz_koy(); bina_goster(b)

func sure_yazi(sn: int) -> String:
	if sn >= 3600: return "%d sa %d dk" % [sn / 3600, (sn % 3600) / 60]
	if sn >= 60: return "%d dk %d sn" % [sn / 60, sn % 60]
	return "%d sn" % max(0, sn)
func ek(b: Dictionary, tip: String):
	var e: Dictionary = VERI["ekin"][tip]
	if float(kayit_v["res"].get("altin", 0)) < float(e["tohum"]) or b.get("ekin") is Dictionary: return
	kayit_v["res"]["altin"] = float(kayit_v["res"]["altin"]) - float(e["tohum"])
	var t := simdi_ms(); b["ekin"] = {"tip": tip, "bas": t, "bit": t + float(e["sure"]) * 1000.0}
	ekin_yenile(b); ust_guncelle(); kayit_yaz_koy(); bina_goster(b)
func hasat(b: Dictionary):
	if ekin_asama(b) != 2: return
	env_ekle(b["ekin"]["tip"], 2); b["ekin"] = null
	ekin_yenile(b); ust_guncelle(); kayit_yaz_koy(); bina_goster(b)
func hayvan_hazirla(b: Dictionary):
	var H: Dictionary = VERI["hayvan"][b["tip"]]
	if not b.get("hayvan") is Array: b["hayvan"] = []
	var n: int = int(H["adet"]) + int(b.get("lv", 1)) - 1
	while b["hayvan"].size() < n: b["hayvan"].append({"bit": null})
func besle(b: Dictionary):
	var H: Dictionary = VERI["hayvan"][b["tip"]]; var env: Dictionary = kayit_v.get("env", {})
	for h in b["hayvan"]:
		if h.get("bit") != null: continue
		if int(env.get(H["yem"], 0)) < 1: break
		env_ekle(H["yem"], -1); h["bit"] = simdi_ms() + float(H["sure"]) * 1000.0
	kayit_yaz_koy(); bina_goster(b)
func hayvan_topla(b: Dictionary):
	var H: Dictionary = VERI["hayvan"][b["tip"]]; var t := simdi_ms(); var n := 0
	for h in b["hayvan"]:
		if h.get("bit") != null and float(h["bit"]) <= t: h["bit"] = null; n += 1
	env_ekle(H["urun"], n); kayit_yaz_koy(); bina_goster(b)
func ambar_ac():
	if insa_panel: insa_panel.queue_free()
	insa_panel = PanelContainer.new(); insa_panel.set_anchors_preset(Control.PRESET_FULL_RECT); insa_panel.offset_top = 300; insa_panel.offset_bottom = -170; insa_panel.offset_left = 16; insa_panel.offset_right = -16
	insa_panel.add_theme_stylebox_override("panel", kutu_stil(Color(1.0, 0.97, 0.9, 0.98), 26)); _kok_cl.add_child(insa_panel)
	var vb := VBoxContainer.new(); insa_panel.add_child(vb)
	var ust := HBoxContainer.new(); vb.add_child(ust)
	var bl := Label.new(); bl.text = "Ambar"; bl.add_theme_font_size_override("font_size", 42); bl.add_theme_color_override("font_color", Color(0.25, 0.17, 0.1)); bl.size_flags_horizontal = Control.SIZE_EXPAND_FILL; ust.add_child(bl)
	var kp := Button.new(); kp.text = " X "; kp.add_theme_font_size_override("font_size", 32); kp.pressed.connect(func(): insa_panel.queue_free(); insa_panel = null); ust.add_child(kp)
	var sc := ScrollContainer.new(); sc.size_flags_vertical = Control.SIZE_EXPAND_FILL; vb.add_child(sc)
	var gl := GridContainer.new(); gl.columns = 2; gl.size_flags_horizontal = Control.SIZE_EXPAND_FILL; sc.add_child(gl)
	var env: Dictionary = kayit_v.get("env", {})
	var anahtar := env.keys(); anahtar.sort()
	for k in anahtar:
		var l := Label.new(); l.text = "%s: %s" % [urun_ad(k), kisalt(float(env[k]))]; l.add_theme_font_size_override("font_size", 28); l.add_theme_color_override("font_color", Color(0.3, 0.22, 0.15)); l.size_flags_horizontal = Control.SIZE_EXPAND_FILL; gl.add_child(l)
	if anahtar.is_empty():
		var l := Label.new(); l.text = "Ambar boş."; l.add_theme_font_size_override("font_size", 28); gl.add_child(l)

func ust_guncelle():
	if ust_etiket == null: return
	if kayit_v.is_empty(): ust_etiket.text = "Köy · 42 kişi    Odun 120   Taş 80   Altın 65"; return
	var res: Dictionary = kayit_v.get("res", {})
	var asama := "Şehir" if kayit_v.get("sehir", false) == true else ("İlçe" if kayit_v.get("ilce", false) == true else ("Kasaba" if kayit_v.get("kasaba", false) == true else "Köy"))
	var ad: String = str(kayit_v.get("ad", "")) if kayit_v.get("ad") != null else ""
	var nf: int = max((kayit_v.get("nufus", []) as Array).size(), int(floor(float(kayit_v.get("halk", 0) if kayit_v.get("halk") != null else 0))))
	ust_etiket.text = "%s%s · %s kişi\nAltın %s   Odun %s   Taş %s" % [(ad + " " if ad != "" else ""), asama, noktali(nf), kisalt(float(res.get("altin", 0))), kisalt(float(res.get("odun", 0))), kisalt(float(res.get("tas", 0)))]

func bina_goster(b: Dictionary):
	var bb: Dictionary = BINA_BILGI.get(b["tip"], {"ad": b["tip"], "acik": "", "maxlv": 1})
	var lv := int(b.get("lv", 1)); var ml := int(bb.get("maxlv", 1))
	var yildiz := ""
	if ml > 1: yildiz = "   " + "★".repeat(min(lv, 6)) + "☆".repeat(max(0, min(ml, 6) - lv))
	bilgi_baslik.text = str(bb["ad"]) + yildiz
	bilgi_yazi.text = str(bb["acik"])
	secili_b = b
	ciftlik_eylem(b)
	bilgi_panel.visible = true

var _dokunma_bas := Vector2.ZERO
var _surukledi := false
func dokunma_sec(ekran: Vector2):
	# kameradan ışın → zemin (y=0) → karo → bina
	var o := kamera.project_ray_origin(ekran); var d := kamera.project_ray_normal(ekran)
	if abs(d.y) < 1e-4: return
	var t := -o.y / d.y; if t < 0: return
	var p := o + d * t
	var x := int(floor(p.x + YARI)); var z := int(floor(p.z + YARI))
	if hayalet: var bx: int = BOY.get(secili_tip, 1); hayalet_tasi(Vector2i(x - (bx - 1) / 2, z - (bx - 1) / 2)); return
	var b = karo_bina.get(z * WN + x)
	if b != null: bina_goster(b)
	else: bilgi_panel.visible = false

func kamera_guncelle():
	# web oyunundaki kamera: yakında alçak, uzakta dik bakış
	var t: float = clamp((mesafe - 5.0) / 30.0, 0.0, 1.0)
	var pitch: float = 0.62 + t * 0.42
	var cp := cos(pitch)
	kamera.position = Vector3(hedef.x + mesafe * cp * sin(aci_y), mesafe * sin(pitch), hedef.z + mesafe * cp * cos(aci_y))
	kamera.look_at(hedef, Vector3.UP)

func _unhandled_input(o):
	if o is InputEventScreenTouch:
		if o.pressed:
			dokunuslar[o.index] = o.position
			if dokunuslar.size() == 1: _dokunma_bas = o.position; _surukledi = false
		else:
			dokunuslar.erase(o.index)
			if dokunuslar.is_empty() and not _surukledi and o.position.distance_to(_dokunma_bas) < 20: dokunma_sec(o.position)
	elif o is InputEventScreenDrag:
		if o.position.distance_to(_dokunma_bas) > 20: _surukledi = true
		var eski: Vector2 = dokunuslar.get(o.index, o.position)
		if dokunuslar.size() >= 2:
			var ks := dokunuslar.keys(); var diger: Vector2 = dokunuslar[ks[0] if ks[0] != o.index else ks[1]]
			var d0: float = eski.distance_to(diger); var d1: float = o.position.distance_to(diger)
			if d0 > 1: mesafe = clamp(mesafe * d0 / max(d1, 1.0), 5.0, 40.0)
		else:
			var r: Vector2 = o.relative * mesafe * 0.0016
			var sag := Vector3(cos(aci_y), 0, -sin(aci_y)); var ileri := Vector3(-sin(aci_y), 0, -cos(aci_y))
			hedef -= sag * r.x - ileri * r.y * -1.0
			hedef.x = clamp(hedef.x, 0, N); hedef.z = clamp(hedef.z, 0, N)
		dokunuslar[o.index] = o.position
		kamera_guncelle()
	elif o is InputEventMouseButton and o.pressed:
		if o.button_index == MOUSE_BUTTON_WHEEL_UP: mesafe = max(5.0, mesafe * 0.9); kamera_guncelle()
		elif o.button_index == MOUSE_BUTTON_WHEEL_DOWN: mesafe = min(32.0, mesafe * 1.1); kamera_guncelle()

func hale_kur():
	# geceleri lambaların altındaki sıcak ışık halkası (web lambaZemin gibi)
	if lamba_yer.is_empty(): return
	var gr := Gradient.new(); gr.set_color(0, Color(1, 0.78, 0.45, 0.9)); gr.set_color(1, Color(1, 0.7, 0.4, 0.0))
	var tx := GradientTexture2D.new(); tx.gradient = gr; tx.fill = GradientTexture2D.FILL_RADIAL; tx.fill_from = Vector2(0.5, 0.5); tx.fill_to = Vector2(1.0, 0.5); tx.width = 64; tx.height = 64
	var mt := StandardMaterial3D.new(); mt.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED; mt.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA; mt.blend_mode = BaseMaterial3D.BLEND_MODE_ADD; mt.albedo_texture = tx; mt.no_depth_test = false
	var q := QuadMesh.new(); q.size = Vector2(1.3, 1.3); q.orientation = PlaneMesh.FACE_Y; q.material = mt
	var mm := MultiMesh.new(); mm.transform_format = MultiMesh.TRANSFORM_3D; mm.mesh = q; mm.instance_count = lamba_yer.size()
	for i in lamba_yer.size(): mm.set_instance_transform(i, Transform3D(Basis(), lamba_yer[i] + Vector3(0, 0.03, 0)))
	lamba_hale = MultiMeshInstance3D.new(); lamba_hale.multimesh = mm; lamba_hale.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF; add_child(lamba_hale)

func oyun_saati() -> float:
	# web gunAn ile aynı: gerçek saate bağlı, gündüz daha uzun sürer
	if saat_arg >= 0: return saat_arg
	var p := fmod(Time.get_unix_time_from_system() + 9 * SAAT_SN, GUN_SN) / GUN_SN
	var h := 6 + 14 * p / GUNDUZ_PAY if p < GUNDUZ_PAY else 20 + 10 * (p - GUNDUZ_PAY) / (1 - GUNDUZ_PAY)
	return fmod(h, 24.0)

func gun_isigi():
	if gunes == null: return
	var h := oyun_saati()
	var gnd: float = clamp(sin((h - 5.5) / 15.0 * PI), 0.0, 1.0)   # 5.5 doğuş, 20.5 batış
	var gece := 1.0 - smoothstep(0.0, 0.25, gnd)
	gunes.rotation_degrees = Vector3(-10 - 55 * gnd, 35 + (h - 12) * 8, 0)
	gunes.light_energy = 0.8 * smoothstep(0.0, 0.3, gnd) + 0.16 * gece
	gunes.light_color = Color.html("#ffe6c4").lerp(Color.html("#ff9a5a"), 1.0 - smoothstep(0.1, 0.5, gnd)).lerp(Color.html("#8fa6d8"), gece)
	ortam_e.background_color = Color.html("#d3e1e6").lerp(Color.html("#e9b48c"), (1.0 - smoothstep(0.1, 0.4, gnd)) * (1.0 - gece)).lerp(Color.html("#0c1424"), gece)
	ortam_e.fog_light_color = ortam_e.background_color
	ortam_e.ambient_light_color = Color.html("#a9ad9f").lerp(Color.html("#4a5a88"), gece)
	ortam_e.ambient_light_energy = 0.24 + 0.36 * gece
	if lamba_hale: lamba_hale.visible = gece > 0.1
	# geceleri pencereler ve sokak lambaları yanar
	for hx in ["26343a", "ffd98a"]:
		if _malz.has(hx):
			var m: StandardMaterial3D = _malz[hx]
			m.emission_enabled = gece > 0.05; m.emission = Color.html("#ffc86a"); m.emission_energy_multiplier = gece * (2.5 if hx == "ffd98a" else 1.2)

var _isik_say := 0.0
var lamba_yer := []
var lamba_hale: MultiMeshInstance3D
func _process(dt):
	_isik_say -= dt
	if _isik_say <= 0:
		gun_isigi(); _isik_say = 1.0
		if not kayit_v.is_empty(): insa_adim(1.0)
		if not kayit_v.is_empty():
			for b in kayit_v["b"]:
				if b["tip"] == "tarla" and b.get("ekin") is Dictionary: ekin_yenile(b)
	for i in inekler:
		i.bekle -= dt
		var d: Node3D = i.d
		var fark: Vector3 = i.hedef - d.position
		if fark.length() > 0.05 and i.bekle <= 0:
			d.position += fark.normalized() * dt * 0.25
			d.rotation.y = lerp_angle(d.rotation.y, atan2(fark.x, fark.z), dt * 3)
		elif i.bekle <= 0:
			i.hedef = Vector3(6.7 + randf() * 0.5, 0, 7.3 + randf() * 0.3); i.bekle = 2 + randf() * 4
	for h in hayvanlar:
		h.bekle -= dt
		var d: Node3D = h.d
		var hedef_d: Vector3 = h.m + h.h
		var fark := hedef_d - d.position; fark.y = 0
		if h.bekle > 0: continue
		if fark.length() > 0.03:
			d.position += fark.normalized() * min(fark.length(), h.hiz * dt)
			d.rotation.y = lerp_angle(d.rotation.y, atan2(fark.x, fark.z), dt * 4)
		else:
			h.h = Vector3(randf_range(-0.55, 0.55), 0.04, randf_range(-0.1, 0.9)); h.bekle = 1.5 + randf() * 4
	koylu_adim(dt)
	kare += 1
	if kare == 8 and insa_arg != "": yerlestir_basla(insa_arg)
	if kare == 12 and dokun_arg.x >= 0: dokunma_sec(dokun_arg)
	if kare == 12 and sec_arg >= 0:
		for b in kayit_v["b"]:
			if int(b["id"]) == sec_arg: bina_goster(b)
	if kare == 16 and dugme_arg:
		var d: Array = eylem_kutu.get_children().filter(func(c): return c is Button and not c.disabled)
		if d.size() > 0: d[0].emit_signal("pressed")
		print("DUGME env=", kayit_v.get("env", {}).get("misir"), " havuc=", kayit_v.get("env", {}).get("havuc"))
	if kare == 14 and onay_arg:
		var once: int = kayit_v["b"].size(); yerlestir_onay(); print("INSA SONUC ", once, " -> ", kayit_v["b"].size(), " kayit=", FileAccess.file_exists("user://koy.json"))
	if ekran_yolu != "" and kare == 20:
		get_viewport().get_texture().get_image().save_png(ekran_yolu); get_tree().quit()

func _notification(n):
	if n == NOTIFICATION_WM_CLOSE_REQUEST or n == NOTIFICATION_APPLICATION_PAUSED: kayit_yaz()

func kayit_yaz():
	var f := FileAccess.open("user://kayit.json", FileAccess.WRITE)
	if f: f.store_string(JSON.stringify({"hx": hedef.x, "hz": hedef.z, "m": mesafe}))

func kayit_yukle():
	if not FileAccess.file_exists("user://kayit.json"): return
	var v = JSON.parse_string(FileAccess.get_file_as_string("user://kayit.json"))
	if v is Dictionary: hedef = Vector3(v.get("hx", 12), 0, v.get("hz", 11)); mesafe = v.get("m", 16)
