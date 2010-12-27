module ApplicationHelper
  def avatar_url(user, size = 48)  
    default_url = "#{root_url}images/guest-#{size}.png"  
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase  
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"  
  end
end
