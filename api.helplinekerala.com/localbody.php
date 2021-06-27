<?php 
include_once './cors.php';
include_once './database.php';

$request = file_get_contents("php://input");
$data = json_decode($request);


if($_SERVER["REQUEST_METHOD"] == "POST"){

    $stmt_sql="SELECT `id`,`name` FROM `localbodies` WHERE `district_id`=? ORDER BY name asc";
    
    $stmt = $con->prepare($stmt_sql);
    $result = $stmt->bind_param("i", $data->did);
    $result = $stmt->execute();
    $localbodies=[];

    if($result){
        $result= $stmt->get_result();
        while($row = $result->fetch_assoc()) {
            $localbodies[] = ["id" => $row["id"],  "name" => $row["name"]];
        }
    }
    echo json_encode($localbodies);
}
include_once './database_close.php';