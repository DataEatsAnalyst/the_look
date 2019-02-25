connection: "thelook"
# label: "The Look"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

access_grant: can_see_pii {
  user_attribute: can_see_pii
  allowed_values: ["yes"]
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: one_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id};;
    relationship: many_to_one
  }
}

explore: users {
  # access_filter: {
  #   field: country
  #   user_attribute: department
  # }
}
