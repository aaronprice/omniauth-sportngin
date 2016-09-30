SportNgin OAuth2 Strategy for OmniAuth 1.0.

Supports connection with Sport Ngin users.

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-sportngin'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::SportNgin` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
config.omniauth :sportngin, key, secret
```

### Custom Callback URL/Path

You can (and should) set a custom `callback_url` or `callback_path` option to override the default value. See [OmniAuth::Strategy#callback_url](https://github.com/intridea/omniauth/blob/master/lib/omniauth/strategy.rb#L411) for more details on the default.

## Auth Hash

Here's an example Auth Hash available in `request.env['omniauth.auth']`:

```ruby
{
  provider: "sportngin",
  uid: 1,
  info: {
    name: "Test test",
    user_name: "admin"
  },
  credentials: {
    access_token: "access-token",
    expires: true,
    expires_at: 1434161779,
    refresh_token: "refresh-token",
    token: "access-token"
  },
  extra: {
    raw_info: {
      metadata: {
        current_user: {
          id: 1,
          first_name: "Test",
          last_name: "test",
          user_name: "admin"
        }
      },
      result: {
        client: {
          id: 17,
          name: "your-app"
        }
      }
    }
  }
}
```

The precise information available may depend on the permissions which you request and are granted
as a Client Application.

## Token Expiry
### Server-Side Flow

Access Tokens last 30 minutes. Refresh Tokens last one month.

## TODO

*Still needs implemented for SportNgin-Omniauth, though this is how Facebook does it*

You can configure several options, which you pass in to the `provider` method via a `Hash`:

* `scope`: A comma-separated list of permissions you want to request from the user. See the Facebook docs for a full list of available permissions: http://developers.facebook.com/docs/reference/api/permissions. Default: `email`
* `display`: The display context to show the authentication page. Options are: `page`, `popup` and `touch`. Read the Facebook docs for more details: https://developers.facebook.com/docs/reference/dialogs/oauth/. Default: `page`
* `auth_type`: Optionally specifies the requested authentication features as a comma-separated list, as per https://developers.facebook.com/docs/authentication/reauthentication/.
Valid values are `https` (checks for the presence of the secure cookie and asks for re-authentication if it is not present), and `reauthenticate` (asks the user to re-authenticate unconditionally). Default is `nil`.
* `secure_image_url`: Set to `true` to use https for the avatar image url returned in the auth hash. Default is `false`.
* `image_size`: Set the size for the returned image url in the auth hash. Valid options are `square` (50x50), `small` (50 pixels wide, variable height), `normal` (100 pixels wide, variable height), or `large` (about 200 pixels wide, variable height). Default is `square` (50x50).

For example, to request `email`, `user_birthday` and `read_stream` permissions and display the authentication page in a popup window:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sportngin, ENV['KEY'], ENV['SECRET'],
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
```

## License

Copyright (c) 2012 by Sport Ngin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
