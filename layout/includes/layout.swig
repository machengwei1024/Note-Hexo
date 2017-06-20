
{% set pageTitle = page.title || config.subtitle || '' %}

{% if is_archive() %}
  {% set pageTitle = 'Archives' %}
{% endif %}

{% if is_tag() %}
  {% set pageTitle = 'Tag: ' + page.tag %}
{% endif %}

{% if is_category() %}
  {% set pageTitle = 'Category: ' + page.category %}
{% endif %}

{% if is_month() %}
  {% set pageTitle = pageTitle + ': ' + page.month + '/' + page.year %}
{% endif %}

{% if is_year() %}
  {% set pageTitle = pageTitle + ': ' + page.year %}
{% endif %}

{% set pageTitle = pageTitle + config.title  %}

<!doctype html>
<html lang="{{ config.language }}">
<head>
  <meta charset="UTF-8">
  <title>{{ pageTitle }}</title>
  {% if theme.stylesheets !== undefined && theme.stylesheets.length > 0 %}
    {# stylesheet list from config.yml #}
    {% for url in theme.stylesheets %}
      <link rel="stylesheet" href="{{ url }}">
    {% endfor %}
  {% endif %}

  {% if theme.scripts !== undefined && theme.scripts.length > 0 %}
  {# scripts list from config.yml #}
    {% for url in theme.scripts %}
      <script src="{{ url }}"></script>
    {% endfor %}
  {% endif %}
</head>
<body>
<div class="page-loading">
    <div class="page-loading-main">
        <div class="page-loading-one"></div>
        <div class="page-loading-two"></div>
    </div>
</div>
<div id="pjax-container">
    <div class="mask"></div>
    <div class="mask2"></div>

    <div class="navbar-layout">
    <div class="navbar-header">
        <img src="{{ theme.logo}}" alt="">
    </div>
    <div class="navbar-date">
        <div class="navbar-date-post">
            <h2>文章</h2>
            <p>{{ site.posts.length }}</p>
        </div>
        <div class="navbar-date-tags">
            <h2>标签</h2>
            <p>{{ site.tags.length }}</p>
        </div>
        <div class="clear-float"></div>
    </div>
    <div class="navbar-links">
        <ul>
        {% for key in Object.keys(theme.menu) %}
          <li><a href="{{ theme.menu[key] }}">{{ key }}</a></li>
        {% endfor %}
        </ul>
    </div>
    <div class="navbar-icon">
        <a href="{{ theme.github }}" class="fa fa-github navbar-github"></a>
        <a href="{{ theme.weibo }}" class="fa fa-weibo navbar-weibo"></a>
        <a href="{{ theme.e-mail }}" class="fa fa-envelope navbar-mail"></a>
        <a href="{{ theme.rss }}" class="fa fa-rss navbar-rss"></a>
    </div>
</div>

    {# {% autoescape false %}{{ body }}{% endautoescape %} #}
    {% block body %}{% endblock %}

    <span class="navbar-btn">
        <span class="navbar-btn-line1"></span>
        <span class="navbar-btn-line2"></span>
        <span class="navbar-btn-line3"></span>
    </span>
    <span class="backtop-btn waves-effect waves-button waves-float"><i class="fa fa-angle-up"></i></span>
</div>


<script src="{{ theme.life_script }}"></script>
<script type="text/javascript">
    var windowW = ($(window).width());
    var windowH = ($(window).height());
    var page_loading_mainTop = (windowH - 80) / 2;
    var page_loading_mainLeft = (windowW - 80) / 2;
    $(".page-loading-main").css({
        "top":page_loading_mainTop,
        "left":page_loading_mainLeft
    })
    $(".page-loading-one").css("background-color","#5998e6");
    $(".page-loading-two").css("background-color","#b3f788");
</script>
<script type="text/javascript">
    window.onload = function(){
        $('.page-loading').fadeOut(); 
    } 
</script>
<script type="text/javascript">
    hljs.initHighlightingOnLoad();
    hljs.initLineNumbersOnLoad();
    Waves.displayEffect();
    otherF();
    $(document).pjax('a', '#pjax-container', {fragment:'#pjax-container', timeout:8000}).on('pjax:send', function() {
      $('.page-loading').fadeIn();
    }).on('pjax:complete', function() {
      $('pre code').each(function(i, block){
        hljs.highlightBlock(block);
      })
      $('code.hljs').each(function(i, block) {
        hljs.lineNumbersBlock(block);
      });
    }).on('pjax:end', function(){
      Waves.displayEffect();
      otherF();
      $('.page-loading').fadeOut();
    })
</script>

</body>
</html>
