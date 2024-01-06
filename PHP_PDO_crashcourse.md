# PHP PDO

## What is PDO?
- A data abstraction layer: which unifies the communication between the DB and the application. They reduce the amount of work by providing a consistent API
- It stands for PHP Data Objects
- It has DNS which is an eassy yet fancy way of connecting to databases

## Why PDO?
- Security (usable prepared statements)
- Usability (many helper functions to automate routine operations)
- Reusability (unified API to access multitude of databases, from SQLite to Oracle)
- Cleaner and organized code

## Main PDO classes
- PDO: Represents the connection between PHP and PDO
- PDOStatements: Represents a prepared statement and after executed an associated result
- PDOException: Represents errors raised by PDO

> => Install Xampp server to work

## Connecting to database using PDO
``` php
    <?php
    //host, dbname, user, password
    $host = "localhost";
    $dbname = "job_portal";
    $user = "root";
    $password = "";

    $conn = new PDO("mysql:host=$host;dbname=$dbname","$user","$password");
    if($conn == true){
        echo "database is working fine";
    }else{
        echo "something is wrong";
    }
    ?>
```

## Handling the exception using try catch statements
```php
<?php
    try{
        $host = "localhost";
        $dbname = "job_portal";
        $user = "root";
        $password = "";

        $conn = new PDO("mysql:host=$host;dbname=$dbname",$user,$password);
        $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    }catch(PDOException $e){
        echo $e->getMessage();
        //echo "<script>alert('something went wrong! please try again later.')</script>";
        //die("db error");
    }
?>
```

## Getting Data with query and fetch
```php
<?php
require 'config.php';
$rows = $conn -> query("select username from users");
while($rows = $rows->fetch()){
    echo $rows['username']."<br>";
}
?>
```

## Getting Data with query and foreach
```php
<?php
require 'config.php';
$rows = $conn -> query("select username from users");
foreach($rows as $row){
    echo $row['username']."<br>";
}
?>
```
>we can also choose the way how we want to fetch the data.
```php
<?php
//PDO::FETCH_NUM returns enumerated array
//PDO::FETCH_ASSOC returns associative array
//PDO::FETCH_BOTH - both of the above
//PDO::FETCH_OBJ returns object
//PDO::FETCH_LAZY allows all three (numeric associative and object) methods without memory.

require 'config.php';
while($row = $rows->fetch(PDO::FETCH_NUM)){
    $i = 0;
    echo $row[$i]."<br>";
    $i = $i + 1;
}

while($row = $rows->fetch(PDO::FETCH_ASSOC)){
    echo $row['username']."<br>";
}

while($row = $rows->fetch(PDO::FETCH_OBJ)){
    echo $row->username."<br>";
}
?>
```

## Getting data with fetchColumn and fetchAll
```php
<?php
requires 'config.php';
$data = $conn -> query("select * from users");
$one = $data->fetchColumn();
echo $one;
?>
```
---
```php
<?php
requires 'config.php';
$data = $conn -> query("select * from users");
$one = $data->fetchAll(PDO::FETCH_OBJ); // will return "Array"
// echo "<pre>";
// print_r ($one);
// echo "</pre>";
echo $one -> username."<br>"
?>
```

## Prepared Statements
- Handlers handle the data before it gets inseted into database.
- those data should be cleaned and sanitized before it gets inserted into the database.
- :\<handlername> or ? can be used

```php
<?php
$username = "aaditya";
$password = "aaditya";
$phone = 1234567890;
$email = "aaditya";

$insert = $conn -> prepare("insert into users values(:username,:password,:phone,:email)");
$insert -> execute(array(
    ':username' => $username,
    ':password' => $password,
    ':phone' => $phone,
    ':email' => $email
));
?>
```

>  ? can also be used in place of handlers

```php
$insert = $conn -> prepare("insert into users values(?,?,?,?)");
$insert -> execute(array(
    $username,$password,$phone,$email
));
```

> ### personal tips
> - use query for selecting data
> - use prepare to do insert, update and delete


## Getting rowCount, lastInsertId, 
```php
<?php
require 'config.php';
$rows = $conn -> query("select * from users");
echo $rows -> rowCount();
echo $rows -> lastInsertId();
?>
```

## Transactions
```php
<?php
require 'config.php';
try{
    $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $conn -> beginTransaction();
    $conn -> query("insert into users(username,password,phone,email) values('raushan','raushan',1234567890,'raushan')");
    $conn -> query("insert into users(username,password,phone,email) values('cyb3ritic','cyb3ritic',1234567890,'cyb3ritic')");
    $conn -> commit();
}catch(Exception $e){
    $conn -> rollback();
    echo $e -> getMessage();
}
?>
```

## Closing the connection
```php
<?php
require 'config.php';
$conn = null;
?>
```

## like and in keywords
```php
<?php
require 'config.php';
$pattern = 'am';
$sql = $conn->prepare("select * from users where username like :pattern");
$sql->execute([':pattern' => $pattern]);
$sql->fetchAll(PDO::FETCT_ASSOC);
echo $sql['username'];
?>
```

```php
<?php
require 'config.php';
$sql = $conn->prepare("select * from users where username in('samip','sahil')");
$sql->execute();
$sql->fetchAll(PDO::FETCT_ASSOC);
echo "<pre>";
print_r($sql);
echo "</pre>";
?>
```