<?php 
include_once './cors.php';
include_once './database.php';

if($_SERVER["REQUEST_METHOD"] == "GET" && $_GET['user_id']!=''){

    $userid=$_GET['user_id'];

    $stmt=$con->prepare("SELECT `users`.`type` FROM `users` WHERE `users`.`id`=?");
    
    $stmt->bind_param("i", $userid);

    $view_res=$stmt->execute();

    $view_result= $stmt->get_result();

    $view_row = $view_result->fetch_assoc();

    $view_list=$view_row['type'];

    $all=1;
    $customer=1;


    $stmt_sql="SELECT `post`.id,`post`.`user_id`,`post`.`all_user`, `post`.`common_citizen`, `post`.`police`, `post`.`fire_force`, `post`.`rapid_force`, `post`.`medical`, `post`.`gov_authority`,`post`.message,`post`.`post_date`,`post`.`post_time`,`post`.`longitude`,`post`.`latitude`,`post`.`verified_user_id`,`post_assets`.`image_video`,`post_assets`.`type`,`post_assets`.`path`,`users`.`name` FROM `post` LEFT JOIN `post_assets` ON `post_assets`.`post_id`=`post`.`id` LEFT JOIN `users` ON `users`.`id`=`post`.`user_id` WHERE  `post`.`status`='0' AND `post`.`verified_user_id` IS NULL";
    // $stmt_sql .=" AND (`post`.`all_user`=?";
    
    // switch($view_list){
    //     case 'Common Citizen':
    //         $stmt_sql .=" OR  `post`.`common_citizen`=?";
    //     break;
    //     case 'Police':
    //         $stmt_sql .=" OR  `post`.`police`=?";
    //     break;
    //     case 'Fire Force':
    //         $stmt_sql .=" OR  `post`.`fire_force`=?";
    //     break;    
    //     case 'Rapid Force':
    //         $stmt_sql .=" OR  `post`.`rapid_force`=?";
    //     break;
    //     case 'Medical Related':
    //         $stmt_sql .=" OR  `post`.`medical`=?";
    //     break;
    //     case 'Government Authority':
    //         $stmt_sql .=" OR  `post`.`gov_authority`=?";
    //     break;
    //     default:
    //         $stmt_sql .="";
    //     break;
    // }
    
    // $stmt_sql .=")";
    $stmt_sql .=" ORDER BY  `post`.`id` DESC";
    // $stmt_sql .=" ORDER BY  `post`.`post_date` ASC, `post`.`post_time` ASC,`post`.id DESC";
    // echo $stmt_sql;
    $stmt = $con->prepare($stmt_sql);

    // $stmt->bind_param("ss", $all,$customer);

    $res=$stmt->execute();

    $post=array();

    
    if($res){
        $result= $stmt->get_result();
        while($row = $result->fetch_assoc()) {
            $view="";
            if($row['all_user'] == '1'){
                $view .="Public, ";
            }else{
                switch('1'){
                    case $row['common_citizen']:
                        $view .="Common Users, ";
                    break;
                    case $row['police']:
                        $view .="Police, ";
                    break;
                    case $row['fire_force']:
                        $view .="Fire Force, ";
                    break;    
                    case $row['rapid_force']:
                        $view .="Rapid Force, ";
                    break;
                    case $row['medical']:
                        $view .="Medical Department, ";
                    break;
                    case $row['gov_authority']:
                        $view .="Government Authority, ";
                    break;
                    default:
                        $view .=", ";
                    break;
                }
            }
            array_push($post,$data=[
                "id"=>$row["id"],
                "user_id"=>$row["user_id"],
                "view_list"=>substr($view,0,-2),
                "message"=>$row["message"],
                "post_date"=>$row["post_date"],
                "post_time"=>$row["post_time"],
                "longitude"=>$row["longitude"],
                "latitude"=>$row["latitude"],
                "verified_user_id"=>$row["verified_user_id"],
                "image_video"=>$row["image_video"],
                "type"=>$row["type"],
                "path"=>$row["path"],
                "user_name"=>$row['name']
            ]);
        }

    }
    
    echo json_encode($post, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES );
}
include_once './database_close.php';