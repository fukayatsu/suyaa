class HooksController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :basic_auth

  def jawbone
    events = params[:events]
    head(:ok) and return unless events

    events.each do |event|
      case event[:type]
      when 'mood'
        puts "mood changed."
      when 'enter_sleep_mode'
        puts "( ˘ω˘)"
      when 'exit_sleep_mode'
        puts '(\( ⁰⊖⁰)/)'
      else
        puts 'unknown event'
        p event
      end
    end
    head(:ok)
  end
end
