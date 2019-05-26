class EventProcessor
  def process(text)
    message = {
      "type": "text",
      #{}"text": "hello,#{text}"+"史密打"
      "text": text.tr('嗎', '').tr('?？', '!！').tr('妳你', '我我').tr('我', '你')
      "type": "image",
	  "originalContentUrl": "https://upload.wikimedia.org/wikipedia/commons/9/97/Cat_%282188027041%29.jpg",
	  "previewImageUrl": "https://upload.wikimedia.org/wikipedia/commons/9/97/Cat_%282188027041%29.jpg"
    }
    return message
  end
end
