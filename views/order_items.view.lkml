view: order_items {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.order_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: gross_margin {
    label: "Gross Margin"
    type: number
    value_format_name: usd
    sql: ${sale_price} - ${inventory_items.cost};;
  }

  dimension: months_since_signup {
    label: "Months Since Signup"
    type: number
    sql: CAST(FLOOR(DATE_DIFF(${created_date}, ${users.created_date}, DAY)/30) AS INT64) ;;
  }


  dimension: shipping_days {
    label: "Shipping Days"
    description: "Difference between Delivered and Shipped Date"
    hidden: yes
    type: number
    sql: DATE_DIFF(${delivered_date}, ${shipped_date}, DAY) ;;
  }


  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_sale_price {
    label: "Totals Order Value"
    description: "Total Order values not considering order status"
    group_label: "Business Measures"
    type: sum
    sql: ${sale_price} ;;
  }

  measure: average_sale_price {
    label: "Average Sale Price Value"
    description: "Average Sale Price not considering order status"
    type: average
    sql: ${sale_price} ;;
  }

  measure: average_shipping_days {
    label: "Average Shipping Days"
    description: "Average difference between Shipped Date and Delivered Date expressed in days"
    group_label: "Logistics Performance"
    type: average
    value_format_name: decimal_1
    sql: ${shipping_days} ;;
  }


  measure: order_count {
    label: "Count Distinct Orders"
    description: "How many unique orders"
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: total_sales_completed_orders {
    label: "Totals Order Value Completed Lines"
    description: "Total Order values for Completed Orders"
    group_label: "Business Measures"
    type: sum
    sql: ${sale_price} ;;
    filters: [status: "Complete"]
  }

  measure: total_gross_margin {
    label: "Total Gross Margin"
    group_label: "Business Measures"
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;
  }

  measure: total_gross_margin_percentage {
    label: "Total Gross Margin Percentage"
    group_label: "Business Measures"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_gross_margin}/ nullif(${total_sale_price},0) ;;
  }


}
