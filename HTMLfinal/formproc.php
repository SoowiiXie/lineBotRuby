<?php 
// print_r($_GET);
// echo '<hr>';

// ========== for loop 版====
	$nsize=count($_GET);        // $_GET 是一個 名稱索引型( key==>value )陣列
	$keys=array_keys($_GET);    // 取出名稱索引(key)部分
	
	for($i=0;$i<$nsize;$i++){
		$akey=$keys[$i];
		echo 'Key = ' . $akey .' , Value=';
		$kval=$_GET[$akey];                      // 用key取值(value)
		if(is_array($kval)) { 					 // 若value部分為 也是陣列
			echo implode(",", $kval);            // 將陣列值以字串方式合併
		} else {
			echo $kval;
		}
		echo '<br>';
	}	

/*
// ===== foreach loop 版====
	foreach($_GET as $akey => $avalue)
	{
		echo 'Key = ' . $akey .' , Value=';
		if(is_array($avalue)) { 
			echo implode(",", $avalue);
		} else {
			echo $avalue;
		}
		echo '<br>';
	}
*/
 echo '<hr>';
 
 $bday=$_GET['bday'];
 echo "<p>你的生日: $bday</p>";
 $foods=$_GET['foods'];
 echo "<p>喜歡吃: ".implode("、", $foods)."</p>";
 $username=$_GET['username'];
 echo "<p>你的帳號: $username</p>";
 $psw=$_GET['psw'];
 echo "<p>你的密碼: $psw</p>";
 $grade=$_GET['grade'];
 echo "<p>你的年級: $grade</p>";
 $favcolor=$_GET['favcolor'];
 echo "<p>你最愛的顏色: $favcolor</p>";
 $tel=$_GET['tel'];
 echo "<p>你的電話: $tel</p>";
 $items=$_GET['items'];
 echo "你想學的東西有:" ;
 for($i=0; $i<count($items);$i++){
	 echo "$items[$i] " ;
 }
 echo "<p>用implode來說的話: ".implode("、", $items)."</p>";
 $feedback=$_GET['feedback'];
 echo "<p>你的感想: $feedback</p>";
 $email=$_GET['email'];
 echo "<p>你的電子郵件: $email</p>";
?>
