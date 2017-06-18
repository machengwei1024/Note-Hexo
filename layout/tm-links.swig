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
                <section class="links-page-section">
                    {{ page.content }}
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
