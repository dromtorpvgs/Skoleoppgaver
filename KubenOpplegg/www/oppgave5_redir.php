<html>
<?php
/* This will give an error. Note the output
 * above, which is before the header() call */

function getUserIP() {
    $userIP =   '';
    if(isset($_SERVER['HTTP_CLIENT_IP'])){
        $userIP =   $_SERVER['HTTP_CLIENT_IP'];
    }elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
        $userIP =   $_SERVER['HTTP_X_FORWARDED_FOR'];
    }elseif(isset($_SERVER['HTTP_X_FORWARDED'])){
        $userIP =   $_SERVER['HTTP_X_FORWARDED'];
    }elseif(isset($_SERVER['HTTP_X_CLUSTER_CLIENT_IP'])){
        $userIP =   $_SERVER['HTTP_X_CLUSTER_CLIENT_IP'];
    }elseif(isset($_SERVER['HTTP_FORWARDED_FOR'])){
        $userIP =   $_SERVER['HTTP_FORWARDED_FOR'];
    }elseif(isset($_SERVER['HTTP_FORWARDED'])){
        $userIP =   $_SERVER['HTTP_FORWARDED'];
    }elseif(isset($_SERVER['REMOTE_ADDR'])){
        $userIP =   $_SERVER['REMOTE_ADDR'];
    }else{
        $userIP =   'UNKNOWN';
    }
    return $userIP;
}


/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'badger');
 
/* Attempt to connect to MySQL database */
//$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
$mysqli = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if (isset($_POST['username']) && isset($_POST['password']) ){
    $username = htmlspecialchars($_POST["username"]);
    $password = htmlspecialchars($_POST["password"]);
    $sql = "SELECT username,password FROM users WHERE 
    username ='" . $username . "' AND password='" . $password . "'";
    $IP = getUserIP();
    error_log('POST opg 5 from IP: '. $IP . ' username: '. $username . ' password: '. $password );

    //echo $sql;
    $res = $mysqli->query($sql);
    for ($row_no = $res->num_rows - 1; $row_no >= 0; $row_no--) {
        $res->data_seek($row_no);
        $row = $res->fetch_assoc();
        error_log('SUCCESS opg 5 from IP: '. $IP . 'success!' );
        header('Location: oppgave5_complete_llfujuu467fnnvk.html');
        exit;
    }
    echo 'Feil brukernavn eller passord!';
}

/*
 if (isset($_POST['username']) && isset($_POST['password']) ){
    $username = htmlspecialchars($_POST["username"]);
    $password = htmlspecialchars($_POST["password"]);
    $correct_username = 'admin';
    $correct_password = 'Konkurransedyktig123';
    $correct_password_encrypted = 'Rmx5aW5nQmVhdmVySXpBd2V6dW0xMjM=';
    //error_log(strcmp($username, $correct_username));
    if (strcmp($username, $correct_username) == 0){
        //error_log('Correct username: '. $username);
    }else{
        echo 'Feil brukernavn ' . $username;
        //error_log('Incorrect username: '. $username);
        exit;
    }
    if(strcmp($password, $correct_password) == 0){
        //error_log('Correct password: ' . $password);
        echo 'Success!';
        $IP = getUserIP();
        error_log('POST opg 4 from IP: '. $IP . ' username: '. $username . ' password: '. $password );
        
        header('Location: oppgave4_complete_dfkkai49fi30');
        exit;
    }
    echo 'Ikke prøv deg...';
    exit;
 }else{
     echo 'Ikke prøv deg... :)';
     exit;
 }
//header('Location: http://www.example.com/');
exit;
?>
*/
?>