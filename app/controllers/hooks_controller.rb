class HooksController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :basic_auth

  def jawbone
    events = params[:events]
    head(:ok) and return unless events

    events.each do |event|
      case event[:action]
      when 'enter_sleep_mode'
        sqs.send_message('lights:off')
        tweet_with_time '( ˘ω˘)'
      when 'exit_sleep_mode'
        sqs.send_message('lights:max')
        tweet_with_time '"(\( ⁰⊖⁰)/)"'
      else
        puts 'unknown event'
        p event
      end
    end
    head(:ok)
  end

private

  def sqs
    @sqs ||= AWS::SQS.new(
      access_key_id:     ENV['AWS_ID'],
      secret_access_key: ENV['AWS_SECRET'],
      region:            ENV['AWS_REGION']
    ).queues[ENV['SQS_URL']]
  end

  def tweet_with_time(text)
    TWITTER.update("@tos #{text} \n\n[#{Time.now}]")
  end
end
