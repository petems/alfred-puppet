class alfred ($db_user = 'alfred', $db_pass = 'mypassword', $config_branch = 'master', $ssh_key = 'undefined') {

	class { 'alfred::foundation': }

	class { 'alfred::ruby': }

	class { 'alfred::app': 
		require => [Class['alfred::ruby'], Class['alfred::foundation']],
	}->
	class { 'alfred::services': }
}
