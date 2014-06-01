class HooksController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :basic_auth

  def jawbone
    events = params[:events]
    head(:ok) and return unless events

    events.each do |event|
      case event[:type]
      when 'mood'
        tweet_with_time 'ふぃー'
      when 'sleep'
        tweet_with_time '(\( ⁰⊖⁰)/)'
      else
        puts 'unknown event'
        p event
      end
    end
    head(:ok)
  end

private

  def tweet_with_time(text)
    TWITTER.update("@tos #{text} \n\n[#{Time.now}]")
  end
end
