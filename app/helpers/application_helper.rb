module ApplicationHelper
  def avatar_url(user, size = 48)  
    default_url = "#{root_url}images/guest-#{size}.png"  
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase  
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"  
  end
  
  def will_paginate_entries(collection, options = {})
    entry_name = options[:entry_name] ||
      (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))

    if collection.total_pages < 2
      case collection.size
      when 0; "No #{entry_name.pluralize} encontrados"
      when 1; "Mostrando 1 #{entry_name}"
      else;   "Mostrando #{collection.size} #{entry_name.pluralize}"
      end
    else
      %{Mostrando #{entry_name.pluralize} %d&nbsp;-&nbsp;%d de %d en total} % [
        collection.offset + 1,
        collection.offset + collection.length,
        collection.total_entries
      ]
    end
  end
end
