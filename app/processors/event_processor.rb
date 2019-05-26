class EventProcessor
  def process(text)
    message = {
      "type": "text",
      #{}"text": "hello,#{text}"+"史密打"
      "text": text.tr('嗎', '').tr('?？', '!！')
    }
    return message
  end
end
