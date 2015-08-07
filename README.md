# RailsAdminGrid
[![Gem Version](https://badge.fury.io/rb/rails_admin_grid.svg)](http://badge.fury.io/rb/rails_admin_grid)

RailsAdminGrid is a custom collection action for [RailsAdmin](https://github.com/sferik/rails_admin) that displays objects in a grid with thumbnails. It provides an alternative to the default list view provided in RailsAdmin.

## Preview

![alt tag](https://raw.githubusercontent.com/colavitam/rails_admin_grid/master/static/rails_admin_grid.jpg)

## Installation

Add the following to your Gemfile **before rails_admin**:
```ruby
gem 'rails_admin_grid'
```

## Configuration

### Global

You must add the custom action to the list of actions in your global RailsAdmin configuration. The default, with RailsAdminGrid added, looks like this:

```ruby
# config/initializers/rails_admin.rb
RailsAdmin.config do |config|
  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions 
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app

    grid                          # RailsAdminGrid
  end
end
```

Since RailsAdminGrid works best for displaying models with an associated picture, it may not be desirable to use on every model. You can restrict the models for which the action is available using the steps described [here](https://github.com/sferik/rails_admin/wiki/Actions#per-model-basis).

### Model

To configure RailsAdminGrid's behavior on a specific model, you must include a `grid` block in your model configuration, as such:

```ruby
rails_admin do
  grid do
    thumbnail_method do
      :thumb
    end
  end
end
```

The only information RailsAdmin requires to function properly is a `thumbnail_method`, a method which it will use to retrieve the corresponding thumbnail for the object. Visible fields and copes can also be configured in this block.

These properties must be specified in the `list` block instead of the `grid` block:
* items_per_page
* sort_reverse
* sort_by
