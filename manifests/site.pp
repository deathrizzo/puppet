## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a primary and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  notify { 'Hello ElzWhere': }
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  include host_entries
  class { 'ntp':
        servers => ['nist-time-server.eoni.com','nist1-lv.ustiming.org','ntp-nist.ldsbc.edu']
  }
}

node puppet.elzwhere.net {
  notify { 'Hello Puppet Master!': }
}

#node raekwon.elzwhere.net {
#  include apache
#  class { 'apache::dissite':
#    vhost_file => '000-default.conf',
#  }
#}

node odb.elzwhere.net {
  include apache
}

