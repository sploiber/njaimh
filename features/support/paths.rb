module NavigationHelpers
  def path_to(page_name)
    case page_name
      when /the home\s?page$/
        '/'
      when /the member page for "([^\"]*)"/
        first_n, last_n = $1.split(" ")
        member_path(Member.scoped(:conditions => { :first_name => first_n, :last_name => last_n }).first)
      when /the practice area page for "([^\"]*)"/
        practice_area_path(PracticeArea.scoped(:conditions => { :name => $1 }).first)
      end
  end
end
World(NavigationHelpers)
