class EventProcessor
  def process(text)
    message = {
      "type": "text",
      "text": "hello,#{text}"+"加加"
    }
    return message
  end
end
