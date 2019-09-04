if (window.location.origin && window.location.origin.indexOf('.dev.') === -1) {
    var s = document.createElement("script");
    s.type = "text/javascript";
    s.async = true;
    s.src = "https://www.googletagmanager.com/gtag/js?id=UA-137484692-1";
    var head = document.getElementsByTagName('head')[0];
    head.appendChild(s);

    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'UA-137484692-1');
}