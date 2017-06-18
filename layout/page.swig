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
                <section class="post-main-section">
                    {% if theme.post_excerpt==true %}
		                {{ page.content }}
		            {% else %}
		                {{ page.more }}
		            {% endif %}
                </section>
            </article>
        </div>
    </div>
</div>
    {% include 'partials/footer.swig' %}
</div>
{% endblock %}
