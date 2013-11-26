# riemann cookbook

# Requirements

Depends on the yum and [graphite](https://github.com/hw-cookbooks/graphite)
cookbooks. Targets Amazon Linux and CentOS, but should work for any RHEL
derivative.

# Usage

Make sure you set the `node[:riemann][:version]` (current version is 0.2.4) and
`node[:graphite][:web_server]` attributes.

# Attributes

```
node[:riemann][:version] -- What version of riemann you'd like installed
```

# Recipes

## default.rb

Will re-create the riemann config from template/attributes. Calls install.rb

## install.rb

As it says on the tin, installs riemann and graphite on the server.

# License

MIT

# Author

Author:: Ryan Brown (ryan.brown@hudl.com)
