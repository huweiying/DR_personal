<?php
    header('Content-Type:application/json;charset=utf8');
    require('../init.php');

    $output = '';
    $sql = "SELECT s_city FROM dr_shops GROUP BY s_city";
    $result = mysqli_query($conn,$sql);
    if($result){
        $rows = mysqli_fetch_all($result);
            for($i=0;$i<count($rows);$i++){
                $city = $rows[$i][0];
                $sql = "SELECT * FROM dr_shops WHERE s_city = '$city'";
                $result = mysqli_query($conn,$sql);
                $detail = mysqli_fetch_all($result,1);
                $output[$i] = array(0=>array('city' => $city,'detail' => $detail));
            }
            echo json_encode($output);

    }
?>