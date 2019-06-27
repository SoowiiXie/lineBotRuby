<?php 
$a=100; 
$b=200; 
$a=$a+1; 
echo "a= ".$a."<br>"; 
$a+=1; 
echo "a= ".$a."<br>"; 
$a++; 
echo "a= ".$a."<br>"; 
$a=$a-1; 
echo "a= ".$a."<br>"; 
$a-=1; 
echo "a= ".$a."<br>"; 
$a--; 
echo "a= ".$a."<br>"; 
//-------------------------- 
$b=$a++; 
echo "a= ".$a."   b= ".$b."<br>"; 
$b=++$a; 
echo "a= ".$a."   b= ".$b."<br>"; 
$b=$a--; 
echo "a= ".$a."   b= ".$b."<br>"; 
$b=--$a; 
echo "a= ".$a."   b= ".$b."<br>"; 
?> 
