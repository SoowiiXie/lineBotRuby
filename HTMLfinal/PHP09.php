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
//全域變數(global variable),區域變數(local variable),靜態變數(static variable)範例程式
	$a = 8; //$a為全域變數(global variable)
	$g = 8; //$g為全域變數(global variable)
	$s = 8; //$s為靜態變數(static variable)
	
	function local_add($a)
	{
		$a=$a+1; //$a為區域變數(local variable),區域變數$a與全域變數$a只是同名
		echo "在local_add函式執行a=".$a."<br>";
	}
	function global_add()
	{
		global $g;
		$g=$g+1; //在函式執行時，更改全域變數$g的值
		echo "在global_add的函式執行g=".$g."<br>";
	}
	function static_add()
	{
		global $s;
		$s=$s+1; //在函式執行時,更改靜態變數$s的值
	}
	
//區域變數(local variable)
	echo "第1次呼叫呼叫local_add函式前:";
	echo "a=".$a."<br>";
	local_add($a);
	echo "第1次呼叫呼叫local_add函式後:";
	echo "a=".$a."<br><br>";
	echo "第2次呼叫local_add函式前:";
	echo "a=".$a."<br>";
	local_add($a);
	echo "第2次呼叫local_add函式後:";
	echo "a=".$a."<br><br>";
//全域變數(global variable)
	echo "呼叫global_add函式前:";
	echo "g=".$g."<br>";
	global_add();
	echo "呼叫global_add函式後:";
	echo "g=".$g."<br><br>";
/*	
	global_add();
	echo "第2次呼叫global_add函式後:";
	echo "g=".$g."<br><br>";
*/
//靜態變數(static vatiable)h
	echo "呼叫static_add函式前:";
	echo "s=".$s."<br>";
	static_add();
	echo "第1次呼叫static_add函式後:";
	echo "s=".$s."<br>";
	static_add();
	echo "第2次呼叫static_add函式後:";
	echo "s=".$s."<br>";
	static_add();
	echo "第3次呼叫static_add函式後:";
	echo "s=".$s."<br>";
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