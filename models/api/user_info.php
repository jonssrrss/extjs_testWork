<?
    $users = Db::select("
        SELECT
            `v_date`,
            `v_pay`
        FROM
            `visits`
        WHERE
            (`v_clt_id` = '".$_GET['clt']."') AND
            (`v_cl_id` = '".$_GET['cl']."')
    ");

    echo json_encode($users);