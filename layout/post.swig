{% extends 'includes/layout.swig' %}

{% block body %}
<div class="body-layout">
<div class="post-body-layout">
    <div class="post-header">
        <h2>{{ page.title }}</h2>
        <time datetime="{{ page.date.toJSON() }}"><i class="fa fa-calendar">&nbsp;发表于&nbsp;</i>{{ date(page.date) }}</time>
        {# 文章分类 #}
		{% if page.categories and page.categories.length %}
	        <span><i class="fa fa-folder-o"></i>
	    		{% for categories in page.categories %}
	    	       <a href="{{ url_for(categories.path) }}" rel="categories" data-toggle="tooltip" data-placement="top" title="Linux">{{ categories.name }}</a>
	    		{% endfor %}
	        </span>
		{% endif %}
	    {# 文章分类 #}
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
                <div class="post-tags">
                    {# 文章标签 #}
						{% if page.tags and page.tags.length %}
							{% for tag in page.tags %}
						<a href="{{ url_for(tag.path) }}" rel="tag" data-toggle="tooltip" data-placement="top" title="Linux">{{ tag.name }}</a>
							{% endfor %}
						{% endif %}
					{# 文章标签 #}
                </div>
                <div class="post-readmore">
                    <div class="post-readmore-left">
                    {# 上一篇 #}
					{% if page.prev_link %}
						<a class="down-a" href="{{ url_for(page.prev_link) }}"><span class="post-readmore-text">上一篇：</span><i class="post-readmore-icon fa fa-angle-left"></i>&nbsp;&nbsp;{{ page.prev.title }}</a>
						{% elif page.prev && page.prev.path %}
						<a class="down-a" href="{{ url_for(page.prev.path) }}"><span class="post-readmore-text">上一篇：</span><i class="post-readmore-icon fa fa-angle-left"></i>&nbsp;&nbsp;{{ page.prev.title }}</a>
					{% endif %}
                    </div>
                    <div class="post-readmore-center"></div>
                    <div class="post-readmore-right">
                    {# 下一篇 #}
					{% if page.next_link %}
						<a  class="down-a" href="{{ url_for(page.next_link) }}"><span class="post-readmore-text">下一篇：&nbsp;&nbsp;</span>{{ page.next.title }}&nbsp;&nbsp;<i class="post-readmore-icon fa fa-angle-right"></i></a>
						{% elif page.next && page.next.path %}
						<a  class="down-a" href="{{ url_for(page.next.path) }}"><span class="post-readmore-text">下一篇：&nbsp;&nbsp;</span>{{ page.next.title }}&nbsp;&nbsp;<i class="post-readmore-icon fa fa-angle-right"></i></a>
					{% endif %}
                    </div>
                </div>
 				
            </article>
        </div>
    </div>
</div>

{% include 'partials/footer.swig' %}

</div>
{% if theme.post_donate.enable==true %}
<div class="post-donate">
    <span class="post-donate-btn"><i class="post-donate-btn-chinese">赏</i></span>
    <div class="post-donate-box">
        <p>如果我的文章对你有帮助，或许可以打赏一下呀！</p>
        <div class="post-donate-box-main">
            <div class="post-donate-alipay-box">
                支付宝
                <div class="post-donate-alipay">
                    <img src="{{ theme.post_donate.alipay }}" alt="">
                </div>
            </div>
            <div class="post-donate-weixin-box">
                微信
                <div class="post-donate-weixin">
                    <img src="{{ theme.post_donate.wechat }}" alt="">
                </div>
            </div>
            <div class="post-donate-qq-box">
                QQ
                <div class="post-donate-qq">
                    <img src="{{ theme.post_donate.qq }}" alt="">
                </div>
            </div>
            <div style="clear:left;"></div>
        </div>
    </div>
</div>
{% endif %}
{% endblock %}
