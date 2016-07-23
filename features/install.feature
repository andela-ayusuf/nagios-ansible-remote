Feature: Configure Nagios

  Scenario: Update apt cache
    When I update apt cache
    Then it should be successful

  Scenario: Install nagios-plugins and nagios-nrpe-server
    When I Install nagios-plugins and nagios-nrpe-server
    Then it should be successful

  Scenario: Update NRPE configuration file
    When I update NRPE configuration file
    Then it should be successful
    And Nagios-nrpe-server should be running
