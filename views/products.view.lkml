view: products {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.products` ;;
  drill_fields: [name, department, order_items.total_sale_price]

  filter: category_selector {
    type: string
    suggest_dimension: products.category
    suggest_explore: order_items

  }

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    drill_fields: [name]

    link: {
      label: "{{value}} Lookup"
      url: "/dashboards/thelook_ecommerce::brand_lookup?Brand%20Name={{ value | encode_uri }}&Date=90%20days&State={{ _filters['users.state'] | url_encode }}"
      icon_url: "https://www.seekpng.com/png/full/138-1386046_google-analytics-integration-analytics-icon-blue-png.png"
    }

    action: {
      label: "Start Adwords Campaign"
      url: "https://random.com"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      param: {
        name: "auth_code"
        value: "abc123456"
      }
      form_param: {
        type: select
        name: "Campaign Type"
        option: { name: "Spend" label: "Spend" }
        option: { name: "Leads" label: "Leads" }
        option: { name: "Website Traffic" label: "Website Traffic" }
        required: yes
      }
      form_param: {
        name: "Campaign Name"
        type: string
        required: yes
        default: "{{ value }} Campaign"
      }

      form_param: {
        name: "Budget"
        type: string
        required: yes
      }
    }
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    drill_fields: [brand, name]
  }

  dimension: category_comparison {
    type: string
    sql: case when {% condition category_selector %} ${category} {% endcondition %} then ${category} else 'Other categories' end;;

  }

  dimension: cost {
    label: "Standard Cost"
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
    drill_fields: [category, brand, name]

  }
  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    #drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }

  measure: average_cost {
    label: "Average Standard Cost"
    type: average
    sql: ${cost} ;;
  }


}
