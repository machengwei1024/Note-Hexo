{% extends 'includes/layout.swig' %}

{% block body %}
<div class="body-layout">
    <div class="index-header" style="background:url(https://cdn.weic96.cn/website/a/15/4545620ec1ce9ee9147a91ab69c06.jpg);background-size:100% 100%;background-repeat:no-repeat;">
       <div class="index-header-wave"></div>
    </div>
    <div class="index-container">
    {% for postItem in page.posts %}
      
    {% endfor %}
{% endif %}
        {% include 'pagination.swig' %}
    </div>
    {% include '../partials/footer.swig' %}
</div>

{% endblock %}