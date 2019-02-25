# explore: hello_world {}

include: "system_fields.view"
view: hello_world {
  extends: [system_fields]
  sql_table_name: demo_db.orders ;;

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
  }
}
