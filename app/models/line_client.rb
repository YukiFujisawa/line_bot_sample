class LineClient
  def initialize
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
  end

  def reply_message(event, message)
    @client.reply_message(event['replyToken'], message)
  end

  def send_messages(event, texts)

    messages = texts.map do |text|
      {
        type: 'text',
        text: text
      }
    end

    reply_message(event, messages)
  end

  def send_confirm(event, question)
    message = {
      type: 'template',
      altText: 'this is a confirm template',
      template: {
        type: 'buttons',
        thumbnailImageUrl: question[:image_url],
        title: question[:title],
        text: question[:text],
        actions: question[:answers]
      }
    }
    reply_message(event, message)
  end

  def validate_signature(body, signature)
    @client.validate_signature(body, signature)
  end

  def parse_events_from(body)
    @client.parse_events_from(body)
  end

  def template
    {
      "type": "template",
      "altText": "this is a confirm template",
      "template": {
        "type": "confirm",
        "text": "今日のもくもく会は楽しいですか？",
        "actions": [
          {
            "type": "message",
            "label": "楽しい",
            "text": "aaa"
          },
          {
            "type": "message",
            "label": "楽しくない",
            "text": "aaa"
          }
        ]
      }
    }
  end
end