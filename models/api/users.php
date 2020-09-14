<?
    $users = Db::select("
        SELECT
            `clt_id`,
            `clt_name`,
            `clt_sname`,
            `clt_date`,
            `clt_email`
        FROM
            `clients`,
            `clinics`,
            `visits`
        WHERE
            (`v_clt_id` = `clt_id`) AND
            (`v_cl_id` = `cl_id`) AND
            (`cl_id` = '".$_GET['clinic']."')
        GROUP BY `clt_id`
    ");

    echo json_encode($users);