<?php
xdebug_start_code_coverage();
function save_coverage()
{
    $data = xdebug_get_code_coverage();
    $cov_name = time() . '.' . uniqid('', true) . '.serialized';
    file_put_contents('/xdebug/' . $cov_name, serialize($data));
    xdebug_stop_code_coverage();
}

register_shutdown_function('save_coverage');
?>
