<?php 
    include_once './cors.php';
    include_once './database.php';

    $request = file_get_contents("php://input");
    $data = json_decode($request);

    $response = [];

    if(isset($data) && $data->user_id!='' && $data->verify!='' && $data->id!='' && $data->actions=='verify'){
    
        $stmt_sql1="UPDATE `post` SET `verified_user_id`=?,`status`=? WHERE `id`=?";
        
        $stmt1 = $con->prepare($stmt_sql1);

        $user_id= null;

        $verify= $data->verify;

        if($verify != 0){
            $user_id= $data->user_id;
        }

        $post_id= $data->id;

        $param=$stmt1->bind_param("iii", $user_id,$verify,$post_id);

        $res1=$stmt1->execute();

        if($res1){
            $response = array(
                "status" => true
            );
        }

        // //echo prepared statements1//
        //     function preparedQuery($stmt_sql1,$params) {
        //         for ($i=0; $i<count($params); $i++) {
        //         $stmt_sql1 = preg_replace('/\?/',$params[$i],$stmt_sql1,1);
        //         }
        //         return $stmt_sql1;
        //     }

        //     echo "<br/>STMT1: ".preparedQuery($stmt_sql1,array($_POST['user_id'],$_POST['message'],$date,$time,$_POST['latitudeValue'],$_POST['longitudeValue'],$all_user,$common_citizen,$police,$fire_force,$rapid_force,$medical,$gov_authority));
        // //echo prepared statements1//


    }
    echo json_encode($response);

    include_once './database_close.php';
?>