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

## Eksik (önem sırasıyla)
- [ ] Bulut kaydı + web kaydını Godot'ya aktarma (Firebase kayitlar/uid, CV.kod)
  - Araştırma (27 Kasım): web her oyuncunun köyünü otomatik buluta yedekliyor (cvYedekle → kayitlar/{uid}: veri, zaman, ad, lv, kod).
    Köy kodu = uid'in ilk 8 harfi (☁️ Hesap ve yedek penceresinde görünüyor), "Köy koduyla getir" (kayitBul: documentId önek araması) zaten var.
  - Plan: Godot'da Firebase REST — anonim giriş (identitytoolkit accounts:signUp), Firestore REST runQuery ile kodla köy bulma, aynı biçimde yedekleme.
    Geçişten önce web'e "yeni sürüme geçerken köy kodunu not al" uyarısı. Google'a bağlı hesaplar için Google ile giriş ayrıca.
  - Canlı Firebase'de deneme hesabı açmak kullanıcı onayı bekliyor.
- [ ] Paket adı/imza: Play'deki uygulamanın güncellemesi olarak çıkma
- [ ] İşçi atama (+/-), çalışan sayısına göre üretim hızı
- [ ] Köylü işleri: oduncu, taşçı, inşaatçı köylüler; ağaca/kayaya dokunup odun/taş toplama
- [ ] Otomatik üretim (otoUretim), toplama binaları (TOPLA: kovan, bahçe, maden…), meyve ağaçları (AGAC)
- [ ] Nüfus/ev kapasitesi hesabı (hesapla), mutluluk
- [ ] Taşı / yık, çit, lamba
- [ ] Toplu ekim paneli
- [ ] Aşamalar: köy → kasaba → ilçe → şehir (geçiş koşulları, ev modelleri değişimi)
- [ ] Keşif / kâşif / yeni bölgeler, ada/takımada
- [ ] Mevsim, hava (yağmur, kar, kuraklık)
- [ ] Olaylar/hikâyeler (kısa ve seyrek), gazete
- [ ] Hedefler/rehber, seviye atlama penceresi
- [ ] Sesler, ayarlar (kalite, ses)
- [ ] Sohbet / çevrimiçi
- [ ] Yangın, cenaze/mezarlık, düğün vb. köy olayları
