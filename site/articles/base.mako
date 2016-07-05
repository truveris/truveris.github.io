<%inherit file="/base.mako"/>

<%def name="title()">${article.title} - truveris.github.com</%def>
<%def name="description()">${article.description}</%def>
<%def name="illustration()">${article.illustration}</%def>

<article itemtype="http://schema.org/BlogPosting" itemscope class="main hentry entry" role="main">

    <!-- Article header -->
    <header>
        <figure>
            <img src="/lib/img/${article.illustration}" alt="${article.title}" class="roundimg">
        </figure>

        <h1 itemprop="name headline" role="heading">${article.title}</h1>
    </header>

    <!-- Article content -->
    <div itemprop="description articleBody" class="entry-content">
        ${next.body()}
        <div class="large-separator" role="separator"></div>
    </div>

    <!-- Article footer -->
    <footer class="post-footer clearfix">

            <div class="post-social">
                <span class='st_twitter_hcount' displayText='Tweet' st_via="truveris"></span>
                <span class='st_linkedin_hcount' displayText='LinkedIn'></span>
            </div>

            <div class="byline vcard">
                <meta content="https://truveris.github.io/${article.url}" itemprop="url">

                <a href="https://github.com/${article.author.username}">
                    <img src="/lib/img/${article.author.avatar}" alt="${article.author.name} profil pic" class="profil_pic">
                </a>

                <span class="fn author" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
                    <a href="https://github.com/${article.author.username}" class="url"><span itemprop="name">${article.author.name}</span></a>
                </span>
                <br />
                <time datetime="${article.date_iso}" itemprop="datePublished" class="date published updated">${article.date_us}</time>
                <br />

                <span class="org">Truveris</span>
                <div class="adr">
                    <span class="locality">New York</span>
                    <span class="country-name">USA</span>
                </div>
            </div>

    </footer>

    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'truveris'; // required: replace example with your forum shortname

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

</article>

<p class="mobile-cta">
	<a href="/jobs/" class="cta" role="link">
		We are hiring <span class="icon-right-open-mini"></span>
	</a>
</p>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/lib/js/min/core-min.js"></script>
<script src="/lib/js/plugins/lightbox.js"></script>
<script>
    $(document).ready(function() {
        $('.image-link').magnificPopup({
            type: 'image',
            mainClass: 'mfp-with-zoom',
            closeOnContentClick: true,

            zoom: {
                enabled: true,
                duration: 300,
                easing: 'ease-in-out',
                opener: function(openerElement) {
                    return openerElement.is('img') ? openerElement : openerElement.find('img');
                }
            }
        });
    });
</script>

## vim: ft=mako
