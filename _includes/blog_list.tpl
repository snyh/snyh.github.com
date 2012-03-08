{% for post in posts limit: 10%}
<h2>
<a href={{ post.url }}>{{post.title}}</a>
<a href="/blog/category/{{post.category}}"><span class="label label-info">{{post.category}}</span></a>

</h2> 
<small>时间:{{post.date}} </small>

{% if post.tags %}
<span>
	{% for tag in post.tags %}
	<a href="/blog/tags/{{tag  | slugzie }}"><span class="label label-info">{{ tag }}</span></a>
	{% endfor %}
</span>
{% endif %}

<hr>

{% if post.summary %}
<p> {{ post.summary | strip_html | truncatewords: 150 }} </p>
{% else %}
<p> {{ post.content | strip_html | truncatewords: 50 }} </p>
{% endif %}

<a href="{{ post.url }}">Read more...</a>

<br/>
{% endfor %}
