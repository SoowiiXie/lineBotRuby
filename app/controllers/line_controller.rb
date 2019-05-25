class LineController < ActionController::API
  before_action :read_body
  before_action :validate_signature
  before_action :read_events

  def webhook
    @events.each do |event|
      process_event(event)
    end
    head :ok
  end

  def process_event(event)
    reply_token = event["replyToken"]
    return if reply_token.nil?
    
    text = event["message"] && event["message"]["text"] || event["type"]
    puts ""
    puts "用戶的輸入: #{text}"
    puts ""
    
    message = EventProcessor.new.process(text)
    puts ""
    puts "聊天機器人的回應: #{message}"
    puts ""
    
    return if message.blank?
    response = client.reply_message(reply_token, message)
    puts ""
    puts "Line的回應: #{response.body}"
    puts ""
  end

  private

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  def read_body
    @body = request.body.read
  end

  def read_events
    @events = client.parse_events_from(@body)
  end

  def validate_signature
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    client.validate_signature(@body, signature)
  end
end
