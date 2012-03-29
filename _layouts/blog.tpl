---
layout: page
js1:
   - http://static.pinglun.la/md/pinglun.la.js
   - http://v2.jiathis.com/code/jia.js?uid=1584728
---

<div class="row">
<div class="span9">
<span><strong>{{page.title}}</strong></span> 
<small>{{page.date}}</small>

<hr>
{{ content }}
<hr>
<ul class="pager">

{% if page.previous  %}
<li class="previous"><a href="{{page.previous.url}}">{{page.previous.title}}</a></li>
{% else %}
<li class="previous"><a href="#">Nothing</a></li>
{% endif %}

{% if page.next %}
<li class="next"><a href="{{page.next.url}}">{{page.next.title}}</a></li>
{% else %}
<li class="next"><a href="#">Nothing</a></li>
{% endif %}

</ul>

<!-- PingLun.La Begin -->
<div id="pinglunla_here">
<span class="lable lable-info">评论系统载入中</span>
</div>
<!-- PingLun.La End -->

</div>
<div class="span3">
{% include blog_sidebar.tpl %}
</div>
</div>
