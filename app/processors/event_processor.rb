class EventProcessor
  def process(text)
    message = {
      "type": "text",
      #{}"text": "hello,#{text}"+"史密打"
      "text": text.tr('嗎', '').tr('?？', '!！').tr('妳你', '我我')
    }
    return message
  end
end
