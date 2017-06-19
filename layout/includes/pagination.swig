{% if page.current && page.total %}
    <nav class="pagination">
        {% if page.prev %}
        	<a href='{{ url_for(page.prev_link) }}' class='pagination-up pagination-text fa fa-angle-double-left'></a>
        {% endif %}
        <span class='pagination-number'>第 {{page.current}} 页 / 共 {{page.total}} 页</span>
        {% if page.next %}
            <a href='{{ url_for(page.next_link) }}' class='pagination-down pagination-text fa fa-angle-double-right'></a>
        {% endif %}
    </nav>
{% endif %}