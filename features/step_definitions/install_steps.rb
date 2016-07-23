require 'open3'
require_relative 'vars'

# Scenario: Update apt cache
When(/^I update apt cache$/) do
  cmd = "ansible-playbook -i inventory.ini --private-key=#{PATHTOKEY} playbook.remote-nagios.yml --tags 'setup'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

# Scenario: Install nagios-plugins and nagios-nrpe-server
When(/^I Install nagios-plugins and nagios-nrpe-server$/) do
  cmd = "ansible-playbook -i inventory.ini --private-key=#{PATHTOKEY} playbook.remote-nagios.yml --tags 'nagios_setup'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^it should be successful$/) do
  expect(@status.success?).to eq(true)
end

# Scenario: Update NRPE configuration file
When(/^I update NRPE configuration file$/) do
  cmd = "ansible-playbook -i inventory.ini --private-key=#{PATHTOKEY} playbook.remote-nagios.yml --tags 'update_nrpe'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

And(/^Nagios-nrpe-server should be running$/) do
  cmd = "ssh -i '#{PATHTOKEY}' #{AWSPUBDNS} 'sudo service nagios-nrpe-server status'"
  output, error, status = Open3.capture3 "#{cmd}"
  puts output
  puts error
  expect(status.success?).to eq(true)
  expect(output).to match("nagios-nrpe is running")
end