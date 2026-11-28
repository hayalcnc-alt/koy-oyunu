# Web (Play'deki) oyun ile Godot sürümü özellik eşitliği

Godot'ya geçiş ancak bu listenin tamamı [x] olunca ve kullanıcı onaylayınca.

## Var
- [x] Harita: arazi, deniz, dere, dağ, orman, yollar, binalar (web kaydını birebir çizer)
- [x] Gece/gündüz, pencere ve lamba ışıkları
- [x] İnşa listesi, hayalet yerleştirme, döndür, maliyet
- [x] İnşaat süresi + iskele, bina yükseltme (yukMaliyet), apartman katları
- [x] Üretim binaları (tarif, sıra, topla)
- [x] Tarla ek/hasat, çiftçilerin otomatik biçip ekmesi (otoTopla), tarlada çapalayan köylüler + iş çubuğu
- [x] Hayvanlar (ahır/ağıl/kümes), besle/topla — kullanıcının modelleri
- [x] Yol yapımı (toprak/asfalt/köprü, asfalta çevir, kaldır)
- [x] Üst çubuk (seviye, kaynaklar, saat), alt düğmeler, ambar listesi
- [x] Ambar: ürün listesi, tane fiyatı, "Sat 1" / "Hepsi" (web ambarCiz birebir)
- [x] Siparişler (web siparisUret/Adim/Teslim/Kim/Max/Aralik birebir), seviye atlama ödülü (xpEkle)

- [x] İş gücü (web hesapla birebir: ev yeri, kuyu +2, emekliler), işçi atama +/−, çalışana göre üretim hızı, oduncu/ocak kendiliğinden odun/taş (k04'te taş +36/dk web ile aynı)
- [x] Otomatik toplama (otoTopla: tarla, hayvan, atölye, ağaç, kovan) + xp, otomatik üretim (otoUretim: sıra doldurma, yemleme, sipariş önceliği, yedek), toplama binaları (TOPLA), meyve ağaçları (AGAC), dükkân mesaisi, "Otomatik açık/kapalı"
- [x] Taşı (ücretsiz, hayalet ile), yık (malzemenin yarısı geri, yükseltmeler dahil), döndür
- [x] Çit (tarla/ağaç/kovan üstüne, komşu çitler birleşir, "Çiti kaldır" +1 odun), sokak lambası (yol kenarı/boş yer, döndür, gece ışığı); yol_yenile teras/lambaları da yeniden kuruyor
- [x] Orman/kayalığa kurma (ağaç/kaya temizlenir, +3 odun/+2 taş, karo çayır olur), dere/deniz kıyısı ve dağ eteği şartları, suya/dağa dönük otomatik yön
- [x] İnşaatçılar: en yakın köylüler şantiyeye gider, kazma/kürekle çalışır; çalışan sayısı inşaat hızını belirler (web insaatciAta/insaatAdim/insaAdim)
- [x] Ağaca/kayaya dokunup işaretleme; boştaki köylü baltayla 30 sn keser/kırar, ağaç kütüğe döner (90 sn sonra çürür), odunu/taşı yola taşır (+12 odun / +10 taş) — web kesimIsaretle/oduncuAdim
- [x] Ekim paneli: "Bu tarla" / "Boş tarlaların hepsi", seviyeye göre sıralı ekin listesi (kilitliler görünür), gübre %20 hızlandırır (web ekimAc/ek)
- [x] Bahçe evin yanına kurulur (kapı önü olmaz, her eve bir bahçe, açık tarafı eve bakar), ev yıkılınca bahçe yeniden bağlanır; ev avlusundaki sebze tarhı (4 dk'da 1, en çok 2) otomatik toplanır
- [x] Dört mevsim (2 oyun günü), kışın kar örtüsü/karlı ağaç ve çatılar/yağan kar, güzün sararan yapraklar, bahar-güz yağmuru, güz fırtınası, yaz kuraklığı (kuyu yoksa ekin 1.4x yavaş), kışın açık tarla 1.6x yavaş; mevsim saat çipinde (web mevsim/hava/mevsimAdim)
- [x] Rehber kartı (hasat, sipariş, hazır ürün, aç hayvan, boş tarla, boş atölye, yeni bina, tarla öner; X ile 3 dk sus, seviyeye kalan tecrübe), seviye atlama penceresi (ödül + yeni açılanlar), İNŞA çekmecesi kategorilerle ve kilit nedenleriyle (web kartEngel: seviye, nüfus şartı, zaten var, tarla sınırı, bahçe sayısı, boş köylü), alet/kereste maliyetleri ambardan
- [x] Üst çubuk web gibi: adın altında seviye ilerleme çubuğu, köylü çipi “çalışan/iş gücü” (fazlaysa kırmızı), ambar çipi (ambardaki ürün toplamı); keyif çipi dişlinin yanına alındı
- [x] Çimende ot tutamları, kır çiçekleri ve koyu çalılar (web araziKur, parçalı MultiMesh); tarlalarda tarla başına 3 çapacı (en çok 48), kamera başka tarlalara gidince onlar da oraya geçer
- [x] Gece web gibi: ay ışığı tepeden ve daha güçlü vurur (gölgeli, mavimsi), renkler solar (yeşiller parlamaz)
- [x] Kış web gibi: zemin bembeyaz karla örtülür, kiremit çatılar beyazlaşır, ot ve çiçekler karın altında kalır
- [x] Köy keyfi (web memnuniyet: hizmetler, kapasite oranı, lamba/yol/bahçe, bayram, kış/kuraklık/fırtına, kalabalık, vergi), keyif çipi + nedenler paneli, keyfe göre toplama hızı; enerji (güneş/rüzgâr), turist, vergi geliri, belediye kasası ve vergi kademesi seçimi

## Eksik (önem sırasıyla)
- [ ] Bulut kaydı + web kaydını Godot'ya aktarma (Firebase kayitlar/uid, CV.kod)
  - Araştırma (27 Kasım): web her oyuncunun köyünü otomatik buluta yedekliyor (cvYedekle → kayitlar/{uid}: veri, zaman, ad, lv, kod).
    Köy kodu = uid'in ilk 8 harfi (☁️ Hesap ve yedek penceresinde görünüyor), "Köy koduyla getir" (kayitBul: documentId önek araması) zaten var.
  - Plan: Godot'da Firebase REST — anonim giriş (identitytoolkit accounts:signUp), Firestore REST runQuery ile kodla köy bulma, aynı biçimde yedekleme.
    Geçişten önce web'e "yeni sürüme geçerken köy kodunu not al" uyarısı. Google'a bağlı hesaplar için Google ile giriş ayrıca.
  - Canlı Firebase'de deneme hesabı açmak kullanıcı onayı bekliyor.
- [ ] Paket adı/imza: Play'deki uygulamanın güncellemesi olarak çıkma
- [x] Köylü işleri: köylü sayısı iş gücü kadar (en çok 40), iş yeri slotları sırayla (k.is, dükkânlar mesai dışı boş), işçi işyerine gidip çalışır/eve uğrar, balıkçı olta tutar; oduncu işçileri agacBul ile çevredeki ağacı keser, keresteciye/oduncuya taşır (12+3·lv); kütük çürüyünce kıyıda fidan, fidan 150 sn sonra ağaç; kapalıyken geçen süre odun/taş (yokkenGecen, en çok 4 saat)
- [x] Memnuniyette makine işsizliği (tarimDurum: köylülerin saban/pulluk/traktörü tarlada çalışanı azaltır, boşta kalanı fabrika ve atölyeler alır), kooperatif, fabrika dumanı ve fabrikada iş (sanayiDenge), yangın −12, cenaze günü yas −8. Çöp: ara sıra evlerin, yolların, pazarın yanına çöp düşer (en çok 8), boştaki köylüler eğilip toplar, 2’den fazlası keyfi düşürür; emekliler (yaşlılar) artık çalışmaz, boş vakitlerinde gezer/çöp toplar/işaretli ağacı keser. Örnek kayıttaki adsız kişi kayıtları atılıp köylüler adlarıyla yeniden kurulur (nufusKur)
- [x] Aşamalar: Oba → Mezra → Köy → Kasaba (2.000) → İlçe (10.000) → Şehir (50.000), yalnız nüfusa bağlı; nüfus konut kapasitesine doğru yavaşça büyür (halkAdim, memnuniyet hızlandırır); geçişte tebrik penceresi + gazete, evler kasaba/şehir modeline döner, kasabada apartman 5 kat; üstteki ad/nüfus çipine dokununca “Sıradaki hedef” penceresi. Göç: keyif 40’ın altındayken en sık 20 dakikada bir bir aile eşyasını kamyona yükler (kamyon köy yollarından gelir, sarı işaret, sebep söylenir: en büyük sıkıntı ya da eksik bina); keyif düzelirse vazgeçer, muhtar konuşursa süre uzar, 4 dakikada göçer ve nüfus 4 azalır. Gelen aileler: nüfus her 4 kişi arttıkça kamyonla bir aile gelir, kamyondan inip evine girer, günde bir kez gazeteye yazılır
- [x] Keşif / kâşif / yeni bölgeler: web’de sis kapalı (SIS_KAPALI = true), bütün ada baştan açık; Godot’da da her kayıtta bütün bölgeler açılır. Ada/takımada (başka oyuncuların köyleri, gemiyle ticaret) çevrimiçi olduğu için “Sohbet/çevrimiçi” maddesinde
- [x] Olaylar/hikâyeler (web OLAYLAR: 18 olay, en sık 15 dakikada bir, iki seçenek, ceza yok, tek seferlikler bir kez) + sabah gazetesi (dünün olayları, 7-12 arası, son 8 satır). Olay köyde sahnelenir: olay yerinde (ahır, mandıra, kahvehane, muhtarlık, meydan…) sarı işaret ve başlık belirir, en yakın 5 köylü koşup etrafında toplanır; işarete dokununca seçim, seçimden sonra köylüler el çırpar; 4 dakika dokunulmazsa olay kendi seyrinde biter (keyif artmaz). Not: web’deki özel sahneler (inek kaçar, tavuklar komşu bahçesine girer, imecede çatı akar — yapıldı: imecede evin etrafına iskele kurulur, dokunulmazsa çatı akar ve ev yarı kapasiteye düşer, “Çatı akıyor” işareti çıkar, evin panelinden “İmeceye çağır · 12 odun” ile köylüler iskelede onarır; inek kaçar yapıldı: ahırdan bir inek dağa doğru yürür, işaret onu izler, kovalayan köylü peşinden gider, seçimden sonra ağılına döner, dokunulmazsa gözden kaybolur ve 3 gün ahırda eksik kalır (beslenmez, ürün vermez), sonra kendi döner; tavuklar komşu bahçesine girer (kümesten üç tavuk en yakın evin önüne gider, seçimden sonra döner, dokunulmazsa yumurtlamaz) ve Almancının mavi arabası köy yollarından gelip meydanda durur, sonra döner — hepsi yapıldı)
- [x] Rehberin ilk açılış adımları (çadır → kuyu → tarla → ilk ekim → ilk ev), dayıbaşı/bayi/benzinlik önerileri, nüfus şartı ipucu (“Nüfus N olunca X kurulabilir”), öneriye dokununca İNŞA doğru sekmede açılır; teraslı ev inşa listesinde (yerleştirirken ev görünür, bitince teraslı ev prosedürel çizilir)
- [x] Sesler, ayarlar: web’deki osilatör sesleri aynı notalarla üretilir (inşa, tamam, görev, hasat, yık, hata, balta/taş — yakındaki oduncu vurdukça); sağ üstte dişli düğmesi → Köy Ayarları (nasıl oynanır, ses aç/kapa, köy adı, ürünleri köylüler toplasın, yol gösteren baloncuk, köy kodu bilgisi). Not: grafik kalitesi ve dereyi taşı seçenekleri yok; köy kodu/bulut bulut aktarması maddesinde
- [ ] Sohbet / çevrimiçi
- [x] Yangın, cenaze/mezarlık, düğün: yangın (seviye 8+, alev/duman, itfaiye ya da 20 altınla köylüler söndürür); vefat (ömür 68-92, şifa evi/sağlık ocağı/hastane uzatır, günde en çok bir), vefat haberi penceresi, cenaze 13:00’te mezarlıkta (köylüler tabutun önünde saf tutar; camiye dokunulmadı), hayır lokması gazetesi; askere uğurlama ve düğün 16:30’da meydanda halay, askerden dönen nişanlanır, kız isteme olayı düğün planlar; eski kayıtlarda yaşlar düzeltilir (yasGoc/yasDuzelt). Askere uğurlamada askeri kamyon meydanın yanında bekler, asker el sallar, sonunda kamyona binip gider; düğünde gelin ile damat ortada, gelinin başında al duvak. Not: tabutun camiden mezarlığa taşınması (camiye dokunulmuyor) ve gelinlik/damatlık giysi modelleri (Godot’da model yok) henüz yok. Mezar taşları (her bölümde 4×3) ve mezarlık dolunca yanına yeni bölüm açılması yapıldı
