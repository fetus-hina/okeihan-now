<?php
if(!function_exists('smarty_function_js_css_signature')) {
    require_once(dirname(__FILE__) . '/function.js_css_signature.php');
}

function smarty_function_load_css(array $params, &$smarty) {
    return sprintf('<link rel="stylesheet" href="%s?%s">', $params['file'], smarty_function_js_css_signature($params, $smarty));
}
