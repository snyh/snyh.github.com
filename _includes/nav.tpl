<div class="navbar navbar-fixed-top">
<div class="navbar-inner">

<div class="container">

<a class="brand" href="{{site.host}}"> {{ site.brand }} </a>

<ul class="nav">
{% for item in site.nav %}
<li><a href={{ item.url }}>{{item.title}}</a></li>
{% endfor %}
</ul>

<div class="pull-right">

<!-- JiaThis Button BEGIN -->
<span id="jiathis_style_32x32">
	<a class="jiathis_button_tsina"></a>
	<a class="jiathis_button_tqq"></a>
	<a class="jiathis_button_renren"></a>
	<a class="jiathis_button_kaixin001"></a>
	<a class="jiathis_button_douban"></a>
	<a class="jiathis_button_qzone"></a>
	<a class="jiathis_button_pdfonline"></a>
	<a href="http://www.jiathis.com/share?uid=1584728" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
	<a class="jiathis_counter_style"></a>
</span>
<!-- JiaThis Button END -->

<input type="text" class="search-query" placeholder="Search">
</div>

</div>

</div>
</div>


