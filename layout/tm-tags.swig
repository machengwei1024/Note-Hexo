{% extends 'includes/layout.swig' %}

{% block body %}
<div class="body-layout">
<div class="post-body-layout">
    <div class="post-header">
        <h2>{{ page.title }}</h2>
    </div>
    <div class="index-container">
        <div class="post-layout">
            <article class="post-main">
                <section class="tags-page-section">
                    {% if site.tags and site.tags.length %}
                    {% for tags in site.tags %}
                      <a href="{{ url_for(tags.path) }}" class="tag-could" data-toggle="tooltip" data-placement="top" title="{{tags.name}}">{{ tags.name }}</a>
                    {% endfor %}
                    {% endif %}
                </section>
            </article>
        </div>
    </div>
</div>
    {% include 'partials/footer.swig' %}
</div>
<script>
  // 博客侧栏标签云随机色
  var tag_cloud = $('.tag-could');
  tag_cloud.each(function () {
      var Cnum = 9;
      var Crand = parseInt(Math.random() * Cnum);
      $(this).addClass("tag-could" + Crand);
  })
</script>
{% endblock %}
