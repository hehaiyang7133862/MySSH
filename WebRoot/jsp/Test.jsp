<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="<%=basePath%>UI/DropKick/dropkick.css"
	type="text/css">
<link rel="stylesheet" href="<%=basePath%>UI/DropKick/example.css"
	type="text/css">
<link href='http://fonts.googleapis.com/css?family=Carter+One&v1'
	rel='stylesheet' type='text/css'>

<style type="text/css">
.dk_theme_orange {
	background: #ffffff; /* Old browsers */
	background: -moz-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6
		100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #ffffff),
		color-stop(50%, #f1f1f1), color-stop(51%, #e1e1e1),
		color-stop(100%, #f6f6f6) ); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%,
		#f6f6f6 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6
		100%); /* Opera11.10+ */
	background: -ms-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6
		100%); /* IE10+ */
	filter: progid:DXImageTransform.Microsoft.gradient(      startColorstr='#ffffff',
		endColorstr='#f6f6f6', GradientType=0 ); /* IE6-9 */
	background: linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6 100%);
	/* W3C */
}

.dk_theme_orange .dk_options a:hover,.dk_theme_orange .dk_option_current a
	{
	background-color: #E15A01;
	border-bottom-color: #604A42;
	color: #fff;
	text-shadow: #604A42 0 1px 0;
}

.dk_theme_orange .dk_toggle,.dk_theme_orange.dk_open .dk_toggle {
	background-color: transparent;
}

.dk_theme_orange.dk_focus .dk_toggle {
	box-shadow: 0 0 5px #E15A01;
	-moz-box-shadow: 0 0 5px #E15A01;
	-webkit-box-shadow: 0 0 5px #E15A01;
}

.dk_theme_black {
	background: #aebcbf; /* Old browsers */
	background: -moz-linear-gradient(top, #aebcbf 0%, #6e7774 50%, #0a0e0a 51%, #0a0809
		100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #aebcbf),
		color-stop(50%, #6e7774), color-stop(51%, #0a0e0a),
		color-stop(100%, #0a0809) ); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #aebcbf 0%, #6e7774 50%, #0a0e0a 51%,
		#0a0809 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #aebcbf 0%, #6e7774 50%, #0a0e0a 51%, #0a0809
		100%); /* Opera11.10+ */
	background: -ms-linear-gradient(top, #aebcbf 0%, #6e7774 50%, #0a0e0a 51%, #0a0809
		100%); /* IE10+ */
	filter: progid:DXImageTransform.Microsoft.gradient(      startColorstr='#aebcbf',
		endColorstr='#0a0809', GradientType=0 ); /* IE6-9 */
	background: linear-gradient(top, #aebcbf 0%, #6e7774 50%, #0a0e0a 51%, #0a0809 100%);
	/* W3C */
}

.dk_theme_black .dk_toggle,.dk_theme_black.dk_open .dk_toggle {
	background-color: transparent;
	background-image: url('images/dk_arrows_white.png');
	color: #fff;
	text-shadow: none;
}

.dk_theme_black .dk_options a {
	background-color: #333;
	color: #fff;
	text-shadow: none;
}

.dk_theme_black .dk_options a:hover,.dk_theme_black .dk_option_current a
	{
	background-color: #E15A01;
	color: #fff;
	text-shadow: #604A42 0 1px 0;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>UI/DropKick/jquery.dropkick-1.1.js"></script>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('.default').dropkick();

		$('.black').dropkick({
			theme : 'black'
		});

		$('.change').dropkick({
			change : function(value, label) {
				alert('You picked: ' + label + ':' + value);
			}
		});

		$('.existing_event').dropkick({
			change : function() {
				$(this).change();
			}
		});

		$('.custom_theme').dropkick({
			theme : 'black',
			change : function(value, label) {
				$(this).dropkick('theme', value);
			}
		});

		$('.dk_container').first().focus();
	});
</script>

<title>My JSP 'Test.jsp' starting page</title>
</head>
<body>
	<div class="header">
		<div class="header_inner group">
			<h1>
				DropKick.js <span>示例</span>
			</h1>
		</div>
	</div>
	<div class="content">
		<div class="examples part">
			<div class="example">
				<h2>默认设置</h2>
				<fieldset>
					<form action="#" method="post" accept-charset="utf-8"
						class="example_form">
						<select name="country" class="default" tabindex="2">
							<option value="">Try Me!</option>
							<option value="AU">Australia</option>
							<option value="CA">Canada</option>
							<option value="DE">Germany</option>
							<option value="JP">Japan</option>
							<option value="GB">United Kingdom</option>
							<option value="US">United States</option>
						</select> <select name="state" class="default" tabindex="3">
							<option value="" selected="selected">Try Me, Too!</option>
							<option value="AL">Alabama</option>
							<option value="AK">Alaska</option>
							<option value="AZ">Arizona</option>
							<option value="AR">Arkansas</option>
							<option value="CA">California</option>
							<option value="CO">Colorado</option>
							<option value="CT">Connecticut</option>
							<option value="DE">Delaware</option>
							<option value="FL">Florida</option>
							<option value="GA">Georgia</option>
							<option value="HI">Hawaii</option>
							<option value="ID">Idaho</option>
							<option value="IL">Illinois</option>
							<option value="IN">Indiana</option>
							<option value="IA">Iowa</option>
							<option value="KS">Kansas</option>
							<option value="KY">Kentucky</option>
							<option value="LA">Louisiana</option>
							<option value="ME">Maine</option>
							<option value="MD">Maryland</option>
							<option value="MA">Massachusetts</option>
							<option value="MI">Michigan</option>
							<option value="MN">Minnesota</option>
							<option value="MS">Mississippi</option>
							<option value="MO">Missouri</option>
							<option value="MT">Montana</option>
							<option value="NE">Nebraska</option>
							<option value="NV">Nevada</option>
							<option value="NH">New Hampshire</option>
							<option value="NJ">New Jersey</option>
							<option value="NM">New Mexico</option>
							<option value="NY">New York</option>
							<option value="NC">North Carolina</option>
							<option value="ND">North Dakota</option>
							<option value="OH">Ohio</option>
							<option value="OK">Oklahoma</option>
							<option value="OR">Oregon</option>
							<option value="PA">Pennsylvania</option>
							<option value="RI">Rhode Island</option>
							<option value="SC">South Carolina</option>
							<option value="SD">South Dakota</option>
							<option value="TN">Tennessee</option>
							<option value="TX">Texas</option>
							<option value="UT">Utah</option>
							<option value="VT">Vermont</option>
							<option value="VA">Virginia</option>
							<option value="WA">Washington</option>
							<option value="WV">West Virginia</option>
							<option value="WI">Wisconsin</option>
							<option value="WY">Wyoming</option>
						</select> <select name="country-2" class="existing_event" tabindex="4"
							onchange="alert('hi, from ' + this.value)">
							<option value="">Try Me!</option>
							<option value="AU">Australia</option>
							<option value="CA">Canada</option>
							<option value="DE">Germany</option>
							<option value="JP">Japan</option>
							<option value="GB">United Kingdom</option>
							<option value="US">United States</option>
						</select>

						<p>
							<script
								src="https://gist.github.com/1062688.js?file=dropkick_example_default.js"></script>
						</p>
					</form>
				</fieldset>
			</div>

			<div class="example">
				<h2>change事件的回调示例</h2>
				<fieldset>
					<form action="#" method="post" accept-charset="utf-8"
						class="example_form">
						<select name="color" class="change" tabindex="4">
							<option value="">请选择一个颜色</option>
							<option value="#0084c7">蓝色</option>
							<option value="#E15A01">橙色</option>
							<option value="#604A42">棕色</option>
						</select>
						<div style="clear: both;"></div>
						<script
							src="https://gist.github.com/1062688.js?file=dropkick_example_callback.js"></script>
					</form>
				</fieldset>
			</div>

			<div class="example">
				<h2>创建自定义主题</h2>
				<fieldset>
					<form action="#" method="post" accept-charset="utf-8"
						class="example_form">
						<select name="theme" class="custom_theme" tabindex="5">
							<option value="">选择一个主题</option>
							<option value="default">默认主题</option>
							<option value="black">暗泽主题</option>
							<option value="orange">亮泽主题</option>
						</select>
						<div style="clear: both;"></div>
						<script
							src="https://gist.github.com/1062688.js?file=custom_theme.css"></script>
						<script
							src="https://gist.github.com/1062688.js?file=dropkick_example_theme.js"></script>
					</form>
				</fieldset>
			</div>
		</div>
	</div>

</body>
</html>
