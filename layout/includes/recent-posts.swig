<div class="body-layout">
    <div class="index-header" style="background:url(https://cdn.weic96.cn/website/a/15/4545620ec1ce9ee9147a91ab69c06.jpg);background-size:100% 100%;background-repeat:no-repeat;">
       <div class="index-header-wave"></div>
    </div>
    <div class="index-container">
{% if site.posts.length > 0 %}
  {% for postItem in page.posts %}
    <div class="index-post-layout">
      <article class="index-post-abstract">
                <header>
                    <h2><a href="{{ config.root }}{{ postItem.path }}">{{ postItem.title }}</a></h2>
                  {% if postItem.date %} 
                    <time datetime="{{ postItem.date.toJSON() }}">{{ date(postItem.date) }}</time>
                  {% endif %}
                  {% if postItem.categories and postItem.categories.length %}
                    <span><i class="fa fa-folder-o"></i>
                      {% for cat in postItem.categories %}
                        <a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">
                          {{ cat.name }}
                        </a>
                      {% endfor %}
                    </span>
                  {% endif %}
                </header>
                <section>
                  {% if postItem.excerpt.length > 0 %}
                      {{ postItem.excerpt }}
                  {% else %}
                      {% set content = postItem.content | striptags %}
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
