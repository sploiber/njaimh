module NavigationHelpers
  def path_to(page_name)
    case page_name
      when /the home\s?page$/
        '/'
      when /the member page for "([^\"]*)"/
        first_n, last_n = $1.split(" ")
        member_path(Member.scoped(:conditions => { :first_name => first_n, :last_name => last_n }).first)
      end
  end
end
World(NavigationHelpers)
