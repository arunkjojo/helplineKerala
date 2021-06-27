let cacheData = "helplineKerala";
this.addEventListener("install", (event) => {
    event.waitUntil(
        caches.open(cacheData).then((cache) => {
            cache.addAll([
                'https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css',
                'chrome-extension://fmkadmapgofadopljbjfkapdkoienihi/build/react_devtools_backend.js',
                'https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js',
                'https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css',
                '/static/css/2.b0ddf00b.chunk.css',
                '/static/css/main.c707e97d.chunk.css',
                '/static/js/2.bbf604bc.chunk.js',
                '/static/js/main.72bfd52b.chunk.js',
                '/static/css/2.b0ddf00b.chunk.css',
                'static/css/main.c707e97d.chunk.css',
                'static/js/2.bbf604bc.chunk.js',
                '/static/js/main.72bfd52b.chunk.js',
                '/logo_icon192.png',
                '/icon1.ico',
                '/manifest.json',
                '/static/js/main.chunk.js',
                '/static/js/vendors~main.chunk.js',
                '/static/js/bundle.js',
                '/app',
                '/login',
                '/register',
                '/forgotpassword',
                '/index.html',
                '/public',
                '/app/create',
                '/app/logout',
                '/'
            ])
        })
    )
})
this.addEventListener("fetch", (event) => {


    // console.warn("url",event.request.url)


    if (!navigator.onLine) {
        event.waitUntil(
            this.registration.showNotification("Internet", {
                body: "internet not working",
            })
        )
        event.respondWith(
            caches.match(event.request).then((resp) => {
                if (resp) {
                    return resp
                }
                let requestUrl = event.request.clone();
                fetch(requestUrl);
            })
        )
    }
})