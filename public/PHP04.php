<!DOCTYPE HTML>
<html>
<head>
<title>Document Title</title>
</head>
<body>
<?php
$a=10;
$b=20;
echo "if 範例 : <br/>";
if($a==10 && $b==20)
{
echo "yes<br>";
}
else
{
echo "no<br>";
}
//-----------------------
if($a==10 || $b==20)
{
echo "yes<br>";
}
else
{
echo "no<br>";
}
//----------------------
if($a!=10 || $b!=20)
{
echo "yes<br>";
}
else
{
echo "no<br>";
}
//----------------------
if($a==5)
echo "case 1<br>";
elseif ($b==20)
echo "case 2<br>";
else
echo "case 3<br>";
//---------------------
$week=date("D");
switch($week){
case "Mon":
 echo "星期一";
 break;
case "Tue":
 echo "星期二";
 break;
case "Wed":
 echo "星期三";
 break;
case "Thu":
 echo "星期四";
 break;
case "Fri":
 echo "星期五";
 break;
default:
 echo "週末";
}
?>
</body>
</html>