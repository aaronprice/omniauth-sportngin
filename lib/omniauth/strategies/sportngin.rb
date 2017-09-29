require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Sportngin < OAuth2
      option :name, :sportngin

      option :client_options, {
        site: 'https://api.sportngin.com',
        authorize_url: 'https://user.sportngin.com/oauth/authorize',
        token_url: 'https://user.sportngin.com/oauth/token',
        me_url: 'https://user.sportngin.com/oauth/me'
      }

      uid { user['id'] }

      info do
        {
          'user_name' => user['user_name'],
          'name' => "#{user['first_name']} #{user['last_name']}"
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        access_token.options[:parse] = :json
        @raw_info ||= access_token.get(options.client_options.me_url).parsed
      end

      def user
        raw_info["result"]["user"]
      end
    end
  end
end
