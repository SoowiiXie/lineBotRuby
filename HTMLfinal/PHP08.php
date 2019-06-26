<!DOCTYPE html>
<html lang="zh-TW">
<head>
<title>ch12-1-1使用inline方式在網頁中加入JavaScript</title>
<meta charset="utf-8">
</head>
<body>
	<header id="header">
    <div class="logo"><img src="img/logo-001.png"></div>
    </header>
    <div id="menu-wrapper">
        
    </div>
    <div id="wrapper">
        <aside id="aside" >
            <button class="btn"><a href="index.html">首頁</a></button>
        </aside>
    </div>
<table border="4">
　<tr>
　<td>門市編號</td>
　<td>商品A</td>
　<td>商品B</td>
　<td>商品C</td>
　<td>商品D</td>
　<td>商品E</td>
　</tr>
　<tr>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;7</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;2</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;3</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;4</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;5</td>
　</tr>
　<tr>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Y</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;4</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;1</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;5</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;3</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;2</td>
　</tr>
　<tr>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Z</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;1</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;2</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;3</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;6</td>
　<td>&nbsp;&nbsp;&nbsp;&nbsp;5</td>
　</tr>
</table>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※單位百萬元</p>
</body>
</html>

<?php
$twod=array(array(7,2,3,4,5),
			array(4,1,5,3,2),
			array(1,2,3,6,5));

for($i=0;$i<=2;$i++)
	{
		for($j=0;$j<=4;$j++)
			{
				echo $twod[$i][$j]."  ";
			}
		echo "<br>";
	}

$allsum=0;
for($i=0;$i<=2;$i++)
	{
		for($j=0;$j<=4;$j++)
		{
		$allsum=$allsum+$twod[$i][$j];
		}
	}

echo"<br>";

echo"全公司的年度總銷售金額=".$allsum.",000,000元";
echo"<br>"."<br>";


	echo"X商家銷售總和=".array_sum($twod[0]).",000,000元";
	echo"<br>";
	echo"Y商家銷售總和=".array_sum($twod[1]).",000,000元";
	echo"<br>";
	echo"Z商家銷售總和=".array_sum($twod[2]).",000,000元";
	echo"<br>";
	echo"<br>";

$Asum=0;
$Bsum=0;
$Csum=0;
$Dsum=0;
$Esum=0;
for($i=0;$i<=2;$i++)
	{
		$Asum=$Asum+$twod[$i][0];
		$Bsum=$Bsum+$twod[$i][1];
		$Csum=$Csum+$twod[$i][2];
		$Dsum=$Dsum+$twod[$i][3];
		$Esum=$Esum+$twod[$i][4];
	}
echo"A商品年度總銷售金額=".$Asum.",000,000元";
echo"<br>";
echo"B商品年度總銷售金額=".$Bsum.",000,000元";
echo"<br>";
echo"C商品年度總銷售金額=".$Csum.",000,000元";
echo"<br>";
echo"D商品年度總銷售金額=".$Dsum.",000,000元";
echo"<br>";
echo"E商品年度總銷售金額=".$Esum.",000,000元";
?>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
<title>ch12-1-1使用inline方式在網頁中加入JavaScript</title>
<meta charset="utf-8">
</head>
<body>
<footer id="footer"><br/>作者姓名:謝戍乂&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;連絡電話:0932276826</footer>
</body>
</html>
