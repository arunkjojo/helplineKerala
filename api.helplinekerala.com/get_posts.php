<?php 
include_once './cors.php';
include_once './database.php';

if($_SERVER["REQUEST_METHOD"] == "GET" && $_GET['user_id']!=''){

    $userid=$_GET['user_id'];

    $stmt=$con->prepare("SELECT `users`.`type`,`user_details`.`localbody` FROM `users` LEFT JOIN `user_details` ON `user_details`.`user_id`=`users`.`id` WHERE `users`.`id`=?");
    
    $stmt->bind_param("i", $userid);

    $view_res=$stmt->execute();

    $view_result= $stmt->get_result();

    $view_row = $view_result->fetch_assoc();

    $view_list=$view_row['type'];

    $localBody=$view_row['localbody'];

    $all=1;
    $customer=1;


    $stmt_sql="SELECT `post`.id,`post`.`user_id`,`post`.`all_user`, `post`.`common_citizen`, `post`.`police`, `post`.`fire_force`, `post`.`rapid_force`, `post`.`medical`, `post`.`gov_authority`,`post`.message,`post`.`post_date`,`post`.`post_time`,`post`.`longitude`,`post`.`latitude`,`post`.`verified_user_id`,`post_assets`.`image_video`,`post_assets`.`type`,`post_assets`.`path`,`users`.`name` FROM `post` LEFT JOIN `post_assets` ON `post_assets`.`post_id`=`post`.`id` LEFT JOIN `users` ON `users`.`id`=`post`.`user_id` WHERE `post`.`status`='1' AND `post`.`verified_user_id` IS NOT NULL AND (`post`.`all_user`=?";
    
    // $stmt_sql="SELECT `post`.id,`post`.`user_id`,`post`.`all_user`, `post`.`common_citizen`, `post`.`police`, `post`.`fire_force`, `post`.`rapid_force`, `post`.`medical`, `post`.`gov_authority`,`post`.message,`post`.`post_date`,`post`.`post_time`,`post`.`longitude`,`post`.`latitude`,`post`.`verified_user_id`,`post_assets`.`image_video`,`post_assets`.`type`,`post_assets`.`path`,`users`.`name` FROM `post` LEFT JOIN `post_assets` ON `post_assets`.`post_id`=`post`.`id` LEFT JOIN `users` ON `users`.`id`=`post`.`user_id` LEFT JOIN `user_details` ON `user_details`.`user_id`=`post`.`user_id` WHERE `user_details`.`localbody` IN (?,(?-1),(?-2),(?+1),(?+2)) AND `post`.`status`='1' AND `post`.`verified_user_id` IS NOT NULL AND (`post`.`all_user`=?";
    
    switch($view_list){
        case 'Common Citizen':
            $stmt_sql .=" OR  `post`.`common_citizen`=?";
        break;
        case 'Police':
            $stmt_sql .=" OR  `post`.`police`=?";
        break;
        case 'Fire Force':
            $stmt_sql .=" OR  `post`.`fire_force`=?";
        break;    
        case 'Rapid Force':
            $stmt_sql .=" OR  `post`.`rapid_force`=?";
        break;
        case 'Medical Related':
            $stmt_sql .=" OR  `post`.`medical`=?";
        break;
        case 'Government Authority':
            $stmt_sql .=" OR  `post`.`gov_authority`=?";
        break;
        default:
            $stmt_sql .="";
        break;
    }
    
    $stmt_sql .=") ORDER BY  `post`.id DESC";
    // $stmt_sql .=" ORDER BY  `post`.`post_date` ASC, `post`.`post_time` ASC,`post`.id DESC";
    // echo $stmt_sql;
    $stmt = $con->prepare($stmt_sql);

    // if($view_list!=''){

        $stmt->bind_param("ss", $all,$customer);

    // }else{
    //     $stmt->bind_param("i", $all);
    // }

    $res=$stmt->execute();

    $post=array();


    // //echo prepared statements1//
    //     function preparedQuery($stmt_sql,$params) {
    //         for ($i=0; $i<count($params); $i++) {
    //         $stmt_sql = preg_replace('/\?/',$params[$i],$stmt_sql,1);
    //         }
    //         return $stmt_sql;
    //     }

    //     echo "<br/>STMT: ".preparedQuery($stmt_sql,array(1,1));
    // //echo prepared statements1//

    
    if($res){
        $result= $stmt->get_result();
        while($row = $result->fetch_assoc()) {

            $verified_id=$row['verified_user_id'];

            $stmt=$con->prepare("SELECT `users`.`name` as `verify_user` FROM `users` WHERE `users`.`id`=?");
            
            $stmt->bind_param("i", $verified_id);

            $verify_res=$stmt->execute();

            $verify_result= $stmt->get_result();

            $verify_row = $verify_result->fetch_assoc();
            
            $view="";

            // $stmt_sql1="SELECT `users`.`name` FROM `users` WHERE `users`.`id`=?";
            // $stmt1 = $con->prepare($stmt_sql1);
            // $stmt1->bind_param("i", $row['verified_user_id']);
            // $result=$stmt1->execute();
            // $userList=$stmt1->get_result()->fetch_assoc();

            if($row['all_user'] == '1'){
                $view .="Public, ";
            }else{
                // switch('1'){
                //     case $row['common_citizen']:
                //         $view .="Common Users, ";
                //     break;
                //     case $row['police']:
                //         $view .="Police, ";
                //     break;
                //     case $row['fire_force']:
                //         $view .="Fire Force, ";
                //     break;    
                //     case $row['rapid_force']:
                //         $view .="Rapid Force, ";
                //     break;
                //     case $row['medical']:
                //         $view .="Medical Department, ";
                //     break;
                //     case $row['gov_authority']:
                //         $view .="Government Authority, ";
                //     break;
                //     default:
                //         $view .=", ";
                //     break;
                // }
                if($row['common_citizen']=='1'){
                    $view .="Common Users, ";
                }if($row['police']=='1'){
                    $view .="Police, ";
                }if($row['fire_force']=='1'){
                    $view .="Fire Force, ";
                }if($row['rapid_force']=='1'){
                    $view .="Rapid Force, ";
                }if($row['medical']=='1'){
                    $view .="Medical Department, ";
                }if($row['finance']=='1'){
                    $view .="Finance Department, ";
                }if($row['gov_authority']=='1'){
                    $view .="Government Authority, ";
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
                "verified_user"=>'Verified by '.$verify_row["verify_user"],
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