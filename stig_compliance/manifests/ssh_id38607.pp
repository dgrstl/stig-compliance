/*
  Class to verify the compliance to STIG ID 38607
  as it relates to SSH protocol setting
  by: jesus@puppet.com | @GarciaXuxo
*/
class stig_compliance::ssh_id38607(
  # set the default of noop to true and can be overwritten in console
  $checking = true,

  ) {
/*
  Look up our "stig" database
*/
$stig_id = hiera('ssh_V-38607.finding_id')
$stig_title   = hiera('ssh_V-38607.title')

/*
  Remediation path but in noop
*/
file_line { 'Protocol':
    path  => '/etc/ssh/sshd_config',
    line  => 'Protocol 2',
    match => 'Protocol',
    noop      => $checking,
  }
/*
  Just let me know...
*/
Notify{"Evaluating STIG ID $stig_id: $stig_title":}

}
