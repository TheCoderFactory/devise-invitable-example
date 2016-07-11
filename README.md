# Example Rails 5 application using [devise_invitable](https://github.com/scambra/devise_invitable)

## App design

User belongs to Account
Account has_many users

## Steps I took

### Add gems
```
gem 'devise'
gem 'simple_form'
gem 'devise_invitable'
```
### Bundle and install gems
```
bundle
rails g simple_form:install
rails g devise:install
rails g devise User
rails g devise_invitable:install
rails g devise_invitable User
rails db:migrate
```
### Create home page
```
rails g controller home index
```
### Set home page to root in `/config/routes.rb`
```
root 'home#index'
```
### Add `account_id` field to User model by creating a migration
```
rails g migration AddAccountIdToUser account_id:references
```
### Add the account scaffold
```
rails g scaffold Account name account_type
rails db:migrate
```
### Add a field to the top of the new account form to capture the account owner email
```
<%= f.input :owner_email %>
```
### Add to `/models/account.rb` to allow this virtual attribute
```
attr_accessor :owner_email
has_many :users
```
### Add `owner_email` to account_params method in `/app/controllers/accounts_controller.rb`
```
def account_params
  params.require(:account).permit(:name, :account_type, :active, :owner_email)
end
```
