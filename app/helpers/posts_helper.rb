module PostsHelper
  def render_with_hashtags(hashbody)
      hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー０-９]+/) { |word| link_to word, "/post/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end