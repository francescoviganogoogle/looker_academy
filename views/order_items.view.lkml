view: order_items {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.order_items` ;;
  drill_fields: [id]


  parameter: metric_selector {

    type: string
    allowed_value: {
      label: "Count"
      value: "count"
    }
    allowed_value: {
      label: "Average Sale Price Value"
      value: "average_sales"
    }
    allowed_value: {
      label: "Total Order Value"
      value: "total_sales"
    }
  }

  measure: metric {
    label_from_parameter: metric_selector
    type: number
    sql:
          CASE
            WHEN {% parameter metric_selector %} = 'count'
              THEN ${count}
            WHEN {% parameter metric_selector %} = 'average_sale_price'
              THEN ${average_sale_price}
          WHEN {% parameter metric_selector %} = 'total_sales'
              THEN ${total_sale_price}
            ELSE NULL
          END ;;
    value_format_name: decimal_2
  }

  parameter: analyze_by {
    type: unquoted
    allowed_value: { value: "Country_Name" label: "Country Name"}
    allowed_value: { value: "Category" label: "Category Name" }
    allowed_value: { value: "Deparment" label: "Department"}
    default_value: "CountryName"
    hidden: no
  }

  dimension: analyze_by_selector {
    label_from_parameter: analyze_by
    hidden: no
    sql:

      {% if analyze_by._parameter_value == 'Country_Name' %}
      ${users.country}
      {% elsif analyze_by._parameter_value == 'Category' %}
      ${products.category}
      {% elsif analyze_by._parameter_value == 'Deparment' %}
      ${products.department}
      {% else %}
      NULL
      {% endif %} ;;

  }

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

    html:
    {% if value == 'Complete' %} ✅
    {% elsif value == 'Shipped' %} 🚢
    {% elsif value == 'Processing' %} ⏳
    {% elsif value == 'Cancelled' %} ❌
    {% elsif value == 'Returned' %} ↩️
    {% endif %}
    {{ value }}
  ;;
  }
  dimension: user_id {
    type: string
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
    value_format_name: decimal_1
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

  filter: date_filter {
    type: date
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: {% condition date_filter %} ${created_raw} {% endcondition%} ;;
  }

  dimension: selected_period_length {
    hidden: yes
    type: number
    sql: DATE_DIFF(DATE({% date_end date_filter%}),DATE({% date_start date_filter %}),DAY) ;;
  }

  dimension: parallel_period_start {
    hidden: yes
    type: date
    sql: DATE_SUB(DATE({% date_start date_filter %}),INTERVAL ${selected_period_length} DAY) ;;
  }

  dimension: parallel_period_end {
    hidden: yes
    type: date
    sql: DATE_SUB(DATE({% date_end date_filter %}),INTERVAL ${selected_period_length} DAY) ;;
  }

  dimension: is_parallel_period {
    hidden: yes
    type: yesno
    sql: ${created_date} >= ${parallel_period_start} and ${created_date} < ${parallel_period_end} ;;
  }

  measure: total_sales_price_current {
    type:  sum
    sql: ${sale_price} ;;
    filters: {
      field: is_current_period
      value: "Yes"
    }
    hidden: yes
  }

  measure: total_sales_price_parallel {
    type:  sum
    sql: ${sale_price} ;;
    filters: {
      field: is_parallel_period
      value: "Yes"
    }
    hidden: yes

  }

  dimension_group:created_comparison  {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: case when ${is_current_period} then ${created_raw}
              when ${is_parallel_period} then TIMESTAMP_ADD(${created_raw},INTERVAL ${selected_period_length} DAY)
              else ${created_raw} end;;

  }

  measure: total_sales_comparison {
    type: number
    sql:  SAFE_DIVIDE(${total_sales_price_current} , ${total_sales_price_parallel}) ;;
    value_format_name: percent_2
  }



}
