<?php 

//Carly Dobie Z1859292
//CSCI 466 Assignment 9

include 'login.php';

try { //try to connect to database
    $dsn = "mysql:host=courses;dbname=z1859292";
    $pdo = new PDO($dsn, $username, $password);
}
catch(PDOexception $e) { //show error message if failure to connect
    echo "Connection to database failed: " . $e->getMessage();
}

if (!empty($_POST['all_suppliers_submit'])) { //show all suppliers
    $result = $pdo->query("SELECT SNAME FROM S");
    while($row = $result->fetch()) {
        echo $row['SNAME']."<br>";
    }
}
else if (!empty($_POST['all_parts_submit'])) { //show all parts
    $result = $pdo->query("SELECT PNAME, COLOR FROM P");
    while($row = $result->fetch()) {
        echo $row['PNAME']."<br>";
    }
}
else if (!empty($_POST['part_suppliers_submit'])) { //show all suppliers for given part
    $prepared = $pdo->prepare("SELECT SNAME FROM S WHERE SNUM IN(SELECT SNUM FROM SP WHERE 
    PNUM = (SELECT PNUM FROM P WHERE PNAME = ?))");
    $prepared->execute([$_POST['part']]);
    while($row = $prepared->fetch()) {
        echo $row['SNAME']."<br>";
    }
}
else if (!empty($_POST['parts_supplier_submit'])) { //show all parts for given supplier
    $prepared = $pdo->prepare("SELECT PNAME FROM P WHERE PNUM IN(SELECT PNUM FROM SP WHERE 
    SNUM = (SELECT SNUM FROM S WHERE SNAME = ?))");
    $prepared->execute([$_POST['supplier']]);
    $quantity = $pdo->query("SELECT QTY FROM SP WHERE PNUM = (SELECT PNUM FROM P WHERE
    PNAME = ");
    while($row = $prepared->fetch()) {
        echo $row['PNAME']."<br>";
    }
}
else if (!empty($_POST['add_part'])) { //add a part to the database
    $prepared = $pdo->prepare("INSERT INTO P (PNUM, PNAME) VALUES (?, ?)");
    $prepared->execute([$NEXT_PNUM, $_POST['part_name']]);
}
else if (!empty($_POST['add_supplier'])) { //add a supplier to the database
}
?>

SELECT PNAME FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE P.PNUM IN(SELECT SP.PNUM FROM SP WHERE 
    SNUM = (SELECT SNUM FROM S WHERE SNAME = 'Jones')); 

SELECT PNAME FROM P WHERE S.SNAME = 'Jones';

SELECT * FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE P.PNUM = 'P1';
SELECT * FROM SP INNER JOIN P ON SP.PNUM = P.PNUM;

SELECT DISTINCT SNUM, QTY, PNAME FROM SP, P WHERE P.PNUM IN(SELECT PNUM FROM SP WHERE SNUM = 
(SELECT SNUM FROM S WHERE SNAME = 'Clark')) AND SP.PNUM IN(SELECT PNUM FROM SP WHERE SNUM = 
(SELECT SNUM FROM S WHERE SNAME = 'Clark'));

SELECT P.PNAME, SP.QTY FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE P.PNUM = (SELECT PNUM FROM SP WHERE SNUM = 
(SELECT SNUM FROM S WHERE SNAME = 'Jones'));

SELECT * FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE IN 
(SELECT PNUM FROM SP);
 WHERE SNUM = (SELECT SNUM FROM S WHERE SNAME = 'Jones'));

SELECT DISTINCT P.PNAME, SP.QTY FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE P.PNUM='P1';

SELECT DISTINCT P.PNAME, SP.QTY FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE P.PNUM = 
(SELECT PNUM FROM SP WHERE SNUM = (SELECT SNUM FROM S WHERE SNAME = 'Clark'));

SELECT DISTINCT P.PNAME, SP.QTY FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE IN
(SELECT PNUM FROM SP WHERE SNUM = (SELECT SNUM FROM S WHERE SNAME = 'Clark'));

SELECT DISTINCT P.PNAME, SP.QTY FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE IN
(SELECT PNUM FROM SP WHERE SNUM = 'S1');

SELECT P.PNAME, SP.QTY, SP.SNUM FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE P.PNUM IN
(SELECT PNUM FROM SP WHERE SNUM = (SELECT SNUM FROM S WHERE SNAME = 'Clark'));

SELECT P.PNAME, SP.QTY, SP.SNUM FROM P INNER JOIN SP ON P.PNUM = SP.PNUM WHERE P.PNUM IN
(SELECT PNUM FROM SP WHERE SNUM = 'S1');