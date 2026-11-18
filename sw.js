// Köyden İndim Şehire — çevrimdışı açılış ve hızlı yükleme
const ONBELLEK = 'koy-v2';
const KABUK = ['./', 'index.html', 'manifest.webmanifest', 'ikon-192.png', 'ikon-512.png', 'ikon-180.png', 'logo.png'];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(ONBELLEK).then(c => c.addAll(KABUK)).catch(() => {}));
  self.skipWaiting();
});

self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k !== ONBELLEK).map(k => caches.delete(k))))
    .then(() => self.clients.claim()));
});

async function agOnce(istek) {
  try {
    const y = await fetch(istek);
    if (y && y.ok) { const c = await caches.open(ONBELLEK); c.put(istek, y.clone()); }
    return y;
  } catch (err) {
    const k = await caches.match(istek, { ignoreSearch: true });
    if (k) return k;
    if (istek.mode === 'navigate') { const a = await caches.match('index.html'); if (a) return a; }
    throw err;
  }
}

async function onbellekOnce(istek) {
  const k = await caches.match(istek);
  if (k) return k;
  const y = await fetch(istek);
  if (y && (y.ok || y.type === 'opaque')) {
    const c = await caches.open(ONBELLEK);
    // eski model dosyalarını temizle
    if (/modeller-[0-9a-f]+\.bin/.test(istek.url)) {
      for (const eski of await c.keys()) if (/modeller-[0-9a-f]+\.bin/.test(eski.url) && eski.url !== istek.url) c.delete(eski);
    }
    c.put(istek, y.clone());
  }
  return y;
}

self.addEventListener('fetch', e => {
  const r = e.request;
  if (r.method !== 'GET') return;
  const u = new URL(r.url);
  if (u.origin === self.location.origin) {
    if (u.pathname.endsWith('version.json')) return;           // güncelleme kontrolü hep ağdan
    if (/modeller-[0-9a-f]+\.bin$/.test(u.pathname)) { e.respondWith(onbellekOnce(r)); return; }
    e.respondWith(agOnce(r));
    return;
  }
  if (u.hostname === 'fonts.googleapis.com' || u.hostname === 'fonts.gstatic.com') e.respondWith(onbellekOnce(r));
});
