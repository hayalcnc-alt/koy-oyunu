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

## Eksik (önem sırasıyla)
- [ ] Bulut kaydı + web kaydını Godot'ya aktarma (Firebase kayitlar/uid, CV.kod)
  - Araştırma (27 Kasım): web her oyuncunun köyünü otomatik buluta yedekliyor (cvYedekle → kayitlar/{uid}: veri, zaman, ad, lv, kod).
    Köy kodu = uid'in ilk 8 harfi (☁️ Hesap ve yedek penceresinde görünüyor), "Köy koduyla getir" (kayitBul: documentId önek araması) zaten var.
  - Plan: Godot'da Firebase REST — anonim giriş (identitytoolkit accounts:signUp), Firestore REST runQuery ile kodla köy bulma, aynı biçimde yedekleme.
    Geçişten önce web'e "yeni sürüme geçerken köy kodunu not al" uyarısı. Google'a bağlı hesaplar için Google ile giriş ayrıca.
  - Canlı Firebase'de deneme hesabı açmak kullanıcı onayı bekliyor.
- [ ] Paket adı/imza: Play'deki uygulamanın güncellemesi olarak çıkma
- [ ] Köylü işleri: köylülerin iş binalarına atanıp gidip gelmesi (k.is), oduncu binası işçilerinin çevredeki ağaçları kesmesi (agacBul), fidan/kıyıda yeni ağaç (kiyiYerBul)
- [ ] Mutluluk (memnuniyet), enerji/turist/vergi gelirleri, belediye kasası
- [ ] Bahçe evin yanına kurulur kuralı (web bahceEvi/bahceBagla, ev avlusu çiti)
- [ ] Aşamalar: köy → kasaba → ilçe → şehir (geçiş koşulları, ev modelleri değişimi)
- [ ] Keşif / kâşif / yeni bölgeler, ada/takımada
- [ ] Mevsim, hava (yağmur, kar, kuraklık)
- [ ] Olaylar/hikâyeler (kısa ve seyrek), gazete
- [ ] Hedefler/rehber, seviye atlama penceresi
- [ ] Sesler, ayarlar (kalite, ses)
- [ ] Sohbet / çevrimiçi
- [ ] Yangın, cenaze/mezarlık, düğün vb. köy olayları
