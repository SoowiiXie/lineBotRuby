class EventProcessor
  def process(text)
    message = {
      "type": "text",
      "text": text
    }
    return message
  end
end
