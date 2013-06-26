module Admin::PostsHelper
  def remove_ext(file)
    file.gsub(/\.[^.]+$/, "")
  end
end
