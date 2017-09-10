<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>${self.title()}</title>
        <meta name="description" content="${self.description()}">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

        <!-- Stylesheets -->
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lora:400italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/lib/css/style.css">

        <!-- RSS -->
        <link rel="alternate" type="application/atom+xml" href="/atom.xml">
        <link rel="alternate" type="application/rss+xml" title="RSS" href="/rss.xml">

        <!-- JS -->
        <script type="text/javascript" src="https://ws.sharethis.com/button/buttons.js"></script>
        <script type="text/javascript">stLight.options({publisher: "ur-bd6ecc7d-a28e-7a33-9fa5-a9f85b7af5fe", doNotHash: false, doNotCopy: true, hashAddressBar: false});</script>

        <!-- Social -->
        <link href="https://plus.google.com/+Truverisprescriptions" rel="publisher">
        <meta name="twitter:card" content="summary">
        <meta name="twitter:site" content="@truveris">
        <meta name="twitter:title" content="${self.title()}">
        <meta name="twitter:description" content="${self.description()}">
        <meta name="twitter:creator" content="@truveris">
        <meta name="twitter:domain" content="truveris.github.io">
        <meta name="twitter:image:src" content="/lib/img/${self.illustration()}">

        <meta property="og:title" content="${self.title()}">
        <meta property="og:description" content="${self.description()}">
        <meta property="og:url" content="https://truveris.github.io/">
        <meta property="og:site_name" content="truveris.github.io">
        <meta property="og:type" content="blog">
        <meta property="og:image" content="/lib/img/${self.illustration()}">

        <!-- SEO -->
        ${self.canonical()}

        <!-- Force https -->
        <script type="text/javascript">
            var host = "truveris.github.io";
            if ((host == window.location.host) && (window.location.protocol != "https:"))
                window.location.protocol = "https";
        </script>
    </head>

    <body itemscope itemtype="http://schema.org/WebPage">
        <%include file="/base_header.mako" />
        ${next.body()}
        <%include file="/base_footer.mako" />
    <%include file="/base_ga.mako" />
    </body>

</html>

<%def name="description()">Truveris engineering blog</%def>
<%def name="illustration()">logo.png</%def>
<%def name="canonical()"></%def>

## vim: ft=mako
