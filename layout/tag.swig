{% extends 'includes/layout.swig' %}

{% block body %}
<div class="body-layout">
    <div class="index-header" style="background:url(https://cdn.weic96.cn/website/a/15/4545620ec1ce9ee9147a91ab69c06.jpg);background-size:100% 100%;background-repeat:no-repeat;">
       <div class="index-header-wave"></div>
    </div>
    <div class="index-container">

  {% for article in page.posts.toArray() %}
    <div class="index-post-layout">
      <article class="index-post-abstract">
          <header>
            {% if tag_art.link %}
              <h2><a href="{{ url_for(tag_art.link) }}">{{ tag_art.title || 'No Title' }}</a></h2>
            {% else %}
              <h2><a href="{{ url_for(tag_art.path) }}">{{ tag_art.title || 'No Title' }}</a></h2>
            {% endif %}

              <h2><a href="{{ url_for(tag_art.link) }}">{{ tag_art.title }}</a></h2>
            {% if tag_art.date %} 
              <time datetime="{{ tag_art.date.toJSON() }}">{{ date(tag_art.date) }}</time>
            {% endif %}
          </header>
          <section>
            {% if tag_art.excerpt.length > 0 %}
                {{ tag_art.excerpt }}
              {% else %}
                {% set content = tag_art.content | striptags %}
                {{ content.substring(0, theme.index_post.length) }}
                {% if content.length > theme.auto_excerpt.length %}...{% endif %}
              {% endif %}
          </section>
      </article>
    </div>
  {% endfor %}
{% endif %}
        {% include 'pagination.swig' %}
    </div>
    {% include '../partials/footer.swig' %}
</div>
{% endblock %}