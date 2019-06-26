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
header("Content_Type: text/html; charset=utf-8");
include("connMysqlServer.php");
$dbsok = @mysqli_select_db($db_link, "game");
if (!$dbsok) die("資料庫選擇失敗!");
$querystr = "SELECT * FROM arm";
$queryresult = mysqli_query($db_link, $querystr);
//輸出表格及欄位名稱
$tableinfo = mysqli_fetch_field($queryresult);
echo "表格名稱: ".$tableinfo->table;
echo "<table border =2>";
echo "<tr>";
while ($tableinfo = mysqli_fetch_field($queryresult))
		echo "<td>".$tableinfo->name."</td>";
echo "</tr>";
$colnum = mysqli_num_fields($queryresult);
//輸出表格紀錄
while ($gotrow = mysqli_fetch_row($queryresult))
{
echo "<tr>" ;
for ($k=1;$k<=$colnum-1;$k++)
	echo "<td>".$gotrow[$k]."</td>";
echo "</tr>";
}
echo "</table>";
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
