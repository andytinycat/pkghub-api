# Pkghub::API

This gem lets you interact with the (pkghub.io)[pkghub.io] API. pkghub.io is a SaaS platform
for hosting Ubuntu packages either publically or privately.

pkghub.io is currently undergoing active development and is not feature-complete.

## Installation

Add this line to your application's Gemfile:

    gem 'pkghub-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pkghub-api

## Usage

The gem has a binary called `pkghub`, which will have several commands it can
execute. Right now, it can only upload packages.

To upload a package:

    pkghub upload --token [yourtoken] \
                  --distro precise \
                  --project my_first_project \
                  --file /path/to/package.deb

If it succeeds you'll see:

    Success

If it fails, you'll get an informative (hopefully) error message in your shell.

You can find your API token on your profile page, which is located at: `https://pkghub.io/users/yourusername`,
or can be found by logging in and clicking the "Your Profile" link in the top right. Don't reveal this
token to others, as it can be used to modify your repositories.

You can also use the gem programmatically - look at the `pkghub` command source code to see
how it works.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
