<?php
function save_coverage()
{
    $data = xdebug_get_code_coverage();
    xdebug_stop_code_coverage();

    $postdata = json_encode(
        array(
            'coverage' => $data,
        )
    );

    $opts = array('http' =>
        array(
            'method'  => 'POST',
            'header'  => 'Content-type: application/json',
            'content' => $postdata
        )
    );

    $context = stream_context_create($opts);

    $result = file_get_contents('http://collector/coverage', false, $context);

    //$cov_name = time() . '.' . uniqid('', true) . '.serialized';
    //file_put_contents('/xdebug/' . $cov_name, serialize($data));
    echo "<!--" . $cov_name . "-->";
}

register_shutdown_function('save_coverage');
xdebug_start_code_coverage();
?>
