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

</body>
</html>
<?php
//------------------------------------------
$oned=array('computer','phone','tv');
$arraylength=count($oned);
//use for-circle
	for ($k=0;$k<$arraylength;$k++)
	{
		echo $oned[$k];
	}
	
echo "<br>";
	
	for ($k=0;$k<$arraylength;$k++)
	{
		echo "  ".$oned[$k];
	}
	
echo "<br>";
	
	for ($k=0;$k<$arraylength;$k++)
	{
		echo '索引='.$k.'  value='.$oned[$k]."<br>";
	}
		
echo "<br>";

//use foreach-circle
foreach ($oned as $value )
		{
		echo 'value='.$value.'<br>';
		}
		
echo "<br>";

//自訂索引範例
echo'<br>';
foreach ($oned as $xkey => $xvalue)
		{
		echo 'key='.$xkey.'  value='.$xvalue.'<br>';
		}
		
echo "<br>";

$twod=array(array(1,2,3),
			array(4,5,6),
			array(7,8,9));

for($i=0;$i<=2;$i++)
	{
		for($j=0;$j<=2;$j++)
			{
				echo $twod[$i][$j]."  ";
			}
		echo "<br>";
	}
	
$allsum=0;
for($i=0;$i<=2;$i++)
	{
		for($j=0;$j<=2;$j++)
		{
		$allsum=$allsum+$twod[$i][$j];
		}
	}

echo"<br>";

echo"陣列的數值總和=".$allsum;
echo"<br>"."<br>";

for($k=0;$k<=2;$k++)
{
	echo"第".$k."列數值總和=".array_sum($twod[$k]);
	echo"<br>";
}

//錯誤示範
echo"<br>";
echo "陣列的數值總和=".array_sum($twod);
echo"<br>";

echo"<br>";
for($i=0;$i<=2;$i++)
{
	$colsum=0;
	for ($j=0;$j<=2;$j++)
	{
		$colsum = $twod[$j][$i];
	}
	echo"第".$i."行數值總和=".$colsum;
	echo"<br>";
}

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