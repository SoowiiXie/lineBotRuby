class EventProcessor
  def process(text)
    message = {
      "type": "text",
      "text": text.tr('嗎', '').tr('?？', '!！')
    }
    return message
  end
end
