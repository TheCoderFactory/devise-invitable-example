# Example Rails 5 application using [devise_invitable](https://github.com/scambra/devise_invitable)

## App design

User belongs to Account
Account has_many users

## Steps I took

1. Add gems
```
gem 'devise'
gem 'simple_form'
gem 'devise_invitable'
```
2. Bundle and install gems
```
bundle
rails g simple_form:install
rails g devise:install
rails g devise User
rails g devise_invitable:install
rails g devise_invitable User
rails db:migrate
```
3. Create home page
```
rails g controller home index
```
4. Set home page to root in `/config/routes.rb`
```
root 'home#index'
```
5. Add `account_id` field to User model by creating a migration
```
rails g migration AddAccountIdToUser account_id:references
```
6. Add the account scaffold
```
rails g scaffold Account name account_type
rails db:migrate
```
7. Add a field to the top of the new account form to capture the account owner email
```
<%= f.input :owner_email %>
```
8. Add to `/models/account.rb` to allow this virtual attribute
```
attr_accessor :owner_email
has_many :users
```
9. Add `owner_email` to strong parameters in `/app/controllers/accounts_controller.rb`
```
