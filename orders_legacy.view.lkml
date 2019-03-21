view: orders_legacy {
  sql_table_name: public_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    view_label: "Crazy Label"
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    view_label: "Crazy Label"
    label: "Order Count"
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
  }
}
