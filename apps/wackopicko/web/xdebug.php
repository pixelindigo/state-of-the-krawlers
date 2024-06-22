<?php
xdebug_start_code_coverage();
function save_coverage()
{
    $data = xdebug_get_code_coverage();
    $cov_name = uniqid('', true) . '.serialized';
    //file_put_contents('/tmp/' . $cov_name, serialize($data));
    file_put_contents('/xdebug/' . $cov_name, serialize($data));
    xdebug_stop_code_coverage();
    echo "<!--" . $cov_name . "-->";
}

register_shutdown_function('save_coverage');
?>
