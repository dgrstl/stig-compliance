Facter.add('ssh_id_38614_stig') do
  confine :kernel => 'Linux'
  setcode do
    ssh_auth = Facter::Core::Execution.execute('grep -i PermitEmptyPasswords /etc/ssh/sshd_config')
    if ssh_auth == '#PermitEmptyPasswords no' || ssh_auth == 'PermitEmptyPasswords no'
      'pass'
    else
      'fail'
    end
  end
end
