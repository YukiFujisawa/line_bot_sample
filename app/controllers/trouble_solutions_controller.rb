class TroubleSolutionsController < ApplicationController
  before_action :set_client


  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless @client.validate_signature(body, signature)
      head :bad_request
      return
    end

    events = @client.parse_events_from(body)

    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          text = event.message['text']
          if text.start_with?('答')
            if (text.end_with?('だね'))
              @client.send_messages(event, ['さすが！正解です。','次の問題にいきますか？'])
            else
              @client.send_messages(event, ['残念。不正解です。','次の問題にいきますか？'])
            end
          else
            @client.send_confirm(event, Questions.random)
          end
        end
      end
    end

    head :ok
  end

  def set_client
    @client = LineClient.new
  end
end
