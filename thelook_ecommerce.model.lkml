connection: "looker_academy"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

include: "/dashboards/*.dashboard.lookml"


explore: order_items {


  join: inventory_items {
    view_label: "Inventory Items"
    type: left_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    fields: [inventory_items.cost]
  }

  join: users {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: products {
    view_label: "Products"
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id} ;;
  }


  join: orders {
    view_label: "Orders"
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }


}

explore: users {

  fields: [ALL_FIELDS*,-order_items.gross_margin,-order_items.total_gross_margin, -order_items.analyze_by, -order_items.analyze_by_selector]

  join: order_items {
    view_label: "Order Items"
    type: left_outer
    relationship: one_to_many
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }


}
