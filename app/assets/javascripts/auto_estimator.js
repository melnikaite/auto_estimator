var AE = {
  handle_new_object_forms: function (objects) {
    $.each(objects, function () {
      var item = this;
      $(".add_new_" + item + "_button").click(function () {
        $(".new_" + item + "_form").show();
      });
      $(".cancel_new_" + item + "_button").click(function () {
        $(".new_" + item + "_form").hide();
        $(".new_" + item + "_form form")[0].reset();
        return false;
      });
    });
  },
  update_feature_range: function (event, ui) {
    var li = $(this).closest("li");
    $(li).find(".optimistic").text(ui.values[0]);
    $(li).find(".most_likely").text(ui.values[1]);
    $(li).find(".pessimistic").text(ui.values[2]);
  },
  save_feature_range: function (event, ui) {
    var li = $(this).closest("li");
    var id = $(li).attr("data-id");
    if(!$(li).attr("data-initialized")) return;
    $.ajax({
      url: "/features/" + id,
      type: "put",
      data: {
        optimistic: ui.values[0],
        most_likely: ui.values[1],
        pessimistic: ui.values[2]
      }
    });
  },
  set_values_for_feature_range: function (event, ui) {
    var li = $(this).closest("li");
    var values = [];
    values.push($(li).find(".optimistic").text());
    values.push($(li).find(".most_likely").text());
    values.push($(li).find(".pessimistic").text());
    $(this).slider("values", values);
    $(li).attr("data-initialized", true);
  }
}
