cask 'chef-workstation' do
  version '0.2.21'
  sha256 'f951fb1733ebdc67aa11f337802141589fc74cc0daedb31c3672ef591ae1645b'

  url "https://packages.chef.io/files/stable/chef-workstation/#{version}/mac_os_x/10.13/chef-workstation-#{version}-1.dmg"
  name 'Chef Workstation'
  homepage 'https://downloads.chef.io/chef-workstation'

  depends_on macos: '>= :el_capitan'

  pkg "chef-workstation-#{version}-1.pkg"

  # When updating this cask, please verify the list of paths to delete and correct it if necessary:
  #   find /usr/local/bin -lname '/opt/chef-workstation/*' | sed -E "s/^(.*)$/'\1',/"
  uninstall pkgutil: 'com.getchef.pkg.chef-workstation',
            delete:  [
                       '/opt/chef-workstation/',
                       '/usr/local/bin/berks',
                       '/usr/local/bin/chef',
                       '/usr/local/bin/chef-apply',
                       '/usr/local/bin/chef-client',
                       '/usr/local/bin/chef-run',
                       '/usr/local/bin/chef-shell',
                       '/usr/local/bin/chef-solo',
                       '/usr/local/bin/chef-vault',
                       '/usr/local/bin/chefx',
                       '/usr/local/bin/cookstyle',
                       '/usr/local/bin/dco',
                       '/usr/local/bin/delivery',
                       '/usr/local/bin/foodcritic',
                       '/usr/local/bin/inspec',
                       '/usr/local/bin/kitchen',
                       '/usr/local/bin/knife',
                       '/usr/local/bin/ohai',
                       '/usr/local/bin/push-apply',
                       '/usr/local/bin/pushy-client',
                       '/usr/local/bin/pushy-service-manager',
                     ]

  zap trash: '~/.chef-workstation/'
end