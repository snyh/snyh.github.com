---
layout: blog_list
---
<h1 class="post-title">{{ page.year }}</h1>
<p class="lead">{{ page.year }}年的所有文章</p>
{% for m in (1..12) reversed %}
	{% if page.collated_posts[page.year][m] %}
<h3>{{ m | date_to_month }} 月</h3>
<a id="m{{m|date_to_month}}"></a>
		{% for d in (1..31) reversed %}
			{% if page.collated_posts[page.year][m][d] %}
				{% for p in page.collated_posts[page.year][m][d] reversed %}
<div>
<strong>{{ p.date | date: "%d" }} 号</strong>
<a href='{{ p.url }}'>{{ p.title }}</a>
</div>
				{% endfor %}
			{% endif %}
		{% endfor %}
	{% endif %}
{% endfor %}

<hr>
<h2>其他年份文章</h2>
{% for year in page.collated_posts.allyear %}
{% if year != page.year %}
<h1><a href="/blog/{{year}}">{{ year}}</a></h1>
{% endif %}
{% endfor %}
