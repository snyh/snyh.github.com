---
layout: page
---

<div class="row">
<div class="span9">
{{ content }}

{% if page.img %}
<h3>程序部分截图</h3>
<ul class="thumbnails">
{% for img in page.img %}
<a href="#" class="thumbnail">
<img src="{{img}}" title="{{img}}" />
</a>
{% endfor %}
{% endif %}
</div>

<div class="span3">


<table class="table table-brodered">
<thead><h4>{{page.title}}信息</h4></thead>

<tr>
<td><span class="label">可执行文件:</span></td>
<td>

<div class="btn-group">
<a class="btn" href="#">选择版本</a>
<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
<span class="caret"></span>
</a>
<ul class="dropdown-menu">
<li><a href="#">windows</a></li>
<li><a href="#">linux</a></li>
</ul>
</div>

</td>
</tr>



<tr>
<td><span class="label label-info">关注:</span></td>
<td><a class="label" href="{{ githuburl }}"></a></td>
</tr>

<tr>
<td><span class="label label-info">fork 一份:</span></td>
<td><a class="label" href="{{ githuburl }}">1</a></td>
</tr>

<tr>
<td><span class="label label-info">创建issuse:</span></td>
<td><a class="label" href="{{ githuburl }}"></a></td>
</tr>
</table>

以上表单，当前未完成，需要查看代码请进入
<a href="{{page.githuburl}}" target="_blank">github查看</a>

</div>
</div>
