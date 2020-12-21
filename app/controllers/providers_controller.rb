class ProvidersController < ApplicationController
  def setup
    # TODO: Twitter only. Refactor later for other syndication endpoints.
    if Setting.of(:syndication_twitter_secret).content.blank?
      redirect_to root_path, notice: "No Twitter key or secret settings were found. Add those in <a href='/settings'>/settings.</a>"
    else
      request.env['omniauth.strategy'].options[:consumer_key]    = Setting.of(:syndication_twitter_key).content
      request.env['omniauth.strategy'].options[:consumer_secret] = Setting.of(:syndication_twitter_secret).content
      render text: 'Omniauth setup phase.', status: :not_found
    end
  end

  def create
    @provider = Provider.from_omniauth(request.env['omniauth.auth'])
    @provider.user = current_user
    if @provider.save
      redirect_to root_path, notice: "Auth with #{@provider.provider} successful."
    else
      redirect_to root_path, notice: "Auth with #{@provider.provider} unsuccessful. Try again."
    end
  end
end
