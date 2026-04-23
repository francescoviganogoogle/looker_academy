---
- dashboard: business_pulse__tabbed
  title: Business Pulse Tabbed
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: hhDGqrQdo5BCuqzLM3x4gK
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
      Order Item Creation Date: order_items.created_date
      Category Demo: products.category
      Country: users.country
      State: users.state
    row: 0
    col: 0
    width: 4
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
      State: users.state
    row: 0
    col: 4
    width: 12
    height: 7
    tab_name: Looker Academy - Business Pulse  Tabbed
  - title: Canceled Orders by Age Bucket
    name: Canceled Orders by Age Bucket
    model: thelook_ecommerce
    explore: order_items
    type: looker_column
    fields: [total_order_value_cancelled, age_buckets]
    filters:
      order_items.status: ''
      order_items.created_date: 90 days
    sorts: [total_order_value_cancelled desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Total Order Value Cancelled
      value_format:
      value_format_name: usd
      based_on: order_items.total_sale_price
      _kind_hint: measure
      measure: total_order_value_cancelled
      type: sum
      _type_hint: number
      filters:
        orders.status: Cancelled
    - category: dimension
      description: ''
      label: Age Buckets
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: age_buckets
      args:
      - users.age
      - - label: Teens
          filter: "[0,18]"
        - label: Target
          filter: "(18,30]"
      - Other
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "${total_order_value_cancelled} / ${total_order_value_cancelled:total}"
      label: Canceled by Age Bucket vs Total
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: canceled_by_age_bucket_vs_total
      _type_hint: number
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
    y_axes: [{label: '', orientation: left, series: [{axisId: total_order_value_cancelled,
            id: total_order_value_cancelled, name: Total Order Value Cancelled}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: canceled_by_age_bucket_vs_total, id: canceled_by_age_bucket_vs_total,
            name: Canceled by Age Bucket vs Total}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      canceled_by_age_bucket_vs_total: line
    series_tooltip_options:
      total_order_value_cancelled:
        custom_tooltips_enabled: true
        template: |-
          <div style="padding: 5px 0;">
            <div>null</div>
            <div style="font-weight: bold;">{{ age_buckets }}</div>
          </div>
          <div style="padding: 5px 0;">
            <div>Total Order Value Cancelled</div>
            <div style="font-weight: bold;">{{ total_order_value_cancelled }}</div>
            <div>% Total Order Value Cancelled </div>
             <div style="font-weight: bold;">{{ canceled_by_age_bucket_vs_total }}</div>
          </div>
        style:
          font_size: 12
          font_family: Roboto, 'Noto Sans', 'Noto Sans JP', 'Noto Sans CJK KR', 'Noto
            Sans Arabic UI', 'Noto Sans Devanagari UI', 'Noto Sans Hebrew', 'Noto
            Sans Thai UI', Helvetica, Arial, sans-serif
          font_color: "#FFFFFF"
          background_color: "#262D33"
          border_radius: 4
          border_color: transparent
          box_shadow: none
          align: left
    defaults_version: 1
    hidden_fields: [canceled_by_age_bucket_vs_total]
    hidden_pivots: {}
    listen:
      Order Item Creation Date: order_items.created_date
      Category Demo: products.category
      Country: users.country
      State: users.state
    row: 7
    col: 8
    width: 8
    height: 7
    tab_name: Looker Academy - Business Pulse  Tabbed
  - title: Moving Average
    name: Moving Average
    model: thelook_ecommerce
    explore: order_items
    type: looker_line
    fields: [order_items.total_gross_margin, order_items.created_week]
    sorts: [order_items.total_gross_margin desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: count(offset_list(${order_items.total_gross_margin},0,5))
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${order_items.total_gross_margin},0,5))
      label: moving average
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: moving_average
      _type_hint: number
    - category: table_calculation
      expression: if(${count} >=5 ,${moving_average},null)
      label: Moving Average (5 weeks)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: moving_average_5_weeks
      _type_hint: number
    - category: table_calculation
      expression: if(${count}>=5, ${order_items.total_gross_margin}, null)
      label: Total Sales Margin
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_sales_margin
      _type_hint: number
      is_disabled: true
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
    defaults_version: 1
    hidden_fields: [count, moving_average]
    hidden_pivots: {}
    listen:
      Order Item Creation Date: order_items.created_date
    row: 7
    col: 0
    width: 8
    height: 6
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
      Order Item Creation Date: order_items.created_date
      Brand: products.brand
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
      Brand: products.brand
    row: 0
    col: 8
    width: 8
    height: 8
    tab_name: Brand Lookup
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
