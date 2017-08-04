# example local config file for running tests
#copy to local.rb to run with your info.

CAPYBARA_CONFIG = {
    :app_host => "https://datasite-stage.ber1.mrll.com/ds/r/ds"
}

DB = {
    :audit_user => {
        :username => 'dsaudit',
        :pw => 'dsaudit'
    }
}

URIS = {
    :it_tools_uri => "http://admin:admin@datasite-stage.ber1.mrll.com/ds/service/internal/script",
    :node_browser_uri =>"http://admin:Blues123@ds-stage-cms1-1.dmzber1.mrll.com:8080/ds/service/enterprise/admin/admin-nodebrowser"
}

USERS = {
    :merrill_pm => {
        :login => "anoopkumar.singh",
        :pw => "Test@1234"
    },
    :account_services => {
        :login => "madmin",
        :pw => "Madmin13"
    },
    :it_admin => {
        :login => "asingh",
        :pw => "Test@1234"
    }
}
