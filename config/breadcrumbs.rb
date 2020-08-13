crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :logout do
  link "ログアウト", logout_index_path(current_user.id)
  parent :mypage
end

crumb :newcard do
  link "カード情報登録", new_card_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", new_user_path
  parent :root
end

crumb :bought_items do
  link "購入済み商品", new_item_path
  parent :root
end

crumb :all_items do
  link "商品一覧", items_path
  parent :root
end

crumb :item do
  link "商品詳細", item_path
  parent :all_items
end

crumb :new_item do
  link "新規出品", new_item_path
  parent :root
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).