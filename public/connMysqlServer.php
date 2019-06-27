<?php
	//資料庫伺服器連線參數設定
	$db_host = "localhost";
	$db_username = "root";
	//連線資料庫伺服器
	$db_link = @mysqli_connect($db_host, $db_username, $db_password);
	if (!$db_link) die("資料庫伺服器連結失敗!");
	//設定中文字元集與編碼
	mysqli_query($db_link, "SET NAMES utf8");
?>