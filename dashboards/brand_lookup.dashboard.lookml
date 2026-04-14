- dashboard: brand_lookup
  title: Brand Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    #tile_separator_color: "#faf3f3"
    #tile_border_radius: 5
    #show_tile_shadow: false
    # tile_separator_color: "#faf3f3"
    # tile_border_radius: 5
    # show_tile_shadow: false
    text_tile_text_color: "#556d7a"
  elements:
  - title: Total Orders
    name: Total Orders
    model: thelook_ecommerce
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters: {}
    sorts: [order_items.order_count desc]
    limit: 500
    font_size: medium
    text_color: black
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 2
    col: 8
    width: 4
    height: 3
  - title: Total Customers
    name: Total Customers
    model: thelook_ecommerce
    explore: order_items
    type: single_value
    fields: [users.count]
    filters: {}
    sorts: [users.count desc]
    limit: 500
    font_size: medium
    text_color: black
    note_state: expanded
    note_display: hover
    note_text: I've added a note
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 2
    col: 0
    width: 4
    height: 3
  - title: Average Order Value
    name: Average Order Value
    model: thelook_ecommerce
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    filters: {}
    sorts: [order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    font_size: medium
    text_color: black
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 2
    col: 4
    width: 4
    height: 3


  - title: Sales and Sale Price Trend
    name: Sales and Sale Price Trend
    model: thelook_ecommerce
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.total_sale_price, order_items.average_sale_price]
    filters: {}
    sorts: [order_items.total_sale_price desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axis_labels: [Total Sale Amount, Average Selling Price]
    x_axis_label: Order Date
    hide_legend: true
    colors: ["#F2B431", "#57BEBE"]
    series_colors: {}
    y_axis_orientation: [left, right]
    x_axis_datetime: true
    hide_points: true
    color_palette: Custom
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 2
    col: 12
    width: 12
    height: 7
  - title: Top Purchasers of Brand
    name: Top Purchasers of Brand
    model: thelook_ecommerce
    explore: order_items
    type: looker_grid
    fields: [users.name, users.email, order_items.count, order_items.total_sale_price,
      users.state]
    filters: {}
    sorts: [order_items.count desc]
    limit: 15
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 42
    col: 0
    width: 12
    height: 8


  - title: Brand  over Customer Lifetime
    name: Brand  over Customer Lifetime
    model: thelook_ecommerce
    explore: order_items
    type: looker_line
    fields: [order_items.months_since_signup, products.brand,
      order_items.total_sale_price]
    filters:
      order_items.months_since_signup: "<=18"
    sorts: [order_items.months_since_signup]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{id: products.brand,
            name: Brand, axisId: products.brand,}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{id: order_items.total_sale_price, name: Total
              Sales - This Brand, axisId: order_items.total_sale_price}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors: {}
    defaults_version: 1
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 9
    col: 12
    width: 12
    height: 6
  - title: Most Popular Categories
    name: Most Popular Categories
    model: thelook_ecommerce
    explore: order_items
    type: looker_column
    fields: [products.category, products.department, order_items.total_sale_price]
    pivots: [products.department]
    sorts: [products.department 0, order_items.total_sale_price desc 2]
    limit: 500
    column_limit: 50
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_types: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 5
    col: 0
    width: 12
    height: 10
  - name: "<span class='fa fa-dollar'> Brand Overview </span>"
    type: text
    title_text: "<span class='fa fa-dollar'> Brand Overview </span>"
    subtitle_text: What are the high level revenue metrics for this brand?
    row: 0
    col: 0
    width: 24
    height: 2

  - name: "<span class='fa fa-users'> Top Customers </span>"
    type: text
    title_text: "<span class='fa fa-users'> Top Customers </span>"
    subtitle_text: Who are our highest valued customers?
    body_text: "**Recommended Action** Explore from here to see what products a user\
      \ has purchased and include them in a targeted advertising campaign"
    row: 39
    col: 0
    width: 24
    height: 3
  filters:
  - name: Brand Name
    title: Brand Name
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    model: thelook_ecommerce
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: thelook_ecommerce
    explore: order_items
    listens_to_filters: []
    field: users.state
