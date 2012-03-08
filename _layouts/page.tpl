<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="{{ page.author }}">
<meta name="keywords" content="{{ page.tags | join: ',' }}">
<title> snyh {{ page.title }} </title>
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/page.css">
{% for pagecss in page.css %}}
<link rel="stylesheet" href={{ pagecss }}>
{% endfor %}

<style>
body {
	padding-top: 60px;
}
</style>
<link href="/assets/css/bootstrap-responsive.min.css" rel="stylesheet">
<!--[if lt IE9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<link rel="shortcut icon" href="/assets/img/favicon.png">
</head>
<body>

{% include nav.tpl %}

<div class="container">
{{ content }}

<div id="Footer">
create by snyh
</div>

</div>

<script src="/assets/js/jquery-1.7.1.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
{% for pagejs in page.js %}
<script src={{ pagejs }}></script>
{% endfor %}

<script>
$(function(){
{% for tid in page.tooltip %}
	$("#{{tid}}").tooltip();
{% endfor %}
});

var jiathis_config = {data_track_clickback:true};
</script>


</body>
</html>
