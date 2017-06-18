{% if page.current && page.total %}
    <nav class="pagination">
        {{ 
            paginator({
                prev_text: "<span class='pagination-up pagination-text fa fa-angle-double-left'></span>",
                next_text: "<span class='pagination-down pagination-text fa fa-angle-double-right'></span>", 
                mid_size: 1,
            }) 
        }}
    </nav>
{% endif %}