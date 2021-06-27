<?php 
include_once './cors.php';
include_once './database.php';

if($_SERVER["REQUEST_METHOD"] == "GET" && $_GET['id']!=''){
    $id=$_GET['id'];

    $stmt=$con->prepare("SELECT `users`.id,`users`.`name`,`users`.`password`,`users`.`mobile`,`users`.`type`,`user_details`.`district`,`user_details`.`area`,`user_details`.`blood_group`,`user_details`.`profile_pic`,`localbodies`.`name` as `localbody` FROM `users` LEFT JOIN `user_details` ON `users`.`id`=`user_details`.`user_id` LEFT JOIN `localbodies` ON `localbodies`.`id`=`user_details`.`localbody` WHERE users.id=?");
    
    $stmt->bind_param("i", $id);

    $res=$stmt->execute();

    
    if($res){
        $result= $stmt->get_result();
        $row = $result->fetch_assoc();
        $data=[
            "id"=>$row["id"],
            "userName"=>$row["name"],
            "mobileNumber"=>$row["mobile"],
            "userType"=>$row["type"],
            "district"=>$row["district"],
            "localbody"=>$row["localbody"],
            "area"=>$row["area"],
            "blood"=>$row["blood_group"],
            "profile_pic"=>$row["profile_pic"]
        ];

    }
    
    echo json_encode($data, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES );
}
include_once './database_close.php';