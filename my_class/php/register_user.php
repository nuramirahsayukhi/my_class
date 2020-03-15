<?php
error_reporting(0);
include_once ("dbconnect.php");

$name = $_POST['name'];
$email = $_POST['email'];
$password = sha1($_POST['password']);

$sqlinsert = "INSERT INTO USER(NAME,EMAIL,PASSWORD) VALUES ('$name','$email','$password')";

if ($conn->query($sqlinsert) === true)
{
    sendEmail($email);
    echo "success";
    
}
else
{
    echo "failed";
}



function sendEmail($useremail) {
    $to      = $useremail; 
    $subject = 'Verification for MyClass'; 
    $message = 'http://saujanaeclipse.com/myclass/php/verify.php?email='.$useremail; 
    $headers = 'From: noreply@myclass.com' . "\r\n" . 
    'Reply-To: '.$useremail . "\r\n" . 
    'X-Mailer: PHP/' . phpversion(); 
    mail($to, $subject, $message, $headers); 
}

?>
