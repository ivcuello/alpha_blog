module ApplicationHelper

  def gravatar_for(user, options = { size: 80, mashrur: true })
    email_address = options[:mashrur] ? "mashrur.hossain@gmail.com" : user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto d-block")
  end

end
