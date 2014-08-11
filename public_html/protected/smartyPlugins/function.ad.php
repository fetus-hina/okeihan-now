<?php
function smarty_function_ad($params, &$smarty) {
    return '<script>google_ad_client="ca-pub-0704984061430053";google_ad_slot="3065364631";google_ad_width=320;google_ad_height=50</script>' .
           '<script src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>';
}
