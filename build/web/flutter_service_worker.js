'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "9d03e72bd2f3f2e64882671e030f5f7f",
"assets/assets/bell.png": "73f3675e230b47119aa65f8f15bca73e",
"assets/assets/bomb.png": "5eee82d2fe8b87a7a1bc9890d4f000a1",
"assets/assets/bomb_charged.png": "59ec7733a1b41a31520649320ac2b63e",
"assets/assets/bomb_dead.png": "24f4eb6d2d55cbfe18a3fe65225ab91f",
"assets/assets/brick.png": "fcf94ff27fa8e64a13f66ae9066000f9",
"assets/assets/explosion_tiny.png": "c2fd24a18951569b556882b79073f826",
"assets/assets/fireball.png": "33597d80299e85db14c96b20b2f57d39",
"assets/assets/fire_monster_left.png": "8cfe3164cae737e0967f393eb99e7a17",
"assets/assets/fire_monster_left_looking_up.png": "a8bf8a9f69299246d9d233c193756408",
"assets/assets/fire_monster_left_phase_2.png": "0f8ecd177a6457a955e2a45ebc10fdc9",
"assets/assets/fire_monster_left_phase_3.png": "d4f4141ee1ff312a8f2638f889110d71",
"assets/assets/fire_monster_right.png": "cc02c4da48b234ba001d7cdf2848efe7",
"assets/assets/fire_monster_right_looking_up.png": "e1f862fb3212bad4adf42643c2615cda",
"assets/assets/fire_monster_right_phase_2.png": "97f5a1c2ef81092145a648127224805b",
"assets/assets/fire_monster_right_phase_3.png": "bc6852f22215a9254a5cfe9bff0986e6",
"assets/assets/fire_monster_small_dead.png": "0a8a24eed50f2e8788cb4e2b0b0080e7",
"assets/assets/fire_monster_small_left.png": "1a9eb208543987c2e65e04806997a9b6",
"assets/assets/fire_monster_small_right.png": "53572a1f57179bb81450ad42873fcc60",
"assets/assets/ghost.png": "4711e57ea8b4cc2eb9cd4aedc16959c3",
"assets/assets/ghost_2.png": "22c34c46fe6b365e8db9045294ef9a44",
"assets/assets/ghost_3.png": "7929b099d35282b7f6adfbb422f334ca",
"assets/assets/ghost_dead.png": "6e5d46aefea82946723bd8c05cc44a22",
"assets/assets/grass1x1.png": "2d554c05e054d75883bab0dfdd6e6a21",
"assets/assets/grass1x4.png": "dfd007798c4585a81fde93ca7fa4a6b0",
"assets/assets/grass4x1.png": "c561dcb73e3ffe88dd83ccafbd513882",
"assets/assets/grass4x4.png": "1f8ffe12726ad347baeff2bf14393806",
"assets/assets/icicle.png": "17aaf1c2cfdeda83fdf5867854fe8b8e",
"assets/assets/jumper.png": "b3873f06ca76b88d847b158772ce5cfe",
"assets/assets/jumper_dead.png": "7ae0689d9640309afcaf6b7520f33437",
"assets/assets/log.png": "89dab0fafd89153d52bff41cf2c4a615",
"assets/assets/marble_arch1x1.png": "dcc0adddb3811399af198ab7c205268c",
"assets/assets/marble_column1x4.png": "03f297980bf3ec01ec4ef6f8c2468283",
"assets/assets/monster_dead.png": "601c8163d1eb282dfc0894563e9e5f98",
"assets/assets/monster_left.png": "47e979b7692f9ae587371572b6e467cf",
"assets/assets/monster_left_small.png": "4613dd5aae08af8a2e17ec16da1901c0",
"assets/assets/monster_left_small_2.png": "6c91f45cfd29512ffae829fa431977cd",
"assets/assets/monster_right.png": "5e17d2746ed6b3372c52ebd03291436b",
"assets/assets/monster_right_small.png": "e106ea8a75c8dc8b0c624e517203a0df",
"assets/assets/monster_right_small_2.png": "0a98a21f06ed95d6def6805ae28a0f03",
"assets/assets/player_dead_small.png": "5aac6f809555c1d53d331b680277f4db",
"assets/assets/player_fireball.png": "b52aac5e3ade38ad33e8c33d3aaa09ff",
"assets/assets/player_left.png": "e84fa81bb7061c22bfc0603200a3135a",
"assets/assets/player_left_small.png": "f1c3390de3e6be1562c7e8997c513d9e",
"assets/assets/player_right.png": "c5f1da19a467b1b3974fceae57cf9040",
"assets/assets/player_right_small.png": "64ce0c17447ea93cdac8baa0ededc710",
"assets/assets/powerup_fireball_0.png": "0aff30c7f038b609f9098dabb587addc",
"assets/assets/powerup_fireball_1.png": "1a4a57c5bf8ceb81c27847689b1b43dc",
"assets/assets/powerup_fireball_2.png": "94ea3042d0ee545e5801dd09b11f7f16",
"assets/assets/powerup_fireball_3.png": "6669e432217df4af828bd1de8eaae114",
"assets/assets/powerup_fireball_static.png": "d08a074f98b41a0b4fb0a33ae33d0ccc",
"assets/assets/signage_grass.png": "fe5f96ff2c6cd5f63706a1e73241d67e",
"assets/assets/signage_grass_large.png": "efad6673fa96acc0312b2d8ecc05e40f",
"assets/assets/sign_ghosts.png": "92493fc4724945cbe7bf54cea81049f5",
"assets/assets/spiked_monster_left_small.png": "5ebca4605e6ee49c6721d65effe013b4",
"assets/assets/spiked_monster_left_small_2.png": "6353051fc0384355eb61cfce201a8990",
"assets/assets/spiked_monster_right_small.png": "94f9bb1b0269b252c21f16ec3237df51",
"assets/assets/spiked_monster_right_small_2.png": "cb12ce9b4aaa90596a3fcb4a4176efea",
"assets/assets/winged_monster.png": "7c40d914c0157c6c3ef0a701db050782",
"assets/FontManifest.json": "fe5eb37f0eccb7743c3d56dc409f604a",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/SpaceMono-Regular.ttf": "30f0830dc4f19b56236af42822981e47",
"assets/NOTICES": "ddf2497440494bdbfbd32e8458a10f58",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0513edc97a5f356e0e27b8fc7fb4737e",
"/": "0513edc97a5f356e0e27b8fc7fb4737e",
"main.dart.js": "25ac9e0155d59aad8132964f067cabdc",
"manifest.json": "a70477ba06a7fec124ba66379f97dbb5",
"splash/img/dark-1x.png": "a7a7fac2bfb228f3fe8e2864b6585824",
"splash/img/dark-2x.png": "fdd1ec63728a198fdd69e35849933666",
"splash/img/dark-3x.png": "d8972e2abea51b658039f2f5a85e48ce",
"splash/img/dark-4x.png": "f0bf42533f64f058b3c52793ac6c2ac1",
"splash/img/light-1x.png": "a7a7fac2bfb228f3fe8e2864b6585824",
"splash/img/light-2x.png": "fdd1ec63728a198fdd69e35849933666",
"splash/img/light-3x.png": "d8972e2abea51b658039f2f5a85e48ce",
"splash/img/light-4x.png": "f0bf42533f64f058b3c52793ac6c2ac1",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "cdd9bb523dd3c61f07e66cfc0458bd5c",
"version.json": "f3b2bff24a96fe92ab74d23e7f01734c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
