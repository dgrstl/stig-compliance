Facter.add('ssh_id_38607_stig') do
  confine :kernel => 'Linux'
  setcode do
    ssh_protocol = Facter::Core::Execution.execute('grep Protocol /etc/ssh/sshd_config')
    if ssh_protocol == 'Protocol 2'
      'pass'
    else
      'fail'
    end
  end
end
