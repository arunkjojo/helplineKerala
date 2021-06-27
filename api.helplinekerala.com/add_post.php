<?php 
    include_once './cors.php';
    include_once './database.php';

    // var_dump($_POST);

    // var_dump($_FILES);

    $response = [];

    if(isset($_POST) && $_POST['user_id']!='' && $_POST['latitudeValue']!='' && $_POST['longitudeValue']!='' && ($_POST['message']!='' || $_FILES["assets"]["name"]!='')){
    
        $stmt_sql1="INSERT INTO `post`(`user_id`, `message`, `post_date`,`post_time`,`latitude`,`longitude`, `all_user`, `common_citizen`, `police`, `fire_force`, `rapid_force`, `medical`, `finance`, `gov_authority`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        $stmt1 = $con->prepare($stmt_sql1);

        $user_id= $_POST['user_id'];

        $date=date("d-m-Y");

        $time=date("h:i:s a");

        $all_user=($_POST['allUser']==true?1:0);

        $police=($_POST['police']==true?1:0);

        $fire_force=($_POST['fireForce']==true?1:0);

        $rapid_force=($_POST['rapidForce']==true?1:0);

        $medical=($_POST['medicalRelated']==true?1:0);

        $finance=($_POST['financeRelated']==true?1:0);

        $gov_authority=($_POST['govAuthority']==true?1:0);

        $common_citizen=($_POST['commonCitizen']==true?1:0);

        $param=$stmt1->bind_param("isssssiiiiiiii", $_POST['user_id'],$_POST['message'],$date,$time,$_POST['latitudeValue'],$_POST['longitudeValue'],$all_user,$common_citizen,$police,$fire_force,$rapid_force,$medical,$finance,$gov_authority);

        $res1=$stmt1->execute();

        $post_id=$stmt1->insert_id;

        if($res1){
            $response = array(
                "status" => true,
                "massage" => "Could not insert post table"
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


        if(isset($_FILES["assets"]) && $_FILES["assets"]["name"]!='' && $post_id!='' && $user_id!=''){

            
            $stmt_sql2="INSERT INTO `post_assets`(`post_id`, `image_video`, `type`) VALUES (?,?,?)";
            
            $stmt2 = $con->prepare($stmt_sql2);

            $fname=$_FILES["assets"]["name"];

            $type=$_FILES["assets"]["type"]!=''?$_FILES["assets"]["type"]:$_POST["fileType"];

            $stmt2->bind_param("iss", $post_id,$fname,$type);

            $res2=$stmt2->execute();

            // //echo prepared statements2//
            //     function preparedQuery($stmt_sql2,$params) {
            //         for ($i=0; $i<count($params); $i++) {
            //         $stmt_sql2 = preg_replace('/\?/',$params[$i],$stmt_sql2,1);
            //         }
            //         return $stmt_sql2;
            //     }

            //     echo "<br/>STMT2: ".preparedQuery($stmt_sql2,array($post_id,$fname,$type));
            // //echo prepared statements2//

            $post_assets_id=$stmt2->insert_id;


            $target_dir = "assets/";

            $target_file = $target_dir . basename($_FILES["assets"]["name"]);

            $uploadOk = 1;

            $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));



            $filename =$user_id.'_'.$post_id.'_'.$post_assets_id.'.png';



            $target_file = $target_dir . $filename;



            // Check if image file is a actual image or fake image

            // if(isset($_POST["submit"])) {

            //     $check = getimagesize($_FILES["assets"]["tmp_name"]);

            //     if($check !== false) {

            //         // echo "File is an image - " . $check["mime"] . ".";

            //         $uploadOk = 1;

            //     } else {

            //         // echo "File is not an image.";

            //         $uploadOk = 0;

            //     }

            // }



            // Check if file already exists

            if (file_exists('assets/'.$user_id.'_'.$post_id.'_'.$post_assets_id.'.png')) {

                echo "Sorry, file already exists.";

                unlike('assets/'.$user_id.'_'.$post_id.'_'.$post_assets_id.'.png');

                $uploadOk = 1;

            }



            // Check file size

            if ($_FILES["assets"]["size"] > 500000000) {

                echo "Sorry, your file is too large.";

                $uploadOk = 0;

            }



            // Allow certain file formats

            if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
            // && $imageFileType != "MP4" && $imageFileType != "mp4" && $imageFileType != "avi" && $imageFileType != "flv" && $imageFileType != "mpeg"

            // echo "Sorry, only JPG, JPEG, PNG files are allowed.";

            $uploadOk = 0;

            }



            // Check if $uploadOk is set to 0 by an error

            if ($uploadOk == 0) {

            echo "Sorry, your file was not uploaded.";

            // if everything is ok, try to upload file

            } else {

                $filePath="http://api.helplinekerala.com/".$target_file;

                if (move_uploaded_file($_FILES["assets"]["tmp_name"], $target_file)) {

                    // echo "The file ". basename( $_FILES["assets"]["name"]). " has been uploaded.";

                    $stmt_sql3="UPDATE `post_assets` SET `image_video`=?, `path`=? WHERE `id` = ? AND post_id=?";
                    
                    $stmt3 = $con->prepare($stmt_sql3);

                    $stmt3->bind_param("ssii", $filename,$filePath,$post_assets_id,$post_id);

                    $res3 = $stmt3->execute();
                    if($res3){
                        $response = array(
                            "status" => true,
                            "massage" => "Insert post_assets table"
                        );
                    }else{
                        $response = array(
                            "status" => false,
                            "massage" => "Could not insert post_assets table"
                        );
                    }

                    // //echo prepared statements3//
                    //     function preparedQuery($stmt_sql3,$params) {
                    //         for ($i=0; $i<count($params); $i++) {
                    //         $stmt_sql3 = preg_replace('/\?/',$params[$i],$stmt_sql3,1);
                    //         }
                    //         return $stmt_sql3;
                    //     }

                    //     echo "<br/>STMT3: ".preparedQuery($stmt_sql3,array($filename,$filePath,$post_assets_id,$post_id));
                    // //echo prepared statements3//


                } 

            }
        }
    }
    echo json_encode($response);

    include_once './database_close.php';
?>