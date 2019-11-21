<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>主页</title>
</head>
<body class="gray-bg">

	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/static/js/plugins/highcharts/highcharts.js"></script>
	<script type="text/javascript">
		$(function () {
			
			
			$.get('<%=path%>/test/highcharts.do', function(json)
			{
				//页面初始化完毕后
				$('#container').highcharts({
					//图表类型
					chart: {
			            type: 'column'
			        },
			        title: {
			            text: '报表标题(主标题)'
			        },
			        subtitle: {
			            text: '报表副标题'
			        },
			        xAxis: {
			            categories: [
			                '1月份',
			                '2月份',
			                '3月份',
			                '4月份',
			                '5月份',
			                '6月份',
			                '7月份',
			                '8月份',
			                '9月份',
			                '10月份',
			                '11月份',
			                '12月份'
			            ],
			            crosshair: true
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: '降雨量 (mm)'
			            }
			        },
			        series: json,
					tooltip: {
			            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
			            footerFormat: '</table>',
			            shared: true,
			            useHTML: true
			        }
				});
			}, 'json');
			
			
			
		});
	</script>
</body>
</html>