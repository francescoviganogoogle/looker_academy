---
- dashboard: tabbed_dashboard
  title: Business Pulse  Tabbed
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: wNHaaT4OJobl0e8ZFRupAx
  theme_name: ''
  layout: newspaper
  tabs:
  - name: Looker Academy - Business Pulse  Tabbed
    label: Looker Academy - Business Pulse  Tabbed
  - name: Brand Lookup
    label: Brand Lookup
  elements:
  - title: Average Order Value
    name: Average Order Value
    model: thelook_ecommerce
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    filters:
      order_items.created_date: 90 days
      users.state: ''
      products.brand: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    listen:
      State: users.state
      Order Item Creation Date: order_items.created_date
      Category Demo: products.category
      Country: users.country
    row: 0
    col: 0
    width: 2
    height: 3
    tab_name: Looker Academy - Business Pulse  Tabbed
  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: thelook_ecommerce
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_month_name, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_year]
    filters:
      order_items.created_year: 3 years
    sorts: [order_items.created_year, order_items.created_month_name]
    limit: 500
    column_limit: 50
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Category Demo: products.category
      Country: users.country
    row: 0
    col: 2
    width: 8
    height: 11
    tab_name: Looker Academy - Business Pulse  Tabbed

  - title: Top 10 Categories
    name: Top 10 Categories
    model: thelook
    explore: order_items
    type: looker_column
    fields: [products.category, order_items.total_gross_margin]
    sorts: [order_items.total_gross_margin desc 0]
    limit: 10
    column_limit: 50
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
    stacking: ''
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
    defaults_version: 1
    listen:
      Brand: products.brand
      Order Item Creation Date: order_items.created_date
      Category Filter: products.category
      Country: users.country
    row: 0
    col: 0
    width: 8
    height: 8
    tab_name: Brand Lookup

  - title: Totals Sales by Category and Department
    name: Totals Sales by Category and Department
    model: thelook_ecommerce
    explore: order_items
    type: looker_column
    fields: [products.category, products.department, order_items.total_sale_price]
    pivots: [products.department]
    sorts: [products.department, order_items.total_sale_price desc 2]
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
    limit_displayed_rows: true
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
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_pivots:
      "$$$_row_total_$$$":
        is_entire_pivot_hidden: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Item Creation Date: order_items.created_date
    row: 0
    col: 10
    width: 8
    height: 11
    tab_name: 'Brand Lookup'


  filters:
  - name: Order Item Creation Date
    title: Order Item Creation Date
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook_ecommerce
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: Category Demo
    title: Category Demo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: products.category
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook_ecommerce
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: thelook_ecommerce
    explore: order_items
    listens_to_filters: []
    field: users.country
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook_ecommerce
    explore: order_items
    listens_to_filters: [Country]
    field: users.state
