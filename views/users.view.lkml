view: users {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.users` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    required_access_grants: [can_see_sensitive_data]
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_buckets {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: interval
    sql: ${age} ;;
    value_format_name: id
  }


  dimension: city {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: name {
    required_access_grants: [can_see_sensitive_data]
    label: "Name"
    description: "Full user name"
    sql: concat(${first_name}, ' ', ${last_name}) ;;
  }

  dimension: gender {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: latitude {
    required_access_grants: [can_see_sensitive_data]
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    required_access_grants: [can_see_sensitive_data]
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: postal_code {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: state {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: street_address {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.street_address ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: user_geom {
    required_access_grants: [can_see_sensitive_data]
    type: string
    sql: ${TABLE}.user_geom ;;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, orders.count, events.count]
  }
}
