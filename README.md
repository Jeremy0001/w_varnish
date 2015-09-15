w_varnish Cookbook
==================

[![Build Status](https://travis-ci.org/haapp/w_varnish.svg?branch=master)](https://travis-ci.org/haapp/w_varnish)

Chef cookbook to instal and configure Varnish. Expects high availability use case with HAProxy in front, multiple apache virtual machine as a backend.

Requirements
------------
Cookbook Dependency:

* varnish
* s3_file

Supported Platform:
Ubuntu 14.04, Ubuntu 12.04

Usage
-----
#### w_varnish::default

Include with `w_common` in your node/role's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[w_common]",
    "recipe[w_varnish]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Install reqired gems
```
bundle install
```
4. Write your change
5. Write tests for your change (if applicable)
6. Run the tests, ensuring they all pass
```
bundle exec rspec
bundle exec kithen test
```
7. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 
* Joel Handwell @joelhandwell 
* Full Of Lilies @fulloflilies
