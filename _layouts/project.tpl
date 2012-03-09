---
layout: page
---

<div class="row">
<div class="span9">
{{ content }}
</div>

<div class="span3">


<table class="table table-brodered">
<thead><h4>{{page.title}}信息</h4></thead>

<tr>
<td><span class="label">可执行文件:</span></td>
<td>

<div class="btn-group">
<a class="btn" href="#">选择</a>
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
<td><a class="label" href="{{ githuburl }}">{{page.title}}</a></td>
</tr>

<tr>
<td><span class="label label-info">fork 一份:</span></td>
<td><a class="label" href="{{ githuburl }}">{{page.title}}</a></td>
</tr>

<tr>
<td><span class="label label-info">创建issuse:</span></td>
<td><a class="label" href="{{ githuburl }}">{{page.title}}</a></td>
</tr>
</table>

</div>
</div>
