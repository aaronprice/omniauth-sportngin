require 'spec_helper'

describe OmniAuth::Strategies::Sportngin do
  subject { described_class.new({}) }

  context "client options" do
    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq("https://api.sportngin.com")
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://user.sportngin.com/oauth/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://api.sportngin.com/oauth/token')
    end
  end
end
