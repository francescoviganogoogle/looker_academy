include: "/**/thelook_ecommerce.model"
view: order_facts {
  view_label: "Order Facts"
  derived_table: {
    explore_source: order_items {
      column: order_id {field: orders.order_id }
      column: user_id {field: orders.user_id }
      column: created_at {field: orders.created_raw}
      column: order_gross_margin {field: order_items.total_gross_margin}
      column: order_amount { field: order_items.total_sale_price }
      column: items_in_order { field: order_items.count }
      derived_column: order_sequence_number {
        sql: RANK() OVER (PARTITION BY user_id ORDER BY created_at) ;;
      }
    }
    # sql: {% raw %}
    # SELECT order_id,user_id,created_at,order_gross_margin,order_amount,items_in_order,RANK() OVER (PARTITION BY user_id ORDER BY created_at) as order_sequence_number
    # FROM (

    # SELECT
    # orders.order_id  AS order_id,
    # orders.user_id  AS user_id,
    # orders.created_at  AS created_at,
    # COALESCE(SUM(( order_items.sale_price - inventory_items.cost ) ), 0) AS order_gross_margin,
    # COALESCE(SUM(order_items.sale_price ), 0) AS order_amount,
    # COUNT(*) AS items_in_order,
    # FROM `bigquery-public-data.thelook_ecommerce.order_items`  AS order_items
    # LEFT JOIN `bigquery-public-data.thelook_ecommerce.inventory_items`  AS inventory_items ON inventory_items.id = order_items.inventory_item_id
    # LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders`  AS orders ON orders.order_id = order_items.order_id
    # GROUP BY
    # orders.order_id   ,
    # orders.user_id   ,
    # orders.created_at) as order_facts {% endraw %} ;;
    #datagroup_trigger: new_date
  }

  dimension: order_id {
    label: "Order ID"
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: items_in_order {
    label: "Items in Order"
    type: number
    sql: ${TABLE}.items_in_order ;;
  }

  dimension: order_amount {
    label: "Order Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_amount ;;
  }


  dimension: order_gross_margin {
    label: "Order Gross Margin"
    type: number
    value_format_name: usd
  }

  dimension: order_sequence_number {
    label: "Order Sequence Number"
    type: number
    sql: ${TABLE}.order_sequence_number ;;
  }

  dimension: is_first_purchase {
    label: "Is First Purchase"
    type: yesno
    sql: ${order_sequence_number} = 1 ;;
  }
}
