local set = require('utils').setPlug('rooter_')

set('silent_chdir', 1);
set('cd_cmd', 'lcd');
set('resolve_links', 1);
set('patterns', { '.git', '.git/' });
