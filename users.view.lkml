view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    group_label: "Address"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: email {
    required_access_grants: [can_see_pii]
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    required_access_grants: [can_see_pii]
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    required_access_grants: [can_see_pii]
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    group_label: "Address"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    group_label: "Address"
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  # dimension: looker_logo {
  #   sql: 1 ;;
  #   html: <img src="https://docs.looker.com/assets/images/Looker_Logo_Purple.png" /> ;;
  # }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: female_count {
    type: count
    filters: {
      field: gender
      value: "f"
    }
    drill_fields: [detail*]
  }

  measure: male_count {
    type: count
    filters: {
      field: gender
      value: "m"
    }
    drill_fields: [detail*]
  }

  measure: percent_female {
    type: number
    sql: 1.0 * ${female_count}/NULLIF(${count},0) ;;
    value_format_name: percent_1
  }

  measure: percent_male {
    type: number
    sql: 1.0 * ${male_count}/NULLIF(${count},0) ;;
    value_format_name: percent_1
  }

  set: detail {
    fields: [id, email, first_name, last_name, gender, age, events.count, orders.count]
  }
}
